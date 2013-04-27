function plotGame(priceVector);

timeSpan = length(priceVector) - 1; % since timeSpan assumes we're counting from 1.
time = 0:1:timeSpan;
% Stops if the stock goes below zero
bankrupt = find(priceVector < 0);
if(length(bankrupt) == 0)
    validLength = length(time);
else
    validLength = bankrupt(1);
    sprintf('Bankrupt!')
end

% Plot the results
plot(time(1:validLength),priceVector(1:validLength));
xlabel('Time (days)','fontsize',20);
ylabel('Price ($)','fontsize',20);
%axis([0, timeSpan, 0, max(priceVector)]);
end