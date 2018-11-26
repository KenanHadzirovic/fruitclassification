function [ outputImage ] = enhanceHistogramColor( originalImage )
%ENHANCEHISTOGRAMCOLOR color version of histogram using HSI format.
%   Using HSI format to manipulate intensity component and create a
%   histogram based on that array alone. Converting back to RGB once
%   complete.

%Convert to HSI image.
HSV = rgb2hsv(originalImage); %% Hue ,Saturation and Intensity

%PERFORM HISTOGRAM EQUALIZATION ON INTENSITY COMPONENT
Heq = histeq(HSV(:,:,3));
HSV_mod = HSV;
HSV_mod(:,:,3) = Heq;

%Convert back to rgb
outputImage = hsv2rgb(HSV_mod);

end

