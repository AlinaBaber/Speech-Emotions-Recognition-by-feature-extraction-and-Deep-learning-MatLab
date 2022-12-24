function [Category,Category_score,Category_cost,Emotion,Emotion_score,Emotion_cost] = knn_classification_training()
MFile= load('knnmodels');
File= load('speech');
%==================Speech Disorder======================================%
[Category,Category_score,Category_cost] = predict(MFile.KNNStruct_categories,File.features);
%==================Speech Emotions======================================%
[Emotion,Emotion_score,Emotion_cost] = predict(MFile.KNNStruct_angry,File.features);

