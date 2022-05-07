function [theta1,theta2] = cal_theta12_extra(alphan,betan,fbb,theta_3_nrf,b)
%用于计算nrf>=3时的theta1，theta2
v_new=alphan.*exp(1i.*betan)-exp(1i.*theta_3_nrf)*fbb(3:length(fbb),1);
alphan_new=abs(v_new);
betan_new=angle(v_new);
[theta1,theta2] = cal_theta12(alphan_new,betan_new,fbb(1,1),fbb(2,1),b);
end

