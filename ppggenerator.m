close all

noise=0.1;
DC=20;
AC=3;
DC2=10;
AC2=1;
DN=1;
fluctuation=1;
ff=1; %fluctuation frequency
samplingrate=120;
heartrate=60;
time=300;

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
    
c=AC*(a+DN*b*4)/10;
%---------Add noise

c=c+noise*rand(1,length(c))/2;

%---------Add DC

c=c+DC;
%--------Add fluctuation

if fluctuation ~= 0
    F=0.05*sin(ff*t/2);%+1;
    %c=fluctuation*c.*F;
    c1=fluctuation*c+10*F;
end
subplot(2,1,1)
plot(t,c1)
axis([0 max(t) 0 max(c1)])


%-------wave 2



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
    
c=AC2*(a+DN*b*4)/10;
%---------Add noise

c=c+noise*rand(1,length(c))/2;

%---------Add DC

c=c+DC2;
%--------Add fluctuation

if fluctuation ~= 0
    F=0.05*sin(ff*t/2);%+1;
    %c=fluctuation*c.*F;
    c2=fluctuation*c+10*F;
end

subplot(2,1,2)
plot(t,c2)
axis([0 max(t) 0 max(c2)])
