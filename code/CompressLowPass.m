%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inputs:
%		i = image
%		f = compression factor 0<=f<=1
%	outputs:
%		i = compressed image with compression factor at most f
%	notes:
%		the smaller f is (higher compression ratio) the greater the time
%			complexity because the two inner for loops have more iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function i = CompressLowPass(i,f)
	sizeI = size(i);
	%need to figure out how the compression ratio relates to the
	%diagonal chosen
	%the row where we begin zeroing
	zeroRow = floor(f*sizeI(1))+1;
	%the column where we begin zeroing
	zeroCol = floor(f*sizeI(2))+1;
	colorCnt = sizeI(3);
	for j=1:colorCnt
		%dct2 is the matlab 2-d DCT
		y=dct2(i(:,:,j));
		%need to figure out how the compression ratio relates to the
		%diagonal chosen
		%choose which is faster zero out values or
		%insert values to zero matrix
		if(false)
			for m=zeroRow:sizeI(1)
				for n=zeroCol:sizeI(2)
					y(m,n)=0;
				end
			end
			i(:,:,j)=idct2(y);
		else
			z = zeros(sizeI(1),sizeI(2));
			for m=1:zeroRow-1
				for n=1:zeroCol-1
					z(m,n)=y(m,n);
				end
			end
			i(:,:,j)=idct2(z);
		end
	end
end
