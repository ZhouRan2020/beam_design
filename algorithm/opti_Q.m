function Q_i_hat=opti_Q(f_RF_i_ideal,p_i_given)
%输入：列向量f_RF_i_ideal,列向量p_i_given；输出：矩阵Q_i_hat
%%
N_t=length(f_RF_i_ideal);
N_c=length(p_i_given);
%%
Q_i_hat=zeros(N_t,N_c);
for i=1:N_t
    Q_i_hat(i,:)=opti_binary(f_RF_i_ideal(i,1),p_i_given);
end
end

