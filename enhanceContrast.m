function [ outputImage ] = enhanceContrast(originalImage)
%CONTRASTENHANCE function enhances contrast of the image by using stretching.
%   Stretcing the image contrast to the limit provided by the format.
    stretchedImage = stretchlim(originalImage);
    outputImage = imadjust(originalImage,stretchedImage,[]);
end