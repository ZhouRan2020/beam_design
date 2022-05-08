clear;
clc;
%%
%天线根数N_t
N_t=128;
%生成理想码字时的空间量化份数K
K=256;
%K个相位，每个相位被优化的次数S_each
S_each=16;
%每个射频链路，N_c个移相器为一组，通过开关网络全连接到N_t根天线
N_c=8;
%N_RF个射频链路
N_RF=4;
%移相器精度b
b=3;
%交替优化F_RF和f_BB以逼近v_ideal的过程中，每个矩阵被优化的次数
R_max=16;
%交替优化Q_i和p_i以逼近f_RF_i_ideal的过程中，每个矩阵被优化的次数
T_max=16;
%画图时，采样点的个数N_draw
N_draw=100000;
%%
%%通过icd算法由N_t生成理想码字v_ideal
v_ideal = icd(N_t,K,S_each);
%%
%通过交替最优化F_RF和f_BB由v_ideal得到估计S_t_hat,P_t_hat,f_BB_hat
[S_t_hat,P_t_hat,f_BB_hat]=crossopti_Ff(v_ideal,N_c,N_RF,b,R_max,T_max);
v_p=S_t_hat*P_t_hat*f_BB_hat;
%%
[F_RF_hat_fs,f_BB_hat_fs]=crossopti_Ff_fs(v_ideal,N_RF,b,R_max);
v_p_fs=F_RF_hat_fs*f_BB_hat_fs;
%%
%绘图
figure(3);
draw(v_ideal,'g',N_draw);
title('增益图');
xlabel('归一化角度');
ylabel('增益的模');
hold on;
draw(v_p_fs,'b',N_draw);
hold on;
draw(v_p,'r',N_draw);
legend('v_{ideal}','v^{fs}_p','v_p');
hold off;