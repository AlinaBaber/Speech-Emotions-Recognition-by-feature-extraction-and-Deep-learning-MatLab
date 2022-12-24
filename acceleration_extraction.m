function [acceleration1,velocity1,t,t1,rate_of_acceleration]= acceleration_extraction(wav_file)
[x,fs]=readwav( wav_file);
t=(0:length(x)-1)/fs;
%x1=0.4*t.^4+10.8*t.^3-64.4*t.^2-28.2*t+4.4;
x1=(0.4*t.^4)+(10.8*t.^3)-(64.4*t.^2)-(28.2*t)+4.4;
%v=gradient(x1,0.01);
%a=diff(v);
t=(0:length(x)-1)/fs;
v=diff(x1);
a=gradient(v,0.01);
%t=0:0.1:8-0.1;
%X=subs(x,t);
%X=[x;t];
%V=[v;t];
%A=[a;t];
%V=subs(v,t);
%A=subs(a,t);

t1=diff(t);
%a= diff(v);
%figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto', ... 
%            'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
%subplot(3,1,1);
%plot(t,x);
%subplot(3,1,2);
velocity1=v;
%plot(t1,v);
%subplot(3,1,3);
acceleration1=a;  %figure,plot(t,x); figure, plot(t1,v); figure, plot(t1,acc);
%legend(' Position','Velocity','Acceleration')
%plot(t2,a);
%legend(' Position','Velocity','Acceleration');
figure;
subplot(2,1,1);
plot(acceleration1);
legend('Acceleration');
ylabel(' Aceleration (meter/s^2)');
xlabel('Time (s)');
subplot(2,1,2);
plot(velocity1); % subplot(velocity);
legend('Velocity');
ylabel(' Velocity (m/s)');
xlabel('Time (s)');
rate_of_acceleration = mean(acceleration1);
