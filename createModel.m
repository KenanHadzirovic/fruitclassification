function [ model ] = createModel(path)
%CREATEMODEL Create model based on images and labels passed to the function
disp('Starting creation of model');
[labelNames, files] = generateLabels(path);
trainingFeatures = generateDescriptor(path, files);

disp('Creating model...');
model = fitcecoc(trainingFeatures, char(labelNames));

end

