%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inputs:
%		frames = the number of frames that should play over the given duration
%	outputs:
%		rate = the discretized rate of change of the channel rate with 
%			the given duration where frames provides the step count
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rate = StochasticChannelRatePeriodic(frames)
	t = linspace(0,frames,frames+1);
	rate = -1*sin(t);
end
