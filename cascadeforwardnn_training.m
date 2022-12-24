function Status=cascadeforwardnn_training()
File= load('speech');
categories_net=cascadeforwardnn(transpose(File.features), transpose(File.categories_nn));
emotiones_net=cascadeforwardnn(transpose(File.features), transpose(File.emotions_nn));

save('cascadeforwardnn.mat','categories_net','-append');
save('cascadeforwardnn.mat','emotiones_net','-append');
Status='Cascade Forward Neural Networks has been Trained';