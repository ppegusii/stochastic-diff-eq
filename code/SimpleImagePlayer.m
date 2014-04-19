vid = VideoReader('./data/cookie.avi');
for i = 1:vid.NumberOfFrames
	img = read(vid,i);
	display([size(img)]);
	imagesc(img);
end
