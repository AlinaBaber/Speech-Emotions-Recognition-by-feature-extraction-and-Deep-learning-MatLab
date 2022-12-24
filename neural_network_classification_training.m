function [Categories_output,Emotions_output]=neural_network_classification_training()
MFile= load('nnmodels');
File= load('speech');
%==================Speech Disorder======================================%
%----(1)----------Frequency--------------
Features=transpose(File.features);
Categories_output=MFile.NNStruct_frequency_categories(Features);
%frequency_errors = gsubtract(targets,frequency_categories_outputs);
%frequency_performance = perform(MFile.NNStruct_frequency_categories,targets,frequency_categories_outputs);
%==================Speech Emotions======================================%
Emotions_output=MFile.NNStruct_frequency_emotions(Features);
%frequency_errors = gsubtract(targets,frequency_emotions_outputs);
%frequency_performance = perform(MFile.NNStruct_frequency_emotions,targets,frequency_emotions_outputs);
%Plots
%figure, plotconfusion(targets,outputs);
%figure, ploterrhist(errors);