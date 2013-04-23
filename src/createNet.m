function net = createNet(N,M,H,lrnRate,lrnStrategy)
	net.h=H;
	net.n=N;
	net.m=M;
	net.weights = cell(H+1,1);
	maxRand = 0.7;
	if(H<1)
		net.weights{1} = rand(N+1,1)*maxRand;
	else		
		net.weights{1} = rand(N+1,M)*maxRand;
		for i = 2:H
			net.weights{i} = rand(M+1,M)*maxRand;
		end
		net.weights{H+1} = rand(M+1,1)*maxRand;
	endif
	net.out = 1;
	net.neurons = cell(H+1,1);
	for i = 1:H
		aux.deltas = zeros(1,M);
		aux.values = zeros(1,M);
		net.neurons{i} = aux;
	end
		aux.deltas = zeros(1);
		aux.values = zeros(1);
		net.neurons{H+1} = aux;
		net.count = 0;
		net.prevErr = 9999999999;
		net.lrnRate = lrnRate;
		net.lrnStrategy = lrnStrategy;
		net.lrn_A = 0.01;
		net.lrn_B = 0.7;
		net.lrn_K = 4;
endfunction
