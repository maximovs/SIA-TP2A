function net = createNet(N,M,H)
	net.h=H;
	net.n=N;
	net.m=M;
	net.weights = cell(H+1,1);
	if(H<1)
		net.weights{1} = rand(N+1,1);
	else		
		net.weights{1} = rand(N+1,M);
		for i = 2:H
			net.weights{i} = rand(M+1,M);
		end
		net.weights{H+1} = rand(M+1,1);
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
endfunction