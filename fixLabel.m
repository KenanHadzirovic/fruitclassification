function [ outputString ] = fixLabel( inputString )
%FIXLABEL Summary of this function goes here
%   Detailed explanation goes here
    outputString = regexprep(inputString,'[1234567890_]','');
    outputString = regexprep(outputString,'.jpg','');

end

