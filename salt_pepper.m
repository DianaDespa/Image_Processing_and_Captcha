function salt_pepper(input_img_path, mask, output_img_path)

    % TODO Read the image denoted by "input_image_path". For each noise-affected
    % pixel in the image (check the mask), set it to the average of the
    % surrounding pixels. Note that you will be given a color image, so you
    % should apply the averaging technique on all of the channels (Red, Green
    % and Blue). Save the resulting image to "output_img_path".
    
    V = imread(input_img_path);
    [a b] = find(mask);
    n = size(a)(1);
    for i = 1 : n
    	V(a(i),b(i),:) = sum(sum(V(a(i)-1 : a(i)+1,b(i)-1 : b(i)+1,:))) / 8;
    end
    imwrite(V, output_img_path);

end
