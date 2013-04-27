function vector=price(priceVector,choices);

vector = [priceVector, priceVector(end) + sum(choices)];
end
