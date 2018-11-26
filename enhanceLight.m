function [outputImage] = enhanceLight( originalImage )
%LightEnhance should enhance the lighter parts of the image.
%Function that is supposed to enhance the foreground light by removing 
%backlight from the image.
%https://www.mathworks.com/help/images/correcting-nonuniform-illumination.html

outputImage = imadjust(originalImage,[.2 .3 0; .6 .7 1],[]);
%reduce haze method added in later version of MATLAB
end

