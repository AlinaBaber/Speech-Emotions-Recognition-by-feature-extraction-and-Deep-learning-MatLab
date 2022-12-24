function [lpc_data ]= lpc_function( wav_file, p )
[x,Fs]=readwav(wav_file);

%N = 2048;
 N = 2^nextpow2(size(x,1));
x_fft = fftshift(fft(x, N)); 
x_fft = x_fft(end/2:end);

[x_lpc,e] = lpc(x, p);
x_lpc_fft = fft(x_lpc, N);
x_lpc_fft = x_lpc_fft(1:end/2);
figure('Position', [30 30 800 400], 'PaperPositionMode', 'auto', 'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
%figure('Position', 'auto', 'PaperPositionMode', 'auto', 'color', 'w',
%'PaperOrientation', 'landscape', 'Visible', 'on' ); 
%subplot(2,1,1);
plot(log(abs(x_fft).^2));
hold on;
lpc_data=log(e*size(x,1)./(abs(x_lpc_fft)).^2);
plot(lpc_data, 'r');
title(['no. of coeff = ',num2str(p)]);
%legend('Product','LPC');