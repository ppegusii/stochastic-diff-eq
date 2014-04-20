%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	inputs:
%		duration = duration in seconds
%		frames = the number of frames that should play over the given duration
%	outputs:
%		rate = the discretized rate of change of the channel rate with 
%			the given duration where frames provides the step count
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function rate = KnownChannelRateConstant(duration,frames)
	rate = zeros(1,frames);
end
