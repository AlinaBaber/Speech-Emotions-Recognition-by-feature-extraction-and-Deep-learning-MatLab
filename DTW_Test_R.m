function [Category_Error_Rate,Category_Accuracy_Rate,Emotion_Error_Rate,Emotion_Accuracy_Rate,Categories,Emotions,Category_SampleDistribution,Category_ErrorDistribution,Emotion_SampleDistribution,Emotion_ErrorDistribution,Category_Score,Category_Cost,Emotion_score, Emotion_cost]= DTW_Test_R()
File=load('test_speech');
[row,col]=size(File.Features1); Categories={}; Emotions={}; Category_Score=[]; Category_Cost=[]; Emotion_score=[]; Emotion_cost=[];
for i=1:row
[Category,Emotion,Category_score,Category_cost,Emotion_Score,Emotion_Cost] = DTW_comparison_test_R(File.Features1(i,:));
Categories(i)=Category;
Emotions(i)=Emotion;
Category_Score(i,:)=Category_score;
Category_Cost(i,:)=Category_cost;
Emotion_score(i,:)=Emotion_Score;
Emotion_cost(i,:)=Emotion_Cost;
end
DTW_Category_Analysis = classperf(File.categories,Categories);
Category_Error_Rate=DTW_Category_Analysis.ErrorRate;
Category_Accuracy_Rate=DTW_Category_Analysis.CorrectRate;
DTW_Emotion_Analysis = classperf(File.emotions,Emotions);
Emotion_Error_Rate=DTW_Emotion_Analysis.ErrorRate;
Emotion_Accuracy_Rate=DTW_Emotion_Analysis.CorrectRate;
Category_SampleDistribution=DTW_Category_Analysis.SampleDistribution;
Category_ErrorDistribution=DTW_Category_Analysis.ErrorDistribution;
Emotion_SampleDistribution=DTW_Emotion_Analysis.SampleDistribution;
Emotion_ErrorDistribution=DTW_Emotion_Analysis.ErrorDistribution;
figure(1),subplot(2,1,1);
bar(Category_SampleDistribution-Category_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Category Performance');
subplot(2,1,2);
bar(Emotion_SampleDistribution-Emotion_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Emotion Performance');
figure(2),subplot(2,1,1);
bar(Category_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Category Error');
subplot(2,1,2);
bar(Emotion_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Emotion Error');