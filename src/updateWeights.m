function newNet = updateWeights(net,in,txFun, beta,eta)
	dW = [-1 feval(txFun,in,beta)]'*(feval(strcat(txFun,'der'),net.neurons{1}.values,beta).*net.neurons{1}.deltas);
	net.weights{1} = net.weights{1} + dW*eta;
	for i=1:net.h
		dW = [-1 feval(txFun,net.neurons{i}.values,beta)]'*(feval(strcat(txFun,'der'),net.neurons{i+1}.values,beta).*net.neurons{i+1}.deltas);
		net.weights{i+1} = net.weights{i+1} + dW*eta;
	end
	newNet = net;
endfunction