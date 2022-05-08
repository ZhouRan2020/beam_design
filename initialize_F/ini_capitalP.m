function P = ini_capitalP(N_c,N_RF,b)
%随机初始化P
P=zeros(N_c*N_RF,N_RF);
for i=1:N_RF
    P(N_c*(i-1)+1:N_c*i,i)=ini_p(N_c,b);
end
end

