function [S_t_hat,P_t_hat] = opti_F(v_ideal,f_BB_given,N_c,b,T_max)
%输入列向量v_ideal,f_BB_given，输出矩阵S_t_hat,P_t_hat
F_ideal=v_ideal/f_BB_given;
[S_t_hat,P_t_hat]=opti_F_p(F_ideal,N_c,b,T_max);
end

