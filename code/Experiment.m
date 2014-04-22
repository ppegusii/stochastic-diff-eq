%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inputs:
%		r0 = initial channel rate
%		k = discretized known rate of change of the channel rate
%		kw = weight of known rate of change
%		s = discretized stochastic rate of change of channel rate
%		sw = weight of stochastic rate of change
%		a = adaptive streaming algorithm
%		v = AVI video file path
%		c = video compression algorithm
%	outputs:
%		r = discrete realized channel rate, each r_i is the proportion of a frame the channel can support
%		q = an array containing the quality of the frame at each time step 1=original quality,...,0=frame did not arrive on time
%	constraints:
%		k and w will have to be the same size and at least as big as the size of i (right?)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [r,q] = Experiment(r0,k,kw,s,sw,a,v,c)
	%frames per second
	fps = 30;
	chunk = 16;
	vid = VideoReader(v);
	%total number of frames in the video
	frames = vid.NumberOfFrames;
	%realized channel rate
	r = EulerMaruyamaDiscretized(r0,1/fps,frames,k,kw,s,sw);
	%compression factor
	f = a(r);
	%time
	t = linspace(0,frames/fps+1,frames+1);
	%starting at 2 because the video is not playing at t_0
	for i = 2:frames+1
		%plot(t(1:i),r(1:i),t(1:i),f(1:i));
		legend('channel rate','compression factor');
		%pause(.5);
		img = read(vid,i-1);
		%make img dimensions divisible by chunk
		imgDim = size(img);
        fprintf('size of image: %s\n', mat2str(imgDim));
		h = floor(imgDim(1)/chunk)*chunk;
		w = floor(imgDim(2)/chunk)*chunk;
%		imagesc(c(img(1:h,1:w,:),1/8,chunk));
        ii = c(img(1:h,1:w,:),f(i),chunk);
		%imagesc(ii);
		%pause(.5);
        display_image (ii, img, r(1:i), f(1:i), t(1:i));
        
        pause(.5);
	end
	q = f;
end
