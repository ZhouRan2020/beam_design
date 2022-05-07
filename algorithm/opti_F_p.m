function [S_t_hat,P_t_hat]=opti_F_p(F_RF_ideal,N_c,b,T_max)
%输入矩阵F_RF_ideal，输出矩阵S_t_hat,P_t_hat
[N_t,N_RF]=size(F_RF_ideal);
%%
%分别解决N_RF个独立的子问题
S_t_hat=zeros(N_t,N_c*N_RF);
P_t_hat=zeros(N_c*N_RF,N_RF);
for i=1:N_RF
    f_RF_i_ideal=F_RF_ideal(:,i);
    [Q_i_hat,p_i_hat] = crossopti_Qp(f_RF_i_ideal,N_c,b,T_max);
    S_t_hat(:,N_c*(i-1)+1:N_c*i)=Q_i_hat;
    P_t_hat(N_c*(i-1)+1:N_c*i,i)=p_i_hat;
end
end

