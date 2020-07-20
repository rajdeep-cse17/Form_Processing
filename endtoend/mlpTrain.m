
clear all
allFeature=csvread('hwprclassification.csv');
allFeature=suffleRows(allFeature);
target1=allFeature(:, 20:20);
allFeature=allFeature(:, 1:19);

numberOfFold=3;
numberOfClass=2;

target=zeros(size(target1,1),numberOfClass);
for i=1:size(target1,1)
    target(i, target1(i))=1;
end
numberOfFeature=size(allFeature,2);
disp(numberOfFeature);
numberOfData=size(allFeature,1);
disp(numberOfData);
trainRow=ceil(2*size(allFeature,1)/numberOfFold);
testRow=numberOfData-trainRow;
per=0;

for hddnlayer=5:5:25   % Start:step:end
    for fold=1:numberOfFold
        trainData=zeros(trainRow,numberOfFeature);
        testData=zeros(testRow,numberOfFeature);
        trainLabel=zeros(trainRow,numberOfClass);
        testLabel=zeros(testRow,numberOfClass);
        tec=1;
        trc=1;
        for i=1:numberOfData
            t1=(fold-1)*testRow+1;
            t2=fold*testRow;
            if(i>t1 && i<=t2)                              %  k>=fold*(NOSPC/FN) && k<(NOSPC/FN)*(fold+1)
                testData(tec,:)=allFeature(i,:);
                testLabel(tec,:)=target(i,:);
                tec=tec+1;
            else
                trainData(trc,:)=allFeature(i,:);
                trainLabel(trc,:)=target(i,:);
                trc=trc+1;
            end
        end
        hiddenLayerSize = [hddnlayer];  %determins the umber of layers and neurons in hidden layers
        net = patternnet(hiddenLayerSize);
        inputs = trainData';
        targets = trainLabel';
        countt=0;
        while (countt<=0)
        % Setup Division of Data for Training, Validation, Testing
        net.divideParam.trainRatio = 85/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 0/100;
        net.trainParam.epochs=1000;
        % Train the Network
        [net, ] = train(net,inputs,targets);
        % Test the Network
        input = testData';
        targetIn =testLabel';
        outputs = net(input);
        [c, ] = confusion(targetIn,outputs);
        performance=100*(1-c);
        fprintf('Hidden Layer Number=%d Fold Number=%d  Accuracy=%f\n',hddnlayer,fold,performance);
        if(performance>per)
            per=performance;
            save net net;
            fprintf('Net saved for fold %d at hidden layer %d, count=%d with performance %f\n',fold, hddnlayer,countt, per);
        end
        countt=countt+1;
        end
        % fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
    end
    disp(c);
end