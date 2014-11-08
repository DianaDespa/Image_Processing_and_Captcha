function str = captcha(input_img_path)
	
	str = "";
	sume_control = load("sums_array.m");
	img = imread(input_img_path);
	
	% Se retine in V imaginea in format logic (cu valori de 1 pentru alb
	% si cu valori de 0 pentru pixelii colorati)
	V = 1 & (mean(img,3) == 255);
	
	% l0 retine indicii coloanelor albe de pixeli din imagine (care au suma
	% valorilor negate egala cu 0, fiecare valoare fiind 1)
	l0 = find(sum(~V) == 0);
	
	% p retine indicii din l0 ai elementelor pentru care diferenta absoluta cu
	% urmatorul element este diferita de 1, adica oriunde nu se afla 2 coloane
	% albe consecutive in imagine
	p = find(diff(l0) != 1);
	
	if (columns(p) == 1) % cazul in care este o singura litera
		letter = V(:, l0(p) + 1: l0(p+1) - 1);
		letter(find(sum(~letter,2) == 0),:) = [];
		suma = sum_ctrl(letter);
		[l c]= find(sume_control == suma);
		str = strcat(str, sume_control(2,c));
	else
		% q este matricea de perechi de indici pentru elementele consecutive
		% din l0 a caror diferenta este mai mare decat 1 
		q = [p;p + 1];
		for j = 1 : columns(l0(q))
			% se extrag coloanele ce cuprind o litera
			letter = V(:, l0(q)(1,j) + 1: l0(q)(2,j) - 1); 
			% se elimina liniile albe de deasupra si de sub litera
			letter(find(sum(~letter,2) == 0),:) = [];
			
			% se calculeaza suma de control a literei curente, aceasta se
			% identifica cu ajutorul matricii sume_control si se adauga la sir
			suma = sum_ctrl(letter);
			[l c]= find(sume_control == suma);
			str = strcat(str, sume_control(2,c));
		end
	end
	
end
