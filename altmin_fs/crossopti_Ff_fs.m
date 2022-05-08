function  [F_RF_hat_fs,f_BB_hat_fs]=crossopti_Ff_fs(v_ideal,N_RF,b,R_max)
%输入：列向量v_ideal, 输出矩阵F_RF_hat_fs和列向量f_BB_hat_fs
N_t=length(v_ideal);
%%
%随机初始化，并确定问题规模
F_RF_hat_fs=ini_F_fs(N_t,N_RF,b);
%%
%平凡的情况
if (N_RF==1)
    f_BB_hat_fs=1/sqrt(N_t);
    for i=1:N_t
        obj=angle(v_ideal(i,1))./pi;
        theta=optimal_dis(obj,b);
        F_RF_hat_fs(i,1)=exp(1i.*pi.*theta);
    end
    %%
    %nrf>=2
else
    for r=1:R_max
        f_BB_hat_fs = opti_lowercasef(v_ideal , F_RF_hat_fs);%opti_lowercase()保证了提供的f_BB合法
        F_RF_hat_fs = opti_F_fs(v_ideal,f_BB_hat_fs,b,F_RF_hat_fs);%F_RF_hat_fs迭代更新
    end
end
%%
%保证提供的f_BB_hat合法,以保证v_p的范数为1
f_BB_hat_fs=f_BB_hat_fs./norm(F_RF_hat_fs*f_BB_hat_fs);
end