function p_hat=opti_p_dis(p_hat_con,b)
%输入列向量p_hat_con,标量b；输出列向量p_hat
N_c=length(p_hat_con);
%%
p_hat_con_angle=zeros(N_c,1);
for i=1:N_c
    p_hat_con_angle(i,1)= angle(p_hat_con(i,1)) ./ pi;
end
%%
p_hat=ones(N_c,1);
for i=1:N_c
    p_hat(i,1)=(1/sqrt(N_c)) .* exp(1i.*pi.*optimal_dis(p_hat_con_angle(i,1),b));
end
end

