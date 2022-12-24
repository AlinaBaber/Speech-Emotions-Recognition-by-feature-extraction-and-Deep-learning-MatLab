function [Status] = knn_training()
File=load('speech');
%==================Speech Disorder======================================%

rng(100);
KNNStruct_categories = fitcknn(File.features,File.categories,'NumNeighbors',5);
save('knnmodels.mat','KNNStruct_categories','-append');
rng(100);
KNNStruct_emotions = fitcknn(File.features,File.emotions,'NumNeighbors',15);
save('knnmodels.mat','KNNStruct_emotions','-append');
Status= 'KNN Model has been Trained';