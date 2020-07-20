function [performance,knnModel]=knnClassifier(x,t,x2,t2,chromosome)
        x2=x2(:,chromosome(:)==1);
        x=x(:,chromosome(:)==1);
        
        s=size(t,1);
        label=zeros(1,s);
        for i=1:s
            label(1,i)=find(t(i,:),1);
        end

        knnModel=fitcknn(x,label,'NumNeighbors',10,'Standardize',1);
        [label,score] = predict(knnModel,x2);
        %label
        save label label;
        save score score;
        s=size(t2,1);
        lab=zeros(s,1);
        for i=1:s
            lab(i,1)=find(t2(i,:),1);
            if(lab(i,1)~=label(i,1))
            end
        end
        c = sum(lab ~= label)/s; % mis-classification rate
         performance=1-c;
        fprintf('Number of features - %d\n',sum(chromosome(1,:)==1));
        fprintf('The correct classification is %f\n',(100*performance));
end