function [ outputImage ] = resizeImage( originalImage )
%RESIZEIMAGES Resize given image to a globally set image size
    global Xsize; global Ysize;
    outputImage = imresize(originalImage, [Xsize Ysize]);
end

