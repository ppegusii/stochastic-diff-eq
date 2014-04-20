%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inputs:
%		r0 = initial channel rate
%		k = discretized known rate of change of the channel rate
%		kw = weight of known rate of change
%		s = discretized stochastic rate of change of channel rate
%		sw = weight of stochastic rate of change
%		a = adaptive streaming algorithm
%		v = AVI video file path
%	outputs:
%		r = discrete realized channel rate
%		q = an array containing the quality of the frame at each time step 1=original quality,...,0=frame did not arrive on time
%		c = compression algorithm
%	constraints:
%		k and w will have to be the same size and at least as big as the size of i (right?)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [r,q] = Experiment(r0,k,kw,s,sw,a,v,c)
	vid = VideoReader(v);
	for i = 1:vid.NumberOfFrames
	end
end
