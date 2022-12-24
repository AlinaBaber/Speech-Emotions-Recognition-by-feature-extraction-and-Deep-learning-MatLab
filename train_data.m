function [status] = train_data(wav_file)

[ frequency,intensity,amplitude,pitch,accelerat,formant, LPCCscepDpDD,  MFCCscepDpDD,RastaPLPcepDpDD,Power,Energy ] = allfeatures_extraction( wav_file  );
%------------------HMM Modeling---------------------------------------------------

%intensity=transpose(intensity);
%[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(intensity);
%A=max(intensity_seq);
%figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on');
%xlabel('time'), ylabel('states')
%title('sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');
%accelerat=transpose(accelerat);
%[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(accelerat);
%B=max(intensity_seq);
%figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on');
%xlabel('time'), ylabel('states')
%title('sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');
pitch=[max(pitch);min(pitch);mean(pitch)];
[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(pitch);
C=intensity_seq;
figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on'); hold on; plot(intensity_seq);hold on; plot(STATES);
xlabel('time'), ylabel('states')
title('Pitch:sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');
[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(formant);
D=intensity_seq;
figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on'); hold on; plot(intensity_seq);hold on; plot(STATES);
xlabel('time'), ylabel('states')
title('Formant:sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');
%[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(LPCCscepDpDD);
%E=max(intensity_seq);
%figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on');
%xlabel('time'), ylabel('states')
%title('sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');

[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(MFCCscepDpDD);
F=intensity_seq;
figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on'); hold on; plot(intensity_seq);hold on; plot(STATES);
xlabel('time'), ylabel('states')
title('MFCCs:sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');
[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(RastaPLPcepDpDD);
G=mean(intensity_seq);
figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on'); hold on; plot(intensity_seq);hold on; plot(STATES);
xlabel('time'), ylabel('states')
title('RastaPLP:sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');

%[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(Power);
%H=max(intensity_seq);
%figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on');
%xlabel('time'), ylabel('states')
%title('sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');
%[PSTATES,STATES,TRANS,EMIS,intensity_seq,states,N] = hmm_model(Energy);
%I=max(intensity_seq);
%figure(),stairs(intensity_seq, 'LineWidth',2); set(gca, 'YGrid','on');
%xlabel('time'), ylabel('states')
%title('sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');
status=[C,D,F,G;];
a=transpose(status);
figure(),stairs(a, 'LineWidth',2); set(gca, 'YGrid','on'); hold on; plot(intensity_seq);hold on; plot(STATES);
xlabel('time'), ylabel('states')
title('Over All sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');


%end
%end