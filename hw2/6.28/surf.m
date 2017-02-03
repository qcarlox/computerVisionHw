function w = surf(x,y,z)
	C = [8 0 0 ; 0 1 0 ; 0 0 1];
	Cinv = pinv(C);
	w = (Cinv(1,1)*x.^2 + Cinv(2,2)*y.^2 + Cinv(3,3)*z.^2).^(1/2);
end
	
