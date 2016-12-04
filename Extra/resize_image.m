image = imread('girl.jpg');
image = imresize(image,0.3);
imshow(image);
imwrite(image, 'girl_resize.jpg');

