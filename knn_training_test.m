function [Status] = knn_training_test()
File=load('test_speech');
%==================Speech Disorder======================================%

rng(100);
KNNStruct_categories = fitcknn(File.Features1,File.categories,'NumNeighbors',5);
save('knnmodel.mat','KNNStruct_categories','-append');
rng(100);
KNNStruct_emotions = fitcknn(File.Features1,File.emotions,'NumNeighbors',15);
save('knnmodel.mat','KNNStruct_emotions','-append');
Status= 'KNN Model has been Trained';