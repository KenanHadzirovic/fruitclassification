function [ trainingFeatures ] = generateDescriptor( path, files )
%GENERATEHOGFEATURES Summary of this function goes here
%   Detailed explanation goes here

[numberOffiles ~] = size(files);
sampleImage = imread(strcat(path,'\', char(files(1))));
[hog_nxm, ~] = extractHOGFeatures(sampleImage);%,'CellSize',[2 2]);
hogFeatureSize = length(hog_nxm);
trainingFeatures = zeros(numberOffiles, hogFeatureSize, 'single');
disp('Creating descriptors...')
for i = 1:numberOffiles
    %disp(i);
    filename = char(files(i));
    img = imread(strcat(path,'\', filename));
    trainingFeatures(i, :) = extractHOGFeatures(img);
end

end

