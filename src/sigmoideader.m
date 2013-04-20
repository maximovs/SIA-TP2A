function res = sigmoideader(x,b)
res  = b - b*tanh(b*x).^2 ;
endfunction