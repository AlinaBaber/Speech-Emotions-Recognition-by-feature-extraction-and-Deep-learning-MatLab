function [Status] = gmm_training()
File=load('speech');
%options = statset('Display','final');
%==================Speech Disorder======================================%
%----(1)----------Frequency--------------
[~,score] = pca(File.frequency,'NumComponents',1);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_frequency_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_frequency_categories','-append');
%----(2)--------- Pitch Contour-----------
[~,score] = pca(File.pitch_contour,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_pitch_contour_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_pitch_contour_categories','-append');
%----(3)--------- Pitch Autocorrelation-----------
[~,score] = pca(File.pitch_autocorrelation,'NumComponents',1);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_pitch_autocorrelation_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_pitch_autocorrelation_categories','-append');
%----(4)-------Acceleration----------
[~,score] = pca(File.acceleration,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_acceleration_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_acceleration_categories','-append');
%----(5)------- Intensity of Sound----------
[~,score] = pca(File.intensity,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_intensity_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_intensity_categories','-append');
%----(6)------- Formant Frequencies----------
[~,score] = pca(File.formants,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_formants_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_formants_categories','-append');
%----(7)------- LPCCs----------
[~,score] = pca(File.lpcc,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_lpcc_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_lpcc_categories','-append');
%----(8)------- MFCCs----------
[~,score] = pca(File.mfcc,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_mfcc_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_mfcc_categories','-append');
%----(9)------- RastaPLP----------
[~,score] = pca(File.rastaplp,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_rastaplp_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_rastaplp_categories','-append');
%----(10)------- Energy----------
[~,score] = pca(File.energy,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_energy_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_energy_categories','-append');
%----(11)------- Power----------
[~,score] = pca(File.power,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_power_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_power_categories','-append');
%----(12)------- Rate of Zero Passage----------
[~,score] = pca(File.rate_of_zero_passage,'NumComponents',2);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_rate_of_zero_passage_categories = fitgmdist(score,2,'Options',options);
save('gmmmodels.mat','GMMStruct_rate_of_zero_passage_categories','-append');
%==================Speech Emotions======================================%
%----(1)----------Frequency--------------
[~,score] = pca(File.frequency,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_frequency_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_frequency_categories','-append');
%----(2)--------- Pitch Contour-----------
[~,score] = pca(File.pitch_contour,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_pitch_contour_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_pitch_contour_categories','-append');
%----(3)--------- Pitch Autocorrelation-----------
[~,score] = pca(File.pitch_autocorrelation,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_pitch_autocorrelation_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_pitch_autocorrelation_categories','-append');
%----(4)-------Acceleration----------
[~,score] = pca(File.acceleration,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_acceleration_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_acceleration_categories','-append');
%----(5)------- Intensity of Sound----------
[~,score] = pca(File.intensity,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_intensity_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_intensity_categories','-append');
%----(6)------- Formant Frequencies----------
[~,score] = pca(File.formants,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_formants_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_formants_categories','-append');
%----(7)------- LPCCs----------
[~,score] = pca(File.lpcc,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_lpcc_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_lpcc_categories','-append');
%----(8)------- MFCCs----------
[~,score] = pca(File.mfcc,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_mfcc_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_mfcc_categories','-append');
%----(9)------- RastaPLP----------
[~,score] = pca(File.rastaplp,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_rastaplp_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_rastaplp_categories','-append');
%----(10)------- Energy----------
[~,score] = pca(File.energy,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_energy_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_energy_categories','-append');
%----(11)------- Power----------
[~,score] = pca(File.power,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_power_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_power_categories','-append');
%----(12)------- Rate of Zero Passage----------
[~,score] = pca(File.rate_of_zero_passage,'NumComponents',4);
options = statset('MaxIter',1000);
rng(1); % For reproducibility
GMMStruct_rate_of_zero_passage_categories = fitgmdist(score,4,'Options',options);
save('gmmmodels.mat','GMMStruct_rate_of_zero_passage_categories','-append');
Status= 'GMM Model has been Trained';