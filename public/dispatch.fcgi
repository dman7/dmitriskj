#!/bin/bash

# Copied from: http://blog.micahchalmer.net/blog/2012/dreamhost-shared-hosting-rbenv
# and: https://gist.github.com/MicahChalmer/4316253
this_dir=`dirname $0`

#this_dir=`/home/dmitriskj/dmitriskj.com`
# echo $this_dir

unset GEM_HOME
unset GEM_PATH
export PATH=~/.rbenv/bin:"$PATH"
eval "$(~/.rbenv/bin/rbenv init -)"
err_log_file="/home/dmitriskj/dmitriskj.com/log/dispatch_err.log"
exec ~/.rbenv/shims/ruby "${this_dir}/dispatch_fcgi.rb" "$@" 2>>"${err_log_file}"