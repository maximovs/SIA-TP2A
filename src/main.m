function net = main(beta,inputSize,op,txFun,lrnRate, lrnStrategy, epochs, M, H)
    net = createNet(inputSize, M, H, lrnRate, lrnStrategy);
    trainSet = feval(strcat(op, num2str(inputSize)));
    net.amp = 1;

    %net = getTrainSet(net, 'TimeSerie_G7.mat');
    %trainSet = net.trainSet;
%W = rand(inputSize+1,1);
%W = zeros(inputSize+1,1);
%calculas los o de cada capa
    net.epochErrors = zeros(epochs,1);
for j = 1:epochs
	error = 0;
    
    trainSet = shuffle(trainSet);
    for i = 1: size(trainSet, 1)

%Calculamos la salida
		net = evaluateNet(net,trainSet{i}{1},txFun,beta);
%calculo de deltas
		net = calculateDeltas(net, trainSet{i}{2});
%update de pesos
		net = updateWeights(net,trainSet{i}{1},txFun,beta);
%update de error
		error = error + getError(net.out, trainSet{i}{2});
    end
    epochError = error/size(trainSet,1);
    net = updateLrnRate(net, epochError);
    net.epochErrors(j) = epochError;
end
plot(1:epochs, net.epochErrors, '-4; Step Error;');
endfunction
