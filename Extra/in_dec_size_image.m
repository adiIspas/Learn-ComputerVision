figure('name', 'Original image');
image = rgb2gray(imread('girl.jpg'));
imshow(image);

blur_image = imfilter(image, fspecial('gaussian',7,1));

figure('name', 'Image resize with 1/2')
blur_image = blur_image(1:2:end, 1:2:end);
imshow(blur_image);