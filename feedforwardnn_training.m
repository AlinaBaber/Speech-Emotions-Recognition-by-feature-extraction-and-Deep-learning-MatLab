function Status=feedforwardnn_training()
File= load('speech');
categories_net=feedforwardnn(transpose(File.features), transpose(File.categories_nn));
emotiones_net=feedforwardnn(transpose(File.features), transpose(File.emotions_nn));

save('feedforwardnn.mat','categories_net','-append');
save('feedforwardnn.mat','emotiones_net','-append');
Status='Feed Forward Neural Networks has been Trained';