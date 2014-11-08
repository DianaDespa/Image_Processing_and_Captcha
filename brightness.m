function new_brightness = brightness(input_img_path, x)
    new_brightness = 0;
    
    % TODO Read the image, add x to each pixel.
    V=imread(input_img_path) + x;
    % TODO Every value below 0 should be set to 0.
	V(find(V < 0)) = 0;
    % TODO Every value above 255 should be set to 255.
	V(find(V > 255)) = 255;
    % TODO Compute and return the mean value of the pixel intensities of the
    % new image.
    new_brightness = mean(mean(V));
    
end
