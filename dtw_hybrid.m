function [Category,DTW_Categories,Category_Score,Category_Error,Emotion,Emotion_Score,Emotion_Error,DTW_Emotions] = dtw_hybrid(Hybrid_features)

% Read speech samples, sampling rate and precision from file
    DTWFile=load('hybridmodels');
    [NormalDist,NormalD,Normalk,Normalw]=dtw(DTWFile.HybridDTWNormal_features,Hybrid_features);
    [SpecialDist,SpecialD,Specialk,Specialw]=dtw(DTWFile.HybridDTWSpecial_features,Hybrid_features);
    [AngryDist,AngryD,Angryk,AngryDistw]=dtw(DTWFile.HybridDTWAngry_features,Hybrid_features);
    [HappyDist,HappyD,Happyk,HappyDistw]=dtw(DTWFile.HybridDTWHappy_features,Hybrid_features);
    [NeutralDist,NeutralD,Neutralk,Neutralw]=dtw(DTWFile.HybridDTWNeutral_features,Hybrid_features);
    [SadDist,SadD,Sadk,Sadw]=dtw(DTWFile.HybridDTWSad_features,Hybrid_features);
    DTW_Categories=[NormalDist;SpecialDist];
    D_Categories=[NormalD;SpecialD];
    W_Categories=[Normalw;Specialw];
    K_Categories=[Normalk;Specialk];
    DTW_Emotions=[AngryDist;HappyDist;NeutralDist;SadDist];
    D_Emotions=[AngryD;HappyD;NeutralD;SadD];
    W_Emotions=[AngryDistw;HappyDistw;Neutralw;Sadw];
    K_Emotions=[Angryk;Happyk;Neutralk;Sadk];
    A=min(DTW_Categories(1:2,1));
    if A== DTW_Categories(1,1)
        Category={'Normal'};
        Category_Score=DTW_Categories(1,1);
        Category_Error=DTW_Categories(2,1)- DTW_Categories(1,1);
    end
    if A== DTW_Categories(2,1)
        Category={'Special'};
        Category_Score=DTW_Categories(2,1);
        Category_Error=DTW_Categories(1,1)- DTW_Categories(2,1);
    end
   E=min(DTW_Emotions(1:4,1));
    if E== DTW_Emotions(1,1)
        Emotion={'Angry'};
        Emotion_Score=DTW_Emotions(1,1);
        Emotion_Error=mean([DTW_Emotions(2,1)-DTW_Emotions(1,1),DTW_Emotions(3,1)-DTW_Emotions(1,1),DTW_Emotions(4,1)-DTW_Emotions(1,1)]);
    end
    if E== DTW_Emotions(2,1)
        Emotion={'Happy'};
       Emotion_Score=DTW_Emotions(2,1);
       Emotion_Error=mean([DTW_Emotions(1,1)-DTW_Emotions(2,1),DTW_Emotions(3,1)-DTW_Emotions(2,1),DTW_Emotions(4,1)-DTW_Emotions(2,1)]);
    
    end
    if E== DTW_Emotions(3,1)
        Emotion={'Neutral'};
         Emotion_Score=DTW_Emotions(3,1);
      Emotion_Error=mean([DTW_Emotions(1,1)-DTW_Emotions(3,1),DTW_Emotions(3,1)-DTW_Emotions(3,1),DTW_Emotions(4,1)-DTW_Emotions(3,1)]);
    
    end
    if E== DTW_Emotions(4,1)
        Emotion={'Sad'};
         Emotion_Score=DTW_Emotions(4,1);
     Emotion_Error=mean([DTW_Emotions(1,1)-DTW_Emotions(4,1),DTW_Emotions(2,1)-DTW_Emotions(4,1),DTW_Emotions(3,1)-DTW_Emotions(1,1)]);
    
    end


