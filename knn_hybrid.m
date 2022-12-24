function [Category,Category_score,Category_cost,Categories_error,Emotion,Emotion_score,Emotion_cost,Emotion_error]= knn_hybrid(Hybrid_Features)
MFile= load('hybridmodels');
%==================Speech Disorder======================================%
[Category,Category_score,Category_cost] = predict(MFile.HybridKNNStruct_categories,Hybrid_Features);
Categories_error = loss(MFile.HybridKNNStruct_categories,Hybrid_Features,Category);
%==================Speech Emotions======================================%
[Emotion,Emotion_score,Emotion_cost] = predict(MFile.HybridKNNStruct_emotions,Hybrid_Features);
Emotion_error = loss(MFile.HybridKNNStruct_emotions,Hybrid_Features,Emotion);