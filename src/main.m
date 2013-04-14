function net = main(beta,inputSize,op,txFun,lrnRate, epochs)
    trainSet = feval(strcat(op, num2str(inputSize)));
    W = rand(inputSize+1,1);
%W = zeros(inputSize+1,1);
for j = 1:epochs
    for i = 1:size(trainSet)
  %  o = sign([-1 trainSet{i}{1}]*W);
    o = feval(txFun,[-1 trainSet{i}{1}]*W,beta);

    dW = [-1 trainSet{i}{1}]*lrnRate*(trainSet{i}{2} - o);
    W = W+dW';
    end
end

net.W = W;
net.trainSet = trainSet;
endfunction