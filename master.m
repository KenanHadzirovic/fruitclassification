function [] = master()
% master function that is called to generate output images in the dataset.
global path;
path = strcat(pwd,'\Dataset\train\images\cropped');
global Filename;
global Xmin; global Xmax;
global Ymin; global Ymax;
global Xsize;global Ysize
Xsize = 500;  
Ysize = 500;
%% IMPORT DATA
disp('Declared global variables. Importing dataset information...');
[Filename,Xmin,Ymin,Xmax,Ymax] = importfile(strcat(pwd,'\Dataset\train\imageInformation.csv'), 2, 466);
%% Creating masked images
disp('Creating masked images...');
imageMask(Filename, Xmax, Xmin, Ymax, Ymin);
%% Croping images
disp('Cropping images...');
cropImages(Filename, Xmax, Xmin, Ymax, Ymin);
%% Resizing images
disp('Resizing images...');
applyFunctionOnFiles(path, @resizeImage, '');
%% Applying filters
disp('Removing noise from images...')
applyFunctionOnFiles(path,@removeNoise,'noiseremoved');
disp('Applying sharpening filter...');
applyFunctionOnFiles(path,@applySharpen,'sharpen');
%% Applying enhancements
disp('Applying enhancements. Histogram...');
applyFunctionOnFiles(path, @enhanceHistogram, 'histogram');
disp('Color Histogram...');
applyFunctionOnFiles(path, @enhanceHistogramColor, 'histogramColor');
disp('Color Histogram Channel...');
applyFunctionOnFiles(path, @enhanceHistogramColorChannel, 'histogramColorChannel');
disp('Contrast...');
applyFunctionOnFiles(path, @enhanceContrast, 'contrast');
disp('Light...');
applyFunctionOnFiles(path, @enhanceLight, 'light');
end