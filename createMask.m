function [ outputImage ] = createMask( originalImage, Xmin, Xmax, Ymin, Ymax )
%CREATEMASK creates a mask for a given image.
%   Mask can be further applied to the image to create a resulting image
%   which only includes the annotated areas.
[height, width, ~] = size(originalImage);
outputImage = zeros(height,width);
for i = 1:height
    for j = 1:width
        if j > Xmin && j < Xmax && i > Ymin && i < Ymax
            outputImage(i,j) = 1;
        end
    end
end
end

