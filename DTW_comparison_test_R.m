function [Category,Emotion,Category_Score,Category_Cost,Emotion_Score,Emotion_Cost] = DTW_comparison_test_R(features)
 % Read speech samples, sampling rate and precision from file
DTWFile=load('dtwdatas');
%features= allfeatures_extraction( wav_file );
    [NormalDist]=dtw(DTWFile.Normal_Features1,features);
    [SpecialDist]=dtw(DTWFile.Special_Features1,features);
    [AngryDist]=dtw(DTWFile.Angry_Features1,features);
    [HappyDist]=dtw(DTWFile.Happy_Features1,features);
    [NeutralDist]=dtw(DTWFile.Neutral_Features1,features);
    [SadDist]=dtw(DTWFile.Sad_Features1,features);
    DTW_Categories=[NormalDist;SpecialDist];
    DTW_Emotions=[AngryDist;HappyDist;NeutralDist;SadDist];
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


