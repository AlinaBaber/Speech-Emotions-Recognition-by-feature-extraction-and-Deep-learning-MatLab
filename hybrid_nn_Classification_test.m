function [Category,Emotion]=hybrid_nn_Classification_test(Hybrid_Features)
MFile= load('hybridmodels'); File= load('speech');
%Tr_categories=MFile.NNTr_categories;
%Tr_emotions=MFile.NNTr_emotions;
[rn,col]=find(strcmp(File.hybrid_features,Hybrid_Features));
%targets1=transpose(File.categories_nn(rn,:));
%targets2=transpose(File.emotions_nn(rn,:));
%==================Speech Disorder======================================%
% Test the Network
Features=transpose(Hybrid_Features);
Category_output=MFile.HybridNNStruct_categories(Features);
%Category_errors = gsubtract(targets1,Category_output);
%Category_performance = perform(MFile.HybridNNStruct_categories,targets1,Category_output);
%Category_performance= max([performance1,performance2]);
%Category_error=min(Category_errors);
A=max(Category_output);
if A==Category_output(1)
    Category={'Normal'};
    Category_cost=[1,0];
else
    Category={'Special'}; 
    Category_cost=[0,1];
end
% Plots
% Uncomment these lines to enable various plots.
% figure, plotperform(tr)
% figure, plottrainstate(tr)
%figure, plotconfusion(targets1,Category_output)
%figure, ploterrhist(Category_errors)
%Categories_errors = gsubtract(targets,frequency_categories_outputs);
%Categories_performance = perform(MFile.NNStruct_frequency_categories,targets,frequency_categories_outputs);
%==================Speech Emotions======================================%
Emotions_output=MFile.HybridNNStruct_emotions(Features);
%frequency_errors = gsubtract(targets,frequency_emotions_outputs);
%frequency_performance = perform(MFile.NNStruct_frequency_emotions,targets,frequency_emotions_outputs);
%Emotion_errors = gsubtract(targets2,Emotions_output);
%Emotion_performance = perform(MFile.HybridNNStruct_emotions,targets2,Emotions_output);
%Emotion_performance= max([performance1,performance2,performance3,performance4]);
%Emotion_error=min(Emotion_errors);

% Plots
% Uncomment these lines to enable various plots.
% figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotconfusion(targets2,Emotions_output)
%figure, ploterrhist(Emotion_errors)
A=max(Emotions_output);
if A==Emotions_output(1)
    Emotion={'Angry'};
    Emotion_cost=[1,0,0,0];
end
if A==Emotions_output(2)
   Emotion={'Happy'}; 
   Emotion_cost=[0,1,0,0];
end
if A==Emotions_output(3)
   Emotion={'Neutral'}; 
   Emotion_cost=[0,0,1,0];
end
if A==Emotions_output(4)
   Emotion={'Sad'};  
   Emotion_cost=[0,0,0,1];
end
%figure, ploterrhist(errors);