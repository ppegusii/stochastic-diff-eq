vid = VideoReader('./data/cookie.avi');
for i = 1:vid.NumberOfFrames
	img = read(vid,i);
	display(['image dimensions: ',mat2str(size(img))]);
%	imagesc(img);
	%taking the middle part of the image because DCT
	%requires a square matrix
	imagesc(CompressLowPass(img(:,linspace(101,700,600),:),0.125));
end
