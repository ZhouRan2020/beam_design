function  [Q_i_hat,p_i_hat] = crossopti_Qp(f_RF_i_ideal,N_c,b,T_max)
%输入列向量f_RF_i_ideal,输出矩阵Q_i_hat和列向量p_i_hat
N_t=length(f_RF_i_ideal);
%%
Q_i_hat=ini_Q(N_t,N_c);
for i=1:T_max
    p_i_hat=opti_p(f_RF_i_ideal,Q_i_hat,b);
    Q_i_hat=opti_Q(f_RF_i_ideal,p_i_hat);
end
end
