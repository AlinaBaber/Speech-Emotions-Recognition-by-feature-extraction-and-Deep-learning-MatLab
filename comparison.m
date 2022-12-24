function [Category,Category_Cost,Category_Score,Category_Error,DTW_Categories,Emotion,Emotion_Cost,Emotion_Score,Emotion_Error,DTW_Emotions] = comparison(wav_file)
 % Read speech samples, sampling rate and precision from file
DTWFile=load('dtwdata');
features= allfeatures_extraction( wav_file );
    [NormalDist,NormalD,Normalk,Normalw]=dtw(DTWFile.Normal_features,features);
    [SpecialDist,SpecialD,Specialk,Specialw]=dtw(DTWFile.Special_features,features);
    [AngryDist,AngryD,Angryk,AngryDistw]=dtw(DTWFile.Angry_features,features);
    [HappyDist,HappyD,Happyk,HappyDistw]=dtw(DTWFile.Happy_features,features);
    [NeutralDist,NeutralD,Neutralk,Neutralw]=dtw(DTWFile.Neutral_features,features);
    [SadDist,SadD,Sadk,Sadw]=dtw(DTWFile.Sad_features,features);
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
        Category_Cost=[1,0];
        Category_Score=DTW_Categories(1,1);
        Category_Error=DTW_Categories(2,1)- DTW_Categories(1,1);
    end
    if A== DTW_Categories(2,1)
        Category={'Special'};
        Category_Cost=[0,1];
        Category_Score=DTW_Categories(2,1);
        Category_Error=DTW_Categories(1,1)- DTW_Categories(2,1);
    end
   E=min(DTW_Emotions(1:4,1));
    if E== DTW_Emotions(1,1)
        Emotion={'Angry'};
        Emotion_Cost=[1,0,0,0];
        Emotion_Score=DTW_Emotions(1,1);
        Emotion_Error=mean([DTW_Emotions(2,1)-DTW_Emotions(1,1),DTW_Emotions(3,1)-DTW_Emotions(1,1),DTW_Emotions(4,1)-DTW_Emotions(1,1)]);
    end
    if E== DTW_Emotions(2,1)
        Emotion={'Happy'};
        Emotion_Cost=[0,1,0,0];
       Emotion_Score=DTW_Emotions(2,1);
       Emotion_Error=mean([DTW_Emotions(1,1)-DTW_Emotions(2,1),DTW_Emotions(3,1)-DTW_Emotions(2,1),DTW_Emotions(4,1)-DTW_Emotions(2,1)]);
    
    end
    if E== DTW_Emotions(3,1)
        Emotion={'Neutral'};
        Emotion_Cost=[0,0,1,0];
         Emotion_Score=DTW_Emotions(3,1);
      Emotion_Error=mean([DTW_Emotions(1,1)-DTW_Emotions(3,1),DTW_Emotions(3,1)-DTW_Emotions(3,1),DTW_Emotions(4,1)-DTW_Emotions(3,1)]);
    
    end
    if E== DTW_Emotions(4,1)
        Emotion={'Sad'};
        Emotion_Cost=[0,0,0,1];
         Emotion_Score=DTW_Emotions(4,1);
     Emotion_Error=mean([DTW_Emotions(1,1)-DTW_Emotions(4,1),DTW_Emotions(2,1)-DTW_Emotions(4,1),DTW_Emotions(3,1)-DTW_Emotions(1,1)]);
    
    end


