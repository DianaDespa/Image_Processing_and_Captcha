function a = sum_ctrl(A)
	a = sum(find(~A)) + sum(sum(A));
endfunction
