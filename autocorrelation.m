function [ rmax, PFr] = autocorrelation( wav_file )
[x,fs]=readwav(wav_file);
ms20=fs/50; %minimum speech Fx at 50hz;
%------------Plot waveform
t=[0:length(x)-1/fs]; %times of sampling instants
figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto', ... 
              'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
subplot (2,1,1);
plot(t,x);
legend('Waveform');
xlabel('Time (s)');
ylabel('Amplitude');
%-------Calculate autocorrelation
r=xcorr(x,ms20,'coeff');
%-----plot autocorrelation
d=[-ms20:ms20]/fs; %times of delays
subplot(2,1,2);
plot(d,r);
legend('Autocorrelation');
xlabel('Delay (s)');
ylabel('Correlation Coeff.');
ms2=fs/500 ;                % maximum speech Fx at 500Hz
ms20=fs/50;                 % minimum speech Fx at 50Hz
r=r(ms20+1:2*ms20+1);
[rmax,tx]=max(r(ms2:ms20));
PFr=fs/(ms2+tx-1);