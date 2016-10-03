% Load basic image
image = rgb2gray(imread('girl.jpg'));
figure('name', 'Basic image');
imshow(image)

% Image segmentation
image_filter_one = zeros(size(image), 'uint8');

for i=1:size(image,1)
    for j=1:size(image,2)
    
        if image(i,j) > 100
            image_filter_one(i,j) = 255;
        else
            image_filter_one(i,j) = 0;
        end     
    end
end

figure('name', 'Image segmentation')
imshow(image_filter_one)

% Moving average
image_moving_two = zeros(size(image), 'uint8');

for i=2:size(image,1)
    for j=2:size(image,2)
        
        sum = uint64(0);
        for k=-1:1
            for l=-1:1
                x = i - k;
                y = j - l;
                if x <= size(image,1) && y <= size(image,2)
                    sum = sum + uint64(image(x, y));
                end
            end
        end
      
        image_moving_two(i,j) = 1/9 * sum;
        
    end
end

figure('name', 'Moving average')
imshow(image_moving_two)
