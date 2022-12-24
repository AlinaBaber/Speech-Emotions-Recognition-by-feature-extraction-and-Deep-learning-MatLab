function [Category_Error_Rate,Category_Accuracy_Rate,Emotion_Error_Rate,Emotion_Accuracy_Rate,Categories,Emotions,Category_SampleDistribution,Category_ErrorDistribution,Emotion_SampleDistribution,Emotion_ErrorDistribution,Categories_cfnn,Emotions_cfnn]= CFNN_Test()
File=load('Speech'); Result_File=load('test_results.mat');
CFNN=load('cascadeforwardnn'); Categories={}; Emotions={}; 
Categories_cfnn=[];
save('test_results.mat','Categories_cfnn','-append');
NormalEmotions_cfnn=[];
save('test_results.mat','NormalEmotions_cfnn','-append');
SpecialEmotions_cfnn=[];
save('test_results.mat','SpecialEmotions_cfnn','-append'); 
[row,col]=size(File.features); 
Categories_nn=CFNN.categories_net(transpose(File.features));
Emotions_nn=CFNN.emotiones_net(transpose(File.features));
Categories_cfnn=[]; Emotions_cfnn=[];
Categories_nn=Categories_nn; Emotions_nn=Emotions_nn;
A=max(Categories_nn);
B=max(Emotions_nn);
for i=1:row
     
    if Categories_nn(1,i)==A(i)
    Categories(i)={'Normal'};
    Categories_cfnn(i,:)=[1,0];
    else
     Categories(i)={'Special'}; 
     Categories_cfnn(i,:)=[0,1];
    end

end
for i=1:row

if Emotions_nn(1,i)==B(i)
    Emotions(i)={'Angry'};
    Emotions_cfnn(i,:)=[1,0,0,0];
end
if Emotions_nn(2,i)==B(i)
Emotions(i)={'Happy'}; 
Emotions_cfnn(i,:)=[0,1,0,0];
end 
if Emotions_nn(3,i)==B(i)
Emotions(i)={'Neutral'};
Emotions_cfnn(i,:)=[0,0,1,0];
end
if Emotions_nn(4,i)==B(i)
   Emotions(i)={'Sad'};  
   Emotions_cfnn(i,:)=[0,0,0,1];
end

end
Result_File=load('test_results.mat');
Categories_cfnn=[Result_File.Categories_cfnn;Categories_cfnn];
save('test_results.mat','Categories_cfnn','-append');

for i=1:row
    Result_File=load('test_results.mat');
if strcmp(Result_File.Categories(i),'Normal')==1
 NormalEmotions_cfnn=[Result_File.NormalEmotions_cfnn;Emotions_cfnn(i,:)];
 save('test_results.mat','NormalEmotions_cfnn','-append');
else
 SpecialEmotions_cfnn=[Result_File.SpecialEmotions_cfnn;Emotions_cfnn(i,:)];
save('test_results.mat','SpecialEmotions_cfnn','-append'); 
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
