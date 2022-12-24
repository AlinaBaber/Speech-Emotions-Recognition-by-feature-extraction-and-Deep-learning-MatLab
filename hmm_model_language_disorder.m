function[PSTATES,STATES,TRANS,EMIS,seq,states,N] = hmm_model_language_disorder(wav_file)
[ MFCCs] = melfccformatching( wav_file );
    % Append deltas and double-deltas onto the cepstral vectors
  % MFCCs= sort(MFCCs);
 mfccdel = deltas(MFCCs);
 % Double deltas are deltas applied twice with a shorter window
 mfccddel = deltas(deltas(MFCCs,5),5);
 % Composite, 39-element feature vector, just like we use for speech recognition
 MFCCscepDpDD = [MFCCs;mfccdel;mfccddel];
S =MFCCscepDpDD;
x = {'Normal Language', 'Language Disorder'};
[dim N]= size(S); [dim1 N1]= size(x);
Q = N; O=N1;
numex=N; len=dim;
% "true" parameters
%prior0 = normalise(rand(Q,1));
TRANS = mk_stochastic(rand(Q,Q));
EMIS = mk_stochastic(rand(Q,O));
[seq,states] = hmmgenerate(len,TRANS,EMIS);
%[TRANS1,EMIS1] = hmmestimate(seq,states);
%maxiter=10;
%[TRANS_EST2, EMIS_EST2] =hmmtrain(seq,TRANS,EMIS,'maxiterations',maxiter);
STATES = hmmviterbi(seq,TRANS,EMIS);
PSTATES = hmmdecode(seq,TRANS,EMIS);

figure(),stairs(seq, 'LineWidth',2); set(gca, 'YGrid','on');
xlabel('time'), ylabel('states')
title('RastaPLP:sequence of states (1)Angry,(2)Happy,(3)Neutral,(4)Sad');