function choice = playerChoice(rumor,confidence,N);
% Name: playerChoice.m
% Input: rumor: the analyst's value of the stock (from 0% to 100%)
%        Confidence: The value at which the investor will buy (above 'confidence'%)
%        or sell (below 'confidence'%)
%        N: The amount the investor will buy/sell at choice point.
if (rumor > confidence)
	 choice = N; %buy
elseif (rumor < confidence)
	 choice = -N; %sell
else
	 choice = 0; %stay
end
end
