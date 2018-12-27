function [] = main(path)
%MAIN Main function for data recognition
global Xsize; global Ysize;
Xsize = 500; Ysize = 500;
path = strcat(pwd,'\Dataset\train\images\cropped');
testPath = strcat(pwd,'\Dataset\test\images');
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
disp('Applying sharpening filter...');
applyFunctionOnFiles(path,@applySharpen,'');
disp('Contrast...');
applyFunctionOnFiles(path, @enhanceContrast, '');
%% Create model
model = createModel(path);
save('model.mat', 'model');
%% Test model
[testLabels, testFiles] = generateLabels(testPath);
applyFunctionOnFiles(testPath, @resizeImage, '');
testFeatures = generateDescriptor(testPath, testFiles);
predictedLabels = predict(model, testFeatures);
%% Analysis
compareLabels(testLabels, predictedLabels);
end

