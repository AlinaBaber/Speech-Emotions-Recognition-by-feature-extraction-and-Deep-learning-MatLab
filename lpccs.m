function [LPCCs_Coeff,lpcddel,LPCCscepDpDD]= lpccs(wav_file)
[speech,fs]=readwav(wav_file);
%p=128; [lpc_data ]= lpc_extraction( wav_file, p );
%[LPCSs,F,M] = lpc2spec(lpc_data, 13);
%LPCCs_Coeff = lpc2cep(LPCSs,13);
LPCCs_Coeff = msf_lpcc(speech,fs);
 lpcdel = deltas(LPCCs_Coeff);
 % Double deltas are deltas applied twice with a shorter window
 lpcddel = deltas(deltas(LPCCs_Coeff,5),5);
 % Composite, 39-element feature vector, just like we use for speech recognition
 LPCCscepDpDD = [LPCCs_Coeff;lpcdel;lpcddel];