function p_hat_con=opti_p_con(f_RF_ideal,Q_given)
%输入列向量f_RF_ideal, 输出列向量p_con_hat
N_c=size(Q_given,2);
%%
%令Q_given*p_hat_con_1逼近f_RF_ideal_1，以转化为toolbox中的标准问题
f_RF_ideal_1= sqrt(N_c).*f_RF_ideal;
%%
%toolbox默认输出一个列向量
problem.M = complexcirclefactory (N_c);
problem.cost = @(x) norm( Q_given*x - f_RF_ideal_1 )^2;
problem.egrad = @(x) 2 .* Q_given .' * ( Q_given*x - f_RF_ideal_1);
[ p_hat_con_1 , ~ , ~ , ~ ] = trustregions(problem);
%%
p_hat_con = (1/sqrt(N_c)) .* p_hat_con_1;
end


