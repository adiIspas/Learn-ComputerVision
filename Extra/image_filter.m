image = rgb2gray(imread('poisson.jpg'));
figure('name', 'Original image');
imshow(image);

noise_image = imnoise(image,'salt & pepper',0.02);
figure('name', 'Image with noise');
imshow(noise_image);

median_filter_image = medfilt2(noise_image);
figure('name', 'Image after median filter');
imshow(median_filter_image);

gaussian_filter_image = imgaussfilt(image, 3);
figure('name', 'Image after Gaussian filter');
imshow(gaussian_filter_image);

detail_image = image - gaussian_filter_image;
figure('name', 'Image detail');
imshow(detail_image);

emphasis_image = image + detail_image;
figure('name', 'Image emphasis');
imshow(emphasis_image);

filter = 1/81 * ones(9,9);
image_with_my_filter = imfilter(image,filter);
figure('name', 'Image with my filter');
imshow(image_with_my_filter);

