function [ ] = calculateAccuracy( TP, TN, OP, ON )
%CALCULATEACCURACY Summary of this function goes here
%   Detailed explanation goes here

ACC = (TP+TN)/OP+ON
SEN = TP/OP
SPE = TN/ON

end

