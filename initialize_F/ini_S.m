function S = ini_S(N_t,N_c,N_RF)
%随机初始化S
S=zeros(N_t,N_c*N_RF);
for i=1:N_RF
    S(:,N_c*(i-1)+1:N_c*i)=ini_Q(N_t,N_c);
end
end