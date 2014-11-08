function v=sums_arr

	parent_dir = "letter_images";
	dirs = ls(parent_dir); % se parcurg toate subdirectoarele din letter_images
	nr = 0;
	for i = 1 : length(dirs)
    	dirname = dirs(i);
    	
    	% se citest si se calculeaza sumele de control pentru fiecare imagine
    	% din fiecare subdirector
    	files = ls(strcat(parent_dir, "/", dirname));
    	for j = 1 : size(files)(1)
    	    filepath = strcat(parent_dir, "/", dirname, "/", files(j,:));
    	    nr = nr + 1;
    	    matrix = imread(filepath);
    	    v(1,nr) = sum_ctrl(matrix); % retine suma de control
    	    v(2,nr) = dirname;			% retine litera corespunzatoare
    	end
	end
end
