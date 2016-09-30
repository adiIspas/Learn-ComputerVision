a = [1; 2; 3; 4; 5];
b = [6 7 8 9 10];
% Use a' or b' for transpose

% Load basic image
image = rgb2gray(imread('car.jpg'));
figure('name', 'Basic image');
imshow(image)

% Translation image
image_translate = zeros(size(image), 'uint8');
T = [50 40];
for i=1:size(image,1)
    for j=1:size(image,2)
        
        x = i + T(1);
        y = j + T(2);
        
        if (x <= size(image,1) && y <= size(image, 2))
            image_translate(i, j) = image(x, y);
        end
    end
end

figure('name', 'Translate image with T')
imshow(image_translate)

% Scaling image
image_scaling = zeros(size(image), 'uint8');
S = [2 2];
for i=1:size(image,1)
    for j=1:size(image,2)
        
        x = round(i * S(1));
        y = round(j * S(2));
        
        if (x >= 1 && y >= 1 && x <= size(image, 1) && y <= size(image, 2))
            image_scaling(i, j) = image(x, y);
        end
    end
end

resize_x = 0;
resize_y = 0;
for i = 1:size(image_scaling, 1)
    if image_scaling(1, i) == 0
        resize_x = i - 1;
        break
    end
end

for j = 1:size(image_scaling, 2)
    if image_scaling(j, 1) == 0
        resize_y = j - 1;
        break
    end
end

image_scaling_finale = zeros(resize_y, resize_x, 'uint8');
for j=1:resize_x
    for i=1:resize_y
       image_scaling_finale(i, j) = image_scaling(i, j);
    end
end

figure('name', 'Scaling image with S')
imshow(image_scaling_finale)

% Rotate image
image_rotate = zeros(size(image), 'uint8');
degrees = 90;
mid_x = ceil(size(image, 1)/2);
mid_y = ceil(size(image, 2)/2);
for i=1:size(image,1)
    for j=1:size(image,2)
        
        x = round(cos(degrees) * (i - mid_x) - sin(degrees) * (j - mid_y)) + mid_x;
        y = round(cos(degrees) * (j - mid_y) + sin(degrees) * (i - mid_x)) + mid_y;
        
        if (x >= 1 && y >= 1 && x <= size(image, 1) && y <= size(image, 2))
            image_rotate(i, j) = image(x, y);
        end
    end
end

figure('name', 'Rotate image with degrees')
imshow(image_rotate)