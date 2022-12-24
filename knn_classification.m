function [Category,Category_score,Categories_error,Category_cost,Emotion,Emotion_score,Emotion_error,Emotion_cost] = knn_classification(wav_file)
Features= allfeatures_extraction( wav_file );
MFile= load('knnmodels');
%==================Speech Disorder======================================%
[Category,Category_score,Category_cost] = predict(MFile.KNNStruct_categories,Features);
DS=max(Category_score);
if DS==Category_score(1)
    Category_cost=[1,0];
else
    Category_cost=[0,1]; 
end
Categories_error = loss(MFile.KNNStruct_categories,Features,Category);
%==================Speech Emotions======================================%
[Emotion,Emotion_score,Emotion_cost] = predict(MFile.KNNStruct_emotions,Features);
Emotion_error = loss(MFile.KNNStruct_emotions,Features,Emotion);
DS=max(Emotion_score);
if DS==Emotion_score(1)
    Emotion_cost=[1,0,0,0];
end
if DS==Emotion_score(2)
    Emotion_cost=[0,1,0,0]; 
end
if DS==Emotion_score(3)
    Emotion_cost=[0,0,1,0];
end
if DS==Emotion_score(4)
    Emotion_cost=[0,0,0,1]; 
end
