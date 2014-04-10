clear; 
close all;
warning("on","backtrace");
% clc;

disp(['Activity 1']); 
fprintf('\n');

% cpu time
tic;

%set printing format
format long E;

%Given
	%current stock price
	x0 = 12;
	%strike price
	K = 15;
	%years until exercise date
	T = 0.5;
	%interest rate
	r = 0.05;
	%volatility
	theta = 0.25;
	stepCount = 10000;

stepSize = T/stepCount;
X = EulerMaruyama(x0,stepSize,stepCount,@(t,x) r*x,@(t,x) theta*x);

plot(linspace(0,T,stepCount+1),X);

% total cpu time
totalTime = toc;
disp(['CPU time: ', num2str(totalTime)]);
