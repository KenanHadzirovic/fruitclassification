function [] = imageMask(Filename, Xmax, Xmin, Ymax, Ymin)
iterations = size(Xmax);
for i = 1:iterations
    originalImage = imread(strcat(pwd,'\Dataset\train\images\', char(Filename(i))))
    imwrite(strcat(pwd,'\Dataset\train\images\masked\',char(Filename(i))),applyFilter(originalImage,Xmin(i),Xmax(i),Ymin(i),Ymax(i)));
end

end