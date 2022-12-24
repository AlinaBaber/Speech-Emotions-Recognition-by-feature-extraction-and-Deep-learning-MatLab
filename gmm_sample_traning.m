function Status = gmm_sample_traning()
file=load ('speech');
frquency = file.frequency;
time = transpose (1/frquency);
X=[frquency,time];
%Fit a Gaussian mixture model to the data using default initial values. There are three iris species, so specify k = 3 components.
rng(4); % For reproducibility
GMModel1 = fitgmdist(X,2);
%Fit a Gaussian mixture model by connecting each observation to its label.

y = ones(size(X,1),1);
y(strcmp(file.categories,'Normal')) = 1;
y(strcmp(file.categories,'Special')) = 2;
%y(strcmp(file.emotions,'Neutral')) = 3;
%y(strcmp(file.emotions,'Sad')) = 4;
rng(1); % For reproducibility
GMModel2 = fitgmdist(X,2,'Start',file.categories_nn);
%Fit a Gaussian mixture model by explicitly specifying the initial means, covariance matrices, and mixing proportions.

Mu = [1 1; 2 2];
Sigma(:,:,1) = [1 1; 1 2];
Sigma(:,:,2) = 2*[1 1; 1 2];
PComponents = [1/2,1/4];

S = struct('mu',Mu,'Sigma',Sigma,'ComponentProportion',PComponents);
rng(1); % For reproducibility
GMModel3 = fitgmdist(X,2,'Start',S);
%Use gscatter to plot a scatter diagram that distinguishes between the iris species. For each model, plot the fitted Gaussian mixture model contours.
time=1/X;
figure
subplot(2,2,1)
h = gscatter(X,time,file.categories,[],'o',2);
haxis = gca;
xlim = haxis.XLim;
ylim = haxis.YLim;
d = (max([xlim ylim])-min([xlim ylim]))/1000;
[X1Grid,X2Grid] = meshgrid(xlim(1):d:xlim(2),ylim(1):d:ylim(2));
hold on
contour(X1Grid,X2Grid,reshape(pdf(GMModel1,[X1Grid(:) X2Grid(:)]),...
    size(X1Grid,1),size(X1Grid,2)),20)
uistack(h,'top')
title('{\bf Random Initial Values}');
xlabel('Sepal length');
ylabel('Sepal width');
legend off;
hold off
subplot(2,2,2)
h = gscatter(X,time,file.emotions,[],'o',2);
hold on
contour(X1Grid,X2Grid,reshape(pdf(GMModel2,[X1Grid(:) X2Grid(:)]),...
    size(X1Grid,1),size(X1Grid,2)),20)
uistack(h,'top')
title('{\bf Initial Values from Labels}');
xlabel('Sepal length');
ylabel('Sepal width');
legend off
hold off
subplot(2,2,3)
h = gscatter(X,time,file.emotions,[],'o',4);
hold on
contour(X1Grid,X2Grid,reshape(pdf(GMModel3,[X1Grid(:) X2Grid(:)]),...
    size(X1Grid,1),size(X1Grid,2)),20)
uistack(h,'top')
title('{\bf Initial Values from the Structure}');
xlabel('Sepal length');
ylabel('Sepal width');
legend('Location',[0.7,0.25,0.1,0.1]);
hold off
Status='GMM Model Has been Trained';