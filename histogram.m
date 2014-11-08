function h = histogram(input_img_path)
    
    h = zeros(1, 256);
    
    % TODO Read the image, store the histogram in h.
    % Be careful: h(i) corresponds to a intensity of i - 1. We are forced to do
    % so because of GNU Octave's indexing (which starts at 1).
    
    V = imread(input_img_path);
    for i = 1 : 256
    	h(i) = size(find(V == (i - 1)))(1);
    end
    
end
