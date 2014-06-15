library(caret)
training<-read.csv('pml-training.csv',header=T)
training<-training[,colSums(is.na(training)) == 0]
i1 <- sapply(training,function(x)is.factor(x)&&length(levels(x))!=5)
training<-training[,!i1]
training<-training[,4:57]
trainInds <- sample(nrow(training), 5000)
train <- training[trainInds,]
modFit<-train(classe~ .,data=train,method="rf",proxy=T)
testing<-read.csv('pml-testing.csv',header=T)
testing<-testing[,colSums(is.na(testing)) == 0]
i1 <- sapply(testing,function(x)is.factor(x)&&length(levels(x))!=5)
testing<-testing[,!i1]
testing<-testing[4:57]
pred<-predict(modFit,testing)
plot(modFit$finalModel,log="y",main="final model plot")
