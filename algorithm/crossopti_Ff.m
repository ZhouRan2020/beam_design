function  [S_t_hat,P_t_hat,f_BB_hat]=crossopti_Ff(v_ideal,N_c,N_RF,b,R_max,T_max)
%输入：列向量v_ideal, 输出矩阵S_t_hat,P_t_hat和列向量f_BB_hat
N_t=length(v_ideal);
%%
[S_t_hat,P_t_hat]=ini_F(N_t,N_c,N_RF,b);
for r=1:R_max
    f_BB_hat = opti_lowercasef(v_ideal , S_t_hat*P_t_hat);%opti_lowercase()保证了输出的f_BB合法
    [S_t_hat,P_t_hat] = opti_F(v_ideal,f_BB_hat,N_c,b,T_max);
end
%%
%规范化f_BB_hat
f_BB_hat=f_BB_hat./norm(S_t_hat*P_t_hat*f_BB_hat);
end