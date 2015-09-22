clear all

noise=0.5;
DC=15;
AC=1;
DN=1;
fluctuation=1;
samplingrate=60;
heartrate=60;
time=10;

t=0:1/samplingrate:time;
a=4*sin(t*2*pi*heartrate/60)+4;
b=sin(t*2*pi*heartrate/60+pi*1.4)*4-3.5;


for i=1:length(a)
    if a(i)<0
        a(i)=0;
    end
end

for i=1:length(b)
    if b(i)<0
        b(i)=0;
    end
end
    
c=AC*(a+DN*b*4);
%---------Add noise

c=c+noise*rand(1,length(c));

%---------Add DC

c=c+DC;
%--------Add fluctuation

F=0.05*sin(t/2)+1;
c=fluctuation*c.*F;
plot(t,c)
