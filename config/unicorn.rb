#---------------------------------------------------------------------------------------------------
# Mostly copied from GitHub's [blog](https://github.com/blog/517-unicorn)
# Some modifications per [Unicorn Configurator](http://unicorn.bogomips.org/Unicorn/Configurator.html#method-i-working_directory)
#---------------------------------------------------------------------------------------------------
# Global Configurations

# The unicorn binary is a Rack-only tool so -E environment will set the RACK_ENV first
# [Source](http://www.engineyard.com/blog/2010/everything-you-need-to-know-about-unicorn/)
ENV["RAILS_ENV"]   = ENV["RACK_ENV"] || "development"

puts "Rack environment:  #{ENV['RACK_ENV']}"
puts "Rails Environment: #{ENV['RAILS_ENV']}"


# Listen on a Unix data socket and file paths for PID and logging.
working_directory = "/opt/dmitriskj"
pid_directory     = working_directory + "/unicorn.pid"

# Restart any workers that haven't responded in 30 seconds
timeout 30


# If we're in production, we want to preload our app before forking workers in order to save memory.
# As a result, we have to configure dependent sockets in before_fork and after_fork.
#
# If we're in development, we will not preload the app.
if ENV["RAILS_ENV"] == "production"
  #---------------------------------------------------------------------------------------------------
  # Server Config

  listen            "/tmp/unicorn.sock", :backlog => 2048
  pid               pid_directory
  stderr_path       (working_directory + "/log/unicorn.stderr.log")
  stdout_path       (working_directory + "/log/unicorn.stdout.log")


  #---------------------------------------------------------------------------------------------------
  # Worker Config

  worker_processes 10
  preload_app true

  # This is called before forking each worker.
  before_fork do |server, worker|
    # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
    # immediately start loading up a new version of itself (loaded with a new
    # version of our app). When this new Unicorn is completely loaded
    # it will begin spawning workers. The first worker spawned will check to
    # see if an .oldbin pidfile exists. If so, this means we've just booted up
    # a new Unicorn and need to tell the old one that it can now die. To do so
    # we send it a QUIT.
    #
    # Using this method we get 0 downtime deploys.
    if defined?(ActiveRecord::Base)
      ActiveRecord::Base.connection.disconnect!
      Rails.logger.info("Disconnected from ActiveRecord.")
    end

    old_pid = "/var/pid/unicorn.pid.oldbin"
    if File.exists?(old_pid) && server.pid != old_pid
      begin
        Process.kill("QUIT", File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
        # someone else did our job for us
      end
    end

    sleep 1
  end

  # This is called after forking each worker.
  after_fork do |server, worker|
    # Unicorn master loads the app then forks off workers - because of the way
    # Unix forking works, we need to make sure we aren't using any of the parent's
    # sockets, e.g. db connection
    ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
  end
else
  #---------------------------------------------------------------------------------------------------
  # Server Config
  listen            "127.0.0.1:8080"
  pid               pid_directory


  #---------------------------------------------------------------------------------------------------
  # Worker Config

  worker_processes 1
end

#---------------------------------------------------------------------------------------------------