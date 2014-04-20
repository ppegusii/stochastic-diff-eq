vf = './data/cookie.avi';
vid = VideoReader(vf);
frames = vid.NumberOfFrames;
%[rate,quality] = Experiment(0.25,KnownChannelRateConstant(frames),1,StochasticChannelRatePeriodic(frames),0.25,@StreamAlgOmniscient,vf,@CompressAverage)
[rate,quality] = Experiment(0.125,KnownChannelRateConstant(frames),1,StochasticChannelRatePeriodic(frames),0.25,@StreamAlgOmniscient,vf,@CompressAverage)
