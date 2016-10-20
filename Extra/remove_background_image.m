image = rgb2gray(imread('watermark.jpg'));

%index = image > 200;
image(index) = 255;

imshow(image), impixelinfo;

%imwrite(image, 'print.png');