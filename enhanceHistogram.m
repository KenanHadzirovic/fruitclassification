function [outputImage] = enhanceHistogram( originalImage )
%EnhanceHistogram function uses histogram equalization to enhance images.
%   Histogram equalization on greyscale images.
    greyscaleImage=rgb2gray(originalImage);
    outputImage = histeq(greyscaleImage);
end
