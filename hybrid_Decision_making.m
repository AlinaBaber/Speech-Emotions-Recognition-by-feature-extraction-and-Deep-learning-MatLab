function [Category,Category_Percentage,Emotion,Emotion_Percentage]=hybrid_Decision_making(wav_file)
[Categories_output,Emotions_output]=hybrid_Classification(wav_file);
 [rn,cn]=find(strcmp(Categories_output,max(Categories_output)));
 if (rn ==1)
     Category='Normal';
     Category_Percentage=Categories_output(1);
 else
     Category='	Special';
     Category_Percentage=Categories_output(2);
 end
 [rn,cn]=find(strcmp(Categories_output,max(Categories_output)));
 if (rn ==1)
     Emotion='Angry';
     Emotion_Percentage=Categories_output(1);
 end
 if (rn ==2)
     Emotion='	Happy';
     Emotion_Percentage=Categories_output(2);
 end
 if (rn ==3)
     Emotion='	Neutral';
     Emotion_Percentage=Categories_output(3);
 end
 if (rn ==4)
     Emotion='	Sad';
     Emotion_Percentage=Categories_output(4);
end
 
 