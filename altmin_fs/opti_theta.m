function theta_tilde=opti_theta(alphan,betan,f_BB_given,b,theta_tilde_ini)
%输入未归一化角度，输出未归一化角度
%theta都是行向量
%%
N_RF=length(f_BB_given);
%%
if (N_RF==2)
    theta_tilde=theta_tilde_ini;
    [theta_tilde(1,1),theta_tilde(1,2)]=cal_theta12(alphan,betan,f_BB_given(1,1),f_BB_given(2,1),b);

    %%
else
    theta_tilde=theta_tilde_ini;
    theta_tilde_base=zeros(1,N_RF);%上一轮循环结束时，theta的值（行向量）
    t=1;p=2;
    while ~(p==N_RF && isequal(theta_tilde,theta_tilde_base))%只有当刚好更新完一轮且与上一轮结束时保存的结果相同，才不进入下一轮的循环
        if(p==N_RF)%上一次t循环刚更新完一轮，并且由条件判断还要继续下一轮优化，于是先更新维护theta_tilde_base
            theta_tilde_base=theta_tilde;
        end
        p=mod(t-1,N_RF-2)+3;
        %%
        %在theta_tilde的1，2，p位置处修改
        [theta_tilde(1,1),theta_tilde(1,2),theta_tilde(1,p)]=opti_p12(alphan,betan,f_BB_given,b,theta_tilde,p);
        %%
        t=t+1;
    end
end
end


