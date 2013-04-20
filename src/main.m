function net = main(beta,inputSize,op,txFun,lrnRate, lrnStrategy, epochs, M, H)
    trainSet = feval(strcat(op, num2str(inputSize)));
%W = rand(inputSize+1,1);
%W = zeros(inputSize+1,1);
net = createNet(inputSize, M, H, lrnRate, lrnStrategy);
%calculas los o de cada capa
for j = 1:epochs
	error = 0;
    %trainSet = shuffle(trainSet);
    for i = 1: size(trainSet, 1)

%Calculamos la salida
		net = evaluateNet(net,trainSet{i}{1},txFun,beta);
%calculo de deltas
		net = calculateDeltas(net, trainSet{i}{2});
%update de pesos
		net = updateWeights(net,trainSet{i}{1},txFun,beta);
%update de error
		error = error + getError(txFun, net.out, trainSet{i}{2});
    end
    epochError = error/size(trainSet,1);
    net = updateLrnRate(net, epochError);
end
endfunction
