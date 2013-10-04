function priceVector = game(initialPrice,typePlayers,environment,input,timeSpan);
% Name: game.m
% Purpose: Performs the stock game.
% Input: initial price of the stock, volatility stock, type of players (matrix),
% 	 type of environment (cooperative,fraudulent,random,news), timeSpan (how long)
% Output: priceVector

% If user inputs stuff, change timeSpan to length of input
if(length(input) ~= 0)
    timeSpan = length(input);
end

% Define priceVector, numPlayers, recommendation, playerChoices
priceVector = [initialPrice];
numPlayers = length(typePlayers);
recommendation = zeros(1,numPlayers);
playerChoices = zeros(1,numPlayers);

% Run through timeSpan
for ii = 1:timeSpan;
    if strcmp(environment,'Common Information')
        recommendation = rand*100;
        for jj=1:numPlayers;
            playerChoices(jj) = playerChoice(recommendation, typePlayers(jj,1),typePlayers(jj,2));
        end
    elseif strcmp(environment,'Random')
        for jj=1:numPlayers;
            recommendation(jj) = rand*100;
            playerChoices(jj) = playerChoice(recommendation(jj), typePlayers(jj,1),typePlayers(jj,2));
        end
    elseif strcmp(environment,'User Input')
        for jj=1:numPlayers;
            recommendation(jj) = input(ii);
            playerChoices(jj) = playerChoice(recommendation(jj), typePlayers(jj,1),typePlayers(jj,2));
        end
    end
    priceVector=price(priceVector, playerChoices);
end

