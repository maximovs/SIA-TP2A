function o = compareTs(net,trainSet,txFun,beta)
	aux = zeros(size(trainSet,1),1);
	s = zeros(size(trainSet,1),1);

	for i = 1:size(trainSet,1)
		s(i) = trainSet{i}{2};
		aux(i) = netResult(net,trainSet{i}{1},txFun,beta);
	end
	plot(s-aux);
	aux

endfunction
