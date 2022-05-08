function p = ini_p(N_c,b)
%随机初始化p
ps=linspace(-1,1,2^b);
p=ones(N_c,1);
for i=1:N_c
    p(i,1)=(1/sqrt(N_c)) .* exp(1i.*pi.*ps(randi([1 2^b],1,1)));
end
end