function [Frequency,t,x,f,magnitude,q,amplitude] = frequency( wav_file )
[x,fs]=readwav( wav_file);
ms1=fs/1000; %Maximum speech Fx at 1000Hz.
ms20=fs/50;  %Minimum speech Fx at 50Hz.
%-------Plot waveform---------
t=(0:length(x)-1)/fs; %times of instants.
%figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto', ... 
 %             'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
%subplot(3,1,1);
%subplot(300);
%plot(t,x);
%legend('Waveform');
%xlabel('Time(s)');
%ylabel('Amplitude');
%-------- do fourier transform of windowed signal
Y=fft(x.*hamming(length(x)));
%------- Plot spectrum of bottom 5000Hz
hz5000=5000*length(Y)/fs;
f=(0:hz5000)*fs/length(Y);
%subplot(3,1,2);
%subplot(313);
%FFT spectrum
magnitude=20*log10(abs(Y(1:length(f)))+eps);
 %decibels = mag2db(magnitude);
%plot(f,magnitude);
%legend('Spectrum');
%xlabel('Frequency (Hz)');
%ylabel('Magnitude (dB)');
%-------- ceptrum is DFT of log spectrum
C= fft (log(abs(Y)+eps));
%-----Plot between 1ms(-1000Hz) and 20ms (50Hz)
q=(ms1:ms20)/fs;
%subplot(3,1,1);
%subplot(313);
amplitude=abs(C(ms1:ms20));
%plot(q,amplitude);
%legend('Cepstrm');
%xlabel('Quefrency (S)');
%ylabel('Amplitude');
[c,fx]=max(abs(C(ms1:ms20)));
Frequency =fs/(ms1+fx-1);
