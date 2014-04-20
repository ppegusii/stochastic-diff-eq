vid = VideoReader('./data/cookie.avi');
for i = 1:vid.NumberOfFrames
	img = read(vid,i);
	display(['image dimensions: ',mat2str(size(img))]);
%	imagesc(img);
	%taking the middle part of the image because DCT
	%requires a square matrix
%	imagesc(CompressLowPass(img(:,linspace(101,700,600),:),0.125));
	%requires dimensions to be divisible by last param, which must be power of 2
	imagesc(CompressAverage(img(1:592,:,:),1/8,16));
end
