function [ outputImage ] = enhanceHistogramColorChannel( originalImage )
%ENHANCEHISTOGRAMCOLORCHANNEL uses histogram equalization on 3 colors.
outputImage = zeros(size(originalImage),'uint8');
for i = 1 : 3
    outputImage(:,:,i) = histeq(originalImage(:,:,i));
end
end
