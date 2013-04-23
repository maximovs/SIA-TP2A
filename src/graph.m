function graph(net, file, txFun, beta, from, to)
	values = load(file);
	values = values.x;
	net.min = min(values);
	net.max = max(values);
	net.amp = max(abs(net.min),abs(net.max));
	net.amp = 4;
	values = values./net.amp;
	values = values(from:to);
	trainSet = cell(size(values(),2),2);
	for i=1:(size(trainSet, 1)-3)
		trainSet{i} = {values(i:i+2) values(i+3)};
	end

	netFunction = zeros(1, size(trainSet, 1)-3);
	for i = 1: size(trainSet, 1)-3
		net = evaluateNet(net,trainSet{i}{1},txFun,beta);
		netFunction(i) = net.out*net.amp;
	end

	values = values.*net.amp;

	subplot(3,1,1);
	plot(values(1:size(trainSet, 1)));
	subplot(3,1,2);
	plot([values(1:3) netFunction]);

	subplot(3,1,3);
	plot(abs([values(1:3) netFunction] - values(1:size(trainSet, 1))));

endfunction