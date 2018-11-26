function [ output ] = applyFunctionOnFiles( path, funct, resultDir )
%APPLYFUNCTIONONFILES applies a given function to all .jpg files in path.
%   
files = dir(fullfile(path, '*.jpg'));
files = transpose({files.name});
resultingDirectoryPath = strcat(path,'\',resultDir,'\');
warning('off','MATLAB:MKDIR:DirectoryExists'); % turning of warning for existing folder
mkdir(resultingDirectoryPath);
[length,~] = size(files);
for i = 1:length
    filename = char(files(i));
    originalImage = imread(strcat(path,'\', filename));
    output = funct(originalImage);
    imwrite(output, strcat(resultingDirectoryPath, filename));
end
end