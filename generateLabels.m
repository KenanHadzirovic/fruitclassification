function [ labelNames, files ] = generateLabels( path )
%GENERATELABELS Summary of this function goes here
%   Detailed explanation goes here

files = dir(fullfile(path, '*.jpg'));
files = transpose({files.name});
labelNames = fixLabel(files);

end

