function[PSTATES,STATES,TRANS,EMIS,seq,states,N] = hmm_model(Data)
S = Data;
x = {'Angry', 'Happy','Neutral','Sad'};
[dim N]= size(S); [dim1 N1]= size(x);
Q = N; O=N1;
numex=N; len=dim;
% "true" parameters
%prior0 = normalise(rand(Q,1));
TRANS = mk_stochastic(rand(Q,Q));
EMIS = mk_stochastic(rand(Q,O));
[seq,states] = hmmgenerate(len,TRANS,EMIS);
[TRANS1,EMIS1] = hmmestimate(seq,states);
%maxiter=10;
[TRANS_EST2, EMIS_EST2] =hmmtrain(seq,TRANS,EMIS,'maxiterations',maxiter);
STATES = hmmviterbi(seq,TRANS,EMIS);
PSTATES = hmmdecode(seq,TRANS,EMIS);