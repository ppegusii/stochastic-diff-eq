%Copied from textbook
function u = Halton(p,n)
	b = zeros(ceil(log(n)/log(p)),1);
	u = zeros(n,1);
	for j=1:n
		i = 1;
		b(1) = b(1)+1;
		while b(i)>p-1+eps
			b(i) = 0;
			i = i+1;
			b(i) = b(i)+1;
		end
		u(j) = 0;
		for k=1:length(b(:))
			u(j) = u(j)+b(k)*p^(-k);
		end
	end
end
