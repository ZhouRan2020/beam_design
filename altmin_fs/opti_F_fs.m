function F_RF_hat_fs = opti_F_fs(v_ideal,f_BB_given,b,F_RF_hat_fs_pre)
%更新维护F_RF_hat的过程
N_t=length(v_ideal);
%%
%分别解决N_t个独立的子问题，每行是一个子问题，规模为N_RF
F_RF_hat_fs=F_RF_hat_fs_pre;
for i=1:N_t
    alphan=abs(v_ideal(i,1));
    betan=angle(v_ideal(i,1));
    theta_pre=angle(F_RF_hat_fs_pre(i,:));%exp to theta
    theta=opti_theta(alphan,betan,f_BB_given,b,theta_pre);%输入theta输出theta都未归一化
    F_RF_hat_fs(i,:)=exp(1i.*theta);%theta to exp
end
end

