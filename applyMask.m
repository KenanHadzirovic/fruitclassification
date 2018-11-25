function [ outputImage ] = applyMask( originalImage, Xmin, Xmax, Ymin, Ymax )
%APPLYFILTER Function that applies mask per given coordinates
%   When given size of image and coordinates, apply mask to the area not
%   included in Xmin, Xmax, Ymin, Ymax
[height, width, ~] = size(originalImage);

end