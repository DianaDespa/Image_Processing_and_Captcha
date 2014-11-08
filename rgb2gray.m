function rgb2gray(input_img_path, output_img_path)
    
    % TODO Read the file denoted by "input_img_path", transform it to grayscale
    % and save it to "output_img_path".
    % You should use the following formula for determining the intensity of each
    % pixel:
    % G(i, j) = 0.2989 * Red(i, j) + 0.5870 * Green(i, j) + 0.1140 * Blue(i, j)

	RGB = imread(input_img_path);
	G(:,:) = 0.2989 * RGB(:,:,1) + 0.587 * RGB(:,:,2) + 0.114 * RGB(:,:,3);
	imwrite(G, output_img_path);
	
end
