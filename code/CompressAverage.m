%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inputs:
%		i = image
%		f = compression factor 1/c<=f<=1
%		c = chunk size
%	outputs:
%		i = compressed image with compression factor at most f
%	constraints:
%		dimensions of image must be divisible by c
%		c is a power of 2
%	notes:
%		the greater f is (lower compression ratio) the greater the time
%			complexity because the two inner for loops have more iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function i = CompressAverage(i,f,c)
	%cannot compress return black
	if(f < 1/c)
		display(['compression factor too low']);
		i(:,:,:) = 1;
		return
	end
	sizeI = size(i);
	colorCnt = sizeI(3);
	%dimension of square for averaging
	squareDim = c/2.^floor(log2(c*f));
	%squareDim can be at most c
	if(squareDim > c)
		squareDim = c;
	%no compression necessary
	elseif(squareDim<=1)
		display(['no compression required']);
		return
	end
	display(['squareDim=',num2str(squareDim)]);
	for j=1:colorCnt
		for	m=0:sizeI(1)/squareDim-1
			for	n=0:sizeI(2)/squareDim-1
				av = floor(sum(sum(i(m*squareDim+1:(m+1)*squareDim,n*squareDim+1:(n+1)*squareDim,j)))/squareDim.^2);
				i(m*squareDim+1:(m+1)*squareDim,n*squareDim+1:(n+1)*squareDim,j) = av;
			end
		end
	end
end
