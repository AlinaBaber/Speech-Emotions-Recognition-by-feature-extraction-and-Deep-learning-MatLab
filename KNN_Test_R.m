function [Category_Error_Rate,Category_Accuracy_Rate,Emotion_Error_Rate,Emotion_Accuracy_Rate,Category,Emotion,Category_SampleDistribution,Category_ErrorDistribution,Emotion_SampleDistribution,Emotion_ErrorDistribution,Category_score,Category_cost,Emotion_score,Emotion_cost]= KNN_Test_R()
MFile=load('knnmodel');
File=load('test_speech');
%==================Speech Disorder======================================%
[Category,Category_score,Category_cost] = predict(MFile.KNNStruct_categories,File.Features1);
KNN_Category_Analysis = classperf(File.categories,Category);
Category_Error_Rate=KNN_Category_Analysis.ErrorRate;
Category_Accuracy_Rate=KNN_Category_Analysis.CorrectRate;
%==================Speech Emotions======================================%
[Emotion,Emotion_score,Emotion_cost] = predict(MFile.KNNStruct_emotions,File.Features1);
KNN_Emotion_Analysis = classperf(File.emotions,Emotion);
Emotion_Error_Rate=KNN_Emotion_Analysis.ErrorRate;
Emotion_Accuracy_Rate=KNN_Emotion_Analysis.CorrectRate;
Category_SampleDistribution=KNN_Category_Analysis.SampleDistribution;
Category_ErrorDistribution=KNN_Category_Analysis.ErrorDistribution;
Emotion_SampleDistribution=KNN_Emotion_Analysis.SampleDistribution;
Emotion_ErrorDistribution=KNN_Emotion_Analysis.ErrorDistribution;
figure(1),subplot(2,1,1);
bar(Category_SampleDistribution-Category_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Category Performance');
subplot(2,1,2);
bar(Emotion_SampleDistribution-Emotion_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Emotion Performance');
figure(2),subplot(2,1,1);
bar(Category_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Category Error');
subplot(2,1,2);
bar(Emotion_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Emotion Error');