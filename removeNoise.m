function [ outputImage ] = removeNoise( originalImage )
%REMOVENOISE function removes the noise from the image by using blurring.
%   2D order statistich and median filters are used to remove the noise
%   from the image and it appears blurred.

%%grayImage = rgb2gray(originalImage);
outputImage = zeros(size(originalImage),'uint8');
for i = 1:3
    outputImage(:,:,i) = ordfilt2(originalImage(:,:,i),3,ones(3,3));
    %outputImage(:,:,i) = medfilt2(originalImage(:,:,i));
end
end

