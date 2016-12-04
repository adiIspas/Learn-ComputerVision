image = rgb2gray(imread('intersectie.jpg'));
figure('name', 'Original image');
imshow(image);

template = rgb2gray(imread('template_intersectie_2.png'));
template = imresize(template, 0.1);
figure('name', 'Template image');
imshow(template);

figure('name', 'Finding template');
find_template = normxcorr2(template, image);
imshow(find_template);