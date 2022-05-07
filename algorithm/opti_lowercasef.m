function f_BB_hat = opti_lowercasef(v_ideal , F_RF_given)
%输入一个列向量v_ideal, 输出一个列向量f_BB_hat
%%
%超定问题, 利用matlab自带的功能求最小二乘解
f_BB_hat=F_RF_given\v_ideal;
%%
%及时规范化f_BB_hat以保证v的合法性
f_BB_hat= f_BB_hat./norm(F_RF_given* f_BB_hat);
end