 function net=cascadeforwardnn(xTrainImages, tTrain)
x=xTrainImages;
t=tTrain;
net = cascadeforwardnet(10);
net = train(net,x,t);
view(net)
%y = net(x);
%perf = perform(net,y,t);
%plotconfusion(t,y);