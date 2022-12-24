function [Category_Error_Rate,Category_Accuracy_Rate,Emotion_Error_Rate,Emotion_Accuracy_Rate,Categories,Emotions,Category_SampleDistribution,Category_ErrorDistribution,Emotion_SampleDistribution,Emotion_ErrorDistribution,Categories_ffnn,Emotions_ffnn]= FFNN_Test()
File=load('Speech'); Result_File=load('test_results.mat');
FFNN=load('feedforwardnn'); Categories={}; Emotions={}; 
Categories_ffnn=[];
save('test_results.mat','Categories_ffnn','-append');
NormalEmotions_ffnn=[];
save('test_results.mat','NormalEmotions_ffnn','-append');
SpecialEmotions_ffnn=[];
save('test_results.mat','SpecialEmotions_ffnn','-append'); 
[row,col]=size(File.features); 
Categories_nn=FFNN.categories_net(transpose(File.features));
Emotions_nn=FFNN.emotiones_net(transpose(File.features));
Categories_ffnn=[]; Emotions_ffnn=[];
Categories_nn=Categories_nn; Emotions_nn=Emotions_nn;
A=max(Categories_nn);
B=max(Emotions_nn);
for i=1:row
     
    if Categories_nn(1,i)==A(i)
    Categories(i)={'Normal'};
    Categories_ffnn(i,:)=[1,0];
    else
     Categories(i)={'Special'}; 
     Categories_ffnn(i,:)=[0,1];
    end

end
for i=1:row

if Emotions_nn(1,i)==B(i)
    Emotions(i)={'Angry'};
    Emotions_ffnn(i,:)=[1,0,0,0];
end
if Emotions_nn(2,i)==B(i)
Emotions(i)={'Happy'}; 
Emotions_ffnn(i,:)=[0,1,0,0];
end 
if Emotions_nn(3,i)==B(i)
Emotions(i)={'Neutral'};
Emotions_ffnn(i,:)=[0,0,1,0];
end
if Emotions_nn(4,i)==B(i)
   Emotions(i)={'Sad'};  
   Emotions_ffnn(i,:)=[0,0,0,1];
end

end
Result_File=load('test_results.mat');
Categories_ffnn=[Result_File.Categories_ffnn;Categories_ffnn];
save('test_results.mat','Categories_ffnn','-append');

for i=1:row
    Result_File=load('test_results.mat');
if strcmp(Result_File.Categories(i),'Normal')==1
 NormalEmotions_ffnn=[Result_File.NormalEmotions_ffnn;Emotions_ffnn(i,:)];
 save('test_results.mat','NormalEmotions_ffnn','-append');
else
 SpecialEmotions_ffnn=[Result_File.SpecialEmotions_ffnn;Emotions_ffnn(i,:)];
save('test_results.mat','SpecialEmotions_ffnn','-append'); 
end
end


NN_Category_Analysis = classperf(File.categories,transpose(Categories));
Category_Error_Rate=NN_Category_Analysis.ErrorRate;
Category_Accuracy_Rate=NN_Category_Analysis.CorrectRate;
NN_Emotion_Analysis = classperf(File.emotions,transpose(Emotions));
Emotion_Error_Rate=NN_Emotion_Analysis.ErrorRate;
Emotion_Accuracy_Rate=NN_Emotion_Analysis.CorrectRate;
Category_SampleDistribution=NN_Category_Analysis.SampleDistribution;
Category_ErrorDistribution=NN_Category_Analysis.ErrorDistribution;
Emotion_SampleDistribution=NN_Emotion_Analysis.SampleDistribution;
Emotion_ErrorDistribution=NN_Emotion_Analysis.ErrorDistribution;
figure(1),subplot(2,1,1);
bar(Category_SampleDistribution-Category_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Category Performance');
subplot(2,1,2);
bar(Emotion_SampleDistribution-Emotion_ErrorDistribution); xlabel('Samples');ylabel('Accuracy Rate'); title('Emotion Performance');
figure(2),subplot(2,1,1);
bar(Category_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Category Error');
subplot(2,1,2);
bar(Emotion_ErrorDistribution); xlabel('Samples');ylabel('Error Rate'); title('Emotion Error');
