% Syntax :
% [pitch] = AMDF (signal,start,finish,pitch1,pitch2)
%
% Retourne la fonction d'amplitude comparée en fonction du pitch
% en échantillons = Fe/(freq_a_tester).
% Le pitch est compris entre pitch1 et pitch2 et la fonction est
% calculée pour le signal pris entre start et finish.
%
% Fe/(pitch1) = borne de fréquence minimum
% Fe/(pitch2) = borne de fréquence maximum
% 

function [pitch] = AMDF (signal,start,finish,pitch1,pitch2,Fe)

dim_ = size(signal);
num_col = floor(dim_(1,2));
index = 0;

    for i=pitch1:1:pitch2
       index = index + 1;
       tsum=0;
       for j=start:finish
           if ((j-i)>0)&&((j-i)<num_col+1)
               tsum = tsum + abs(signal(j)-signal(j-i));
           else
               %disp('AMDF en dehors du signal');
               tsum = tsum + abs(signal(j));
           end  
       end
       APCM_vec(index) = tsum;
       pitch_vec(index) = i;
    end
    
%plot(pitch_vec,APCM_vec);   

[a,b]=min(APCM_vec);
b = pitch_vec(b);
pitch = Fe/b;






