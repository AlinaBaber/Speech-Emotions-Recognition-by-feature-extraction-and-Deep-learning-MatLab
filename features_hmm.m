function [x,model ] = features_hmm( sequence )
% demos for HMM 
[dim N]=size( sequence);
d = dim;
k = 2;
n = N;
[x, model] = hmmRnd(d, k, n);
%%
z = hmmViterbi(x,model);
%%
[alpha,llh] = hmmFilter(x,model);
%%
[gamma,alpha,beta,c] = hmmSmoother(x,model);
%%
[model, llh] = hmmEm(x,k);
plot(llh)
