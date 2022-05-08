function [theta1,theta2] = cal_theta12(alphan,betan,f1,f2,b)
%输入：标量alphan，标量betan，标量f1，标量f2；输出：标量theta1，theta2
%alphan是非负实数，betan是未归一化角度，f1，f2是复数，theta1和theta2是未归一化角度
%用于nrf=2时的theta1，theta2
psi1=angle(f1);
zeta1=abs(f1);
psi2=angle(f2);
zeta2=abs(f2);
theta1_bar=betan-psi1+acos((alphan^2+(zeta1+zeta2)*(zeta1-zeta2))/(2*zeta1*alphan));
theta2_bar=betan-psi2-acos((alphan^2-(zeta1+zeta2)*(zeta1-zeta2))/(2*zeta2*alphan));
%逼近theta1_bar
theta1_bar_norm=theta1_bar./pi;%归一化
theta1_tilde_norm=optimal_dis(theta1_bar_norm,b);%量化
theta1=theta1_tilde_norm.*pi;%未归一化
%逼近theta2_bar
theta2_bar_norm=theta2_bar./pi;%归一化
theta2_tilde_norm=optimal_dis(theta2_bar_norm,b);%量化
theta2=theta2_tilde_norm.*pi;%未归一化
end

