function y= g_power(x)
%输入一个标量x，输出一个标量y
%x是一个归一化角度，y是在角度x上的增益功率
y=g_scalar(x).^2;
end
