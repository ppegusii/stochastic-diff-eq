function y = EulerMaruyama(y0,stepSize,stepCount,f,g)
	y = zeros(1,stepCount+1);
	y(1) = y0;
	for i=1:stepCount
		t = i*stepSize;
		y(i+1) = y(i)+f(t,y(i))*stepSize+g(t,y(i))*randn*sqrt(stepSize);
	end
end
