library("neuralnet")

#generate square value of

traininginput <- as.data.frame(runif(50, min=0, max=100))
#train neural network to predict

trainingoutput <- sqrt(traininginput)

#cbd for combining columns

trainingdata <- cbind(traininginput, trainingoutput)
colnames(trainingdata) <- c("Input", "Output")

#1 hidden layer with 10 hidden nodes
nn <- neuralnet(Output~Input,trainingdata, hidden = 10)
plot(nn)

testdata <- as.data.frame((1:10)^2)
print(testdata)

net.results <- compute(nn, testdata)
ls(net.results)
print(net.results$net.result)

cleanoutput <- cbind(testdata, sqrt(testdata),
                     as.data.frame(net.results$net.result))
colnames(cleanoutput) <- C("Input", "Expected Output", "Neural Net Output")
print(cleanoutput)
