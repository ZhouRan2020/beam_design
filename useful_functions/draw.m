function  draw(v,col,N_draw)
%输入列向量v,颜色col,标量N_draw
%v是一个范数为1的向量, N_draw是绘图的函数采样点数
N_t=length(v);
%%
%通过函数计算出每个采样点上的增益的模值
angle_sample=linspace(-1,1,N_draw);
gain_complex=zeros(1,N_draw);
for i=1:N_draw
    gain_complex(1,i)=sqrt(N_t).*alpha(N_t,angle_sample(i))'*v;
end
gain_sample=abs(gain_complex);
%%
%绘图
plot(angle_sample,gain_sample,Color=col);

end

