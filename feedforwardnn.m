function net=feedforwardnn(xTrainImages, tTrain)
x=xTrainImages;
t=tTrain;
net = feedforwardnet(10);
net = train(net,x,t);
view(net)
%y = net(x);
%perf = perform(net,y,t);
%plotconfusion(t,y);