function p_i_hat=opti_p(f_RF_i_ideal,Q_i_given,b)
%输入：列向量f_RF_i_ideal，输出列向量p_i_hat
p_i_hat_con=opti_p_con(f_RF_i_ideal,Q_i_given);
p_i_hat=opti_p_dis(p_i_hat_con,b);
end