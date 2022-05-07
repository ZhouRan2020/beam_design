function beam_gain = normalized_g(Ommega)
%输入行向量Ommega，输出行向量beam_gain
%Ommega是采样角度，beam_gain是采样角度上的归一化增益
f=@g_power;
B = integral(f,-1,1);
beam_gain=sqrt(2/B).*g(Ommega);
end
