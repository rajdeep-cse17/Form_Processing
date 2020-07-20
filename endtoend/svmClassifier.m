function [performance,svmModel]=svmClassifier(x,t,x2,t2,chromosome)
    if(sum(chromosome(1,:)==1)~=0)
        x2=x2(:,chromosome(:)==1);
        x=x(:,chromosome(:)==1);
        
        s=size(t,1);
        label=zeros(1,s);
        for i=1:s
            label(1,i)=find(t(i,:),1);
        end
         class=zeros(1,max(label));
            for i=1:max(label)
                class(i)=i;
            end
            disp(class);
            temp = templateSVM('Standardize',1,'KernelFunction','linear','Solver','SMO');
            svmModel = fitcecoc(x,label,'Learners',temp,'FitPosterior',1,'ClassNames',class,'Coding','onevsall');
       [label,~] = predict(svmModel,x2);
        s=size(t2,1);
        lab=zeros(s,1);
        for i=1:s
            lab(i,1)=find(t2(i,:),1);           
        end
        c = sum(lab ~= label)/s; % mis-classification rate
        performance=1-c;
        fprintf('Number of features - %d\n',sum(chromosome(1,:)==1));
        fprintf('The correct classification is %f\n',(100*performance));
    else
        performance=0;
    end
end