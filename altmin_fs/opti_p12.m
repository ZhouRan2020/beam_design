function [theta1,theta2,thetap]=opti_p12(alphan,betan,f_BB_given,b,theta_tilde_pre,p)
%单次，即单个t，优化theta_tilde的过程
%%
N_RF=length(f_BB_given);
theta_3_nrf=theta_tilde_pre(1,3:N_RF);
ps=linspace(-1,1,2^b);
%%
%遍历2^b种取值，对每种取值计算theta1，theta2，再计算error，取error最小
error_min=inf;
theta1=0;
theta2=0;
thetap=0;
for i=1:2^b
    theta_3_nrf(1,p-2)=ps(i);
    [theta1_tem,theta2_tem] = cal_theta12_extra(alphan,betan,f_BB_given,theta_3_nrf,b);
    error_tem = cal_E(alphan.*exp(1i.*betan),f_BB_given,[theta1_tem,theta2_tem,theta_3_nrf]);
    if(error_tem<error_min)
        error_min=error_tem;
        thetap=ps(i);
        theta1=theta1_tem;
        theta2=theta2_tem;
    end
end
end

