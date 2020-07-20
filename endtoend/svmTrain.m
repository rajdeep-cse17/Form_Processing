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
        if(i>=t1 && i<=t2)                              %  k>=fold*(NOSPC/FN) && k<(NOSPC/FN)*(fold+1)
            testData(tec,:)=allFeature(i,:);
            testLabel(tec,:)=target(i,:);
            tec=tec+1;
        else
            trainData(trc,:)=allFeature(i,:);
            trainLabel(trc,:)=target(i,:);
            trc=trc+1;
        end
    end
    chromosome=ones(1,size(trainData,2));
    [performance,svmModel]=svmClassifier(trainData,trainLabel,testData,testLabel,chromosome);
    fprintf('Recognition Performance in %d fold=%f\n',fold,100*performance);
    if(performance>per)
        per=performance;
        save svmModel svmModel;
    end
end