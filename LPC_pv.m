%
% Syntax :
% LPC_pv(file_name);
%
% Fonction ki retourne pour un fichier donné, les coefficients
% le gain et le pitch des trames de 22.5 ms.
%

function [axe_time,signal]=LPC_pv(file_name);


[signal,Fe] = wavread(file_name);
%plot(signal);
dim_signal = size(signal);
num_samples = dim_signal(1,1);
savefile = 'necht.mat';
save(savefile,'Fe','num_samples')


reste = mod( num_samples , 180 );
%disp(reste);

for i=num_samples:num_samples + (181 - reste)
    signal(i) = 0;
end

for i=1:180:num_samples - reste + 180
    %disp(i);
    %rvoise_ou_pa2(transpose(signal),i,i+180,Fe,2);    
    [voise,bb]=pitch_par_fft(signal,i,i+180,Fe);
    %disp(sprintf('\n voise = %i, pitch = %.1f',voise,b));
    [pitch1]=amdf(transpose(signal),i,i+180,20,160,Fe);
    %disp(sprintf('AMDF : Resultat par AMDF, pitch = %.1f Hz',pitch));
    [pitch2]=pitch_autocor(signal,i,i+180,20,160,Fe,2);
    %disp(sprintf('pitch_autocor : Resultat par auto-corrélation, pitch = %.1f Hz',pitch));
    if ((pitch1 > 380) && (pitch2 > 380))||(voise==0)
        %disp(sprintf('%i -> %i : non voisé',i,i+180));
        for j=i:i+180
            signal_voise(j) = -0.8;
        end
    else
        for j=i:i+180
            signal_voise(j) = 0.8;
        end
        [a,b]=min([pitch1 pitch2]);
       % disp(sprintf('%i -> %i : voisé, pitch = %.1f Hz (min(%.1f,%.1f))',i,i+180,a,pitch1,pitch2));      
    end
    
end


axe_time = 1:num_samples + (181 - reste);
axe_time = axe_time / Fe;
plot(axe_time,signal)
hold on;
plot(axe_time,signal_voise,'r.');zoom xon
xlabel('temps(s)');
ylabel('amplitude');
title(['Signal et décision voisé ou non voisé : ',file_name],'FontSize',14,'color','b');
legend('Son produit','Son Voisé')
hold off;
