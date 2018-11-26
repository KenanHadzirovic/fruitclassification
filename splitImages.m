function [] = splitImages(path, percent)
% Split a certain percent of images to test folder.
% Since images are not sorted based on their class, random values are
% generated so all of the classes are present in the test folder.
files = dir(fullfile(path, '*.jpg'));
testdirectory = strcat(path,'\test');
mkdir(testdirectory);
[length,~] = size(files);
for i = round(length*(1-percent)):length
    x = randi([1 length]);
    movefile(strcat(path,'\',files(x).name), testdirectory);
end

end