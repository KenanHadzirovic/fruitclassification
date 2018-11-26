function [ outputImage ] = applySharpen( originalImage )
%APPLYSHARPEN function is sharpening the edges and removing blured parts.
%   Function is using Gaussian High Pass filter and applying it to the
%   image as a filter. It is then subtracted from the image to get the
%   sharp parts which are finally applied to the function to appear more
%   visible.

%% First option
H = padarray(2,[2 2]) - fspecial('gaussian' ,[5 5],2); % create unsharp mask % create unsharp mask
outputImage = imfilter(originalImage,H);  % create a sharpened version of the image using that mask
% imshowpair(originalImage, outputImage,'montage'); %showing input & output images

%% Other option
% outputImage = zeros(size(originalImage),'uint8');
% for i = 1 : 3
%    outputImage(:, :, i) = imgaussfilt(originalImage(:, :, i), 2);
% end
% outputImage = originalImage - outputImage;
% outputImage = originalImage + outputImage;
% %imshowpair(originalImage, outputImage, 'montage');

end

