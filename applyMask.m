function [ outputImage ] = applyMask( originalImage, Xmin, Xmax, Ymin, Ymax )
%APPLYFILTER Function that applies mask per given coordinates
%   When given size of image and coordinates, apply mask to the area not
%   included in Xmin, Xmax, Ymin, Ymax
[height, width, ~] = size(originalImage);
for i = 1:height
    for j = 1:width
        if j < Xmin || j > Xmax || i < Ymin || i > Ymax
            originalImage(i,j,1) = 0;
            originalImage(i,j,2) = 0;
            originalImage(i,j,3) = 0;
        end
    end
end
outputImage = originalImage;
end