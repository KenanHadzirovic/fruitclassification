function [] = imageMask(Filename, Xmax, Xmin, Ymax, Ymin)
iterations = size(Xmax);
for i = 1:iterations
    originalImage = imread(strcat(pwd,'\Dataset\train\images\', char(Filename(i))))
    [height, width, ~] = size(originalImage);
    imwrite(applyFilter(height,width,Xmin(i),Xmax(i),Ymin(i),Ymax(i)));
end

end