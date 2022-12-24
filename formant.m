function [ ffreq ] = formant( wav_file )
%[x,fs]=readwav(wav_file);
[son,Fs]=readwav(wav_file);
x=son;
% resample to 10,000Hz (optional)
%x=resample(x,10000,fs);
%fs=10000;
%plot waveform
%t=(0:length(x)-1)/Fs;        % times of sampling instants
%figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto','color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
%subplot(2,1,1);
%plot(t,x);
%legend('Waveform');
%xlabel('Time (s)');
%ylabel('Amplitude');
%
% get Linear prediction filter
%ncoeff=2+fs/1000;           % rule of thumb for formant estimation
%a=lpc(x,ncoeff);
%
% plot frequency response
%[h,f]=freqz(1,a,512,fs);
%subplot(2,1,2);
%plot(f,20*log10(abs(h)+eps));
%legend('LP Filter');
%xlabel('Frequency (Hz)');
%ylabel('Gain (dB)');
% find frequencies by root-solving
%r=roots(a);                  % find roots of polynomial a
%r=r(imag(r)>0.01);           % only look for roots >0Hz up to fs/2
%ffreq=sort(atan2(imag(r),real(r))*fs/(2*pi));
                             % convert to Hz and sort

% [ ffreq ] = formant( wav_file );
 ncoeff=2+Fs/1000; % rule of thumb for formant estimation

a=lpc(son,ncoeff);

[h,f]=freqz(1,a,512,Fs);
%figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto', ... 
%              'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
%subplot(2,1,1);
%plot(f,20*log10(abs(h)+eps));

%legend('LP Filtre');

%xlabel('Fréquence (Hz)');

%ylabel('Gain (dB)');

% find frequencies by root-solving

r=roots(a);
r=r(imag(r)>0.01);
ffreq=sort(atan2(imag(r),real(r))*Fs/(2*pi));
%for i=1:length(ffreq)
 %   fprintf('Formant %d Frequency %.1f\n',i,ffreq(i));
%end