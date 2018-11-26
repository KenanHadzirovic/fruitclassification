function [] = imageMask(Filename, Xmax, Xmin, Ymax, Ymin)
% Apply a mask to the RGB image.
iterations = size(Xmax);
lastImage = '';
mkdir(strcat(pwd,'\Dataset\train\images\masked\'));
for i = 1:iterations
    originalImage = imread(strcat(pwd,'\Dataset\train\images\', char(Filename(i))));
    outputImage = applyMask(originalImage,Xmin(i),Xmax(i),Ymin(i),Ymax(i));
    if strcmp(char(Filename(i)),lastImage)
        newFilename = strcat(int2str(i), char(Filename(i)));
    else
        lastImage = char(Filename(i));
        newFilename = lastImage;
    end
    imwrite(outputImage,strcat(pwd,'\Dataset\train\images\masked\',newFilename));
end

end