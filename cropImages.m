function [] = cropImages( Filename, Xmax, Xmin, Ymax, Ymin )
%CROPIMAGE Crops image in the folder
%   Detailed explanation goes here

iterations = size(Xmax);
lastImage = '';
mkdir(strcat(pwd,'\Dataset\train\images\cropped\'));
for i = 1:iterations
    originalImage = imread(strcat(pwd,'\Dataset\train\images\', char(Filename(i))));
    Xsize = Xmax(i) - Xmin(i);
    Ysize = Ymax(i) - Ymin(i);
    outputImage = imcrop(originalImage, [Xmin(i) Ymin(i) Xsize Ysize]);
    
    if strcmp(char(Filename(i)),lastImage)
        newFilename = strcat(int2str(i), char(Filename(i)));
    else
        lastImage = char(Filename(i));
        newFilename = lastImage;
    end
    imwrite(outputImage,strcat(pwd,'\Dataset\train\images\cropped\',newFilename));
end

end