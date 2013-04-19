function net = main(beta,inputSize,op,txFun,lrnRate, epochs, M, H)
    trainSet = feval(strcat(op, num2str(inputSize)));
%W = rand(inputSize+1,1);
%W = zeros(inputSize+1,1);
net = createNet(inputSize, M, H);
%calculas los o de cada capa
for j = 1:epochs
    %trainSet = shuffle(trainSet);
    for i = 1: size(trainSet, 1)

%Calculamos la salida
        net = evaluateNet(net,trainSet{i}{1},txFun,beta);
%calculo de deltas
        net = calculateDeltas(net, trainSet{i}{2});
%update de pesos
        net = updateWeights(net,trainSet{i}{1},txFun,beta,lrnRate);
    end
end
endfunction