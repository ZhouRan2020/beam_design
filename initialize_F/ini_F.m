function [S_t,P_t] = ini_F(N_t,N_c,N_RF,b)
%随机初始化F
S_t = ini_S(N_t,N_c,N_RF);
P_t = ini_capitalP(N_c,N_RF,b);
end


