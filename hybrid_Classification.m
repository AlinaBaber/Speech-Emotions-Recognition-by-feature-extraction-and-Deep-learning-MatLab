function [Category,Category_Score,Category_Cost,Category_Error,Emotion,Emotion_Score, Emotion_Cost,Emotion_Error]=hybrid_Classification(wav_file)
Hybrid_Features= hybrid_features_extraction(wav_file);
%=============SVM===========================%
[SVMCategory,SVMCategory_score,SVMCategory_Cost,SVMCategory_error,SVMEmotion,SVMEmotion_Score,SVMEmotion_Cost,SVMEmotion_Error]= svm_hybrid(Hybrid_Features);
%=============KNN=========================%
[KNNCategory,KNNCategory_score,KNNCategory_cost,KNNCategories_error,KNNEmotion,KNNEmotion_score,KNNEmotion_cost,KNNEmotion_error]= knn_hybrid(Hybrid_Features);
%==============NN==========================%
[NNCategory,NNCategory_cost,NNCategory_performance,NNCategory_output,NNCategory_error,NNEmotion,NNEmotion_cost,NNEmotion_performance ,NNEmotions_output,NNEmotion_error]=hybrid_nn_Classification(Hybrid_Features,wav_file);
HybridCategory=[SVMCategory,KNNCategory,NNCategory];
No=sum(sum(strcmp(HybridCategory,'Normal')));
S=sum(sum(strcmp(HybridCategory,'Special')));
Ca=max([No,S]);
if Ca==No
   Category ={'Normal'};
   Category_Score= [No,S];
   Category_Cost= [1,0];
   Category_Error= min([No,S]);
else
   Category ={'Special'};
   Category_Score= [No,S];
   Category_Cost= [0,1];
   Category_Error= min([No,S]);
end
HybridEmotion=[SVMEmotion,KNNEmotion,NNEmotion];


A=sum(sum(strcmp(HybridEmotion,'Angry')));
H=sum(sum(strcmp(HybridEmotion,'Happy')));
N=sum(sum(strcmp(HybridEmotion,'Neutral')));
S=sum(sum(strcmp(HybridEmotion,'Sad')));
Em=max([A,H,N,S]);
if Em==A
   Emotion ={'Angry'};
   Emotion_Score= [A,H,N,S];
   Emotion_Cost= [1,0,0,0];
   Emotion_Error= sum([H,N,S]);
end
if Em==H
   Emotion ={'Happy'};
   Emotion_Score= [A,H,N,S];
   Emotion_Cost= [0,1,0,0];
   Emotion_Error= sum([A,N,S]);
end
if Em==N
   Emotion={'Neutral'};
   Emotion_Score= [A,H,N,S];
   Emotion_Cost= [0,0,1,0];
   Emotion_Error= sum([A,H,S]);
end
if Em==S
    Emotion={'Sad'}; 
   Emotion_Score= [A,H,N,S];
   Emotion_Cost= [0,0,0,1];
   Emotion_Error= sum([A,H,N]);
end
