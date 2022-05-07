function a = alpha(N_t,Omega)
%输入: 标量N_t, 标量Omega; 输出: 列向量a
%Omega是取值在[-1,1]的归一化角度, a是在角度Ommega上的波束成形向量
order=0:(N_t-1);
order=order.';
a=(1/sqrt(N_t)).*exp(1i.*pi.*Omega.*order);
end