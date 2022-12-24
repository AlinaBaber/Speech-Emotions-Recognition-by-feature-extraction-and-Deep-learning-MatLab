function [Intensity_of_Sound,f]= intensity_extraction(wav_file)
[x,fs]=readwav( wav_file);
ms1=fs/1000; %Maximum speech Fx at 1000Hz.
ms20=fs/50;  %Minimum speech Fx at 50Hz.
%-------Plot waveform---------
t=(0:length(x)-1)/fs; %times of instants.
%-------- do fourier transform of windowed signal
Y=fft(x.*hamming(length(x)));
%------- Plot spectrum of bottom 5000Hz
hz5000=5000*length(Y)/fs;
f=(0:hz5000)*fs/length(Y);
magnitude=20*log10(abs(Y(1:length(f)))+eps);                            % DFT of x
%magnitude = abs(Y);                            % Magnitud
 %decibels = mag2db(magnitude); %a=transpose(decibels);
  %decibels = mag2db(magnitude);
%plot(f,magnitude);
%legend('Spectrum');
%xlabel('Frequency (Hz)');
%ylabel('Magnitude (dB)');
%-------- ceptrum is DFT of log spectrum
C= fft (log(abs(Y)+eps));
%-----Plot between 1ms(-1000Hz) and 20ms (50Hz)
%q=(ms1:ms20)/fs;
%subplot(3,1,1);
%subplot(313);
Amplitude=abs(C(ms1:ms20));
t=(0:length(x)-1)/fs;
%x1=0.4*t.^4+10.8*t.^3-64.4*t.^2-28.2*t+4.4;
x1=(0.4*t.^4)+(10.8*t.^3)-(64.4*t.^2)-(28.2*t)+4.4;
velocity=diff(x1);
density_of_air = 0.001225;
 Intensity_of_Sound = 2* ((3.14159).^2)*((fs).^2)*((Amplitude).^2)*density_of_air*velocity;
 Intensity_of_Sound= mean(Intensity_of_Sound);
 

