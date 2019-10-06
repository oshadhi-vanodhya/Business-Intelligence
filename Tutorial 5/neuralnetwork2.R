
concrete <- read.csv("concrete.csv")
str(concrete)

#to see summary data to preprocess mean edian ets
summary(concrete)

normalize <- function(X) {
  return((X - min(X))) / (max(x) - min(X))) #zero - one scaling

}

#save preprocess data and apply mormalized data to function6 to improv process
concrete_name <- as.data.frame(lapply(concrete, normalize))

summary(concrete_name)

#divide data to train and testing data

concrete_train <- concrete_name[1:773, ]
concrete_test <- concrete_name[774:1030, ]

library(neuralnet)

set.seed(12345)

concrete_model <- neuralnet(strength ~ cement + slag + ash + water
                            + superplastic + coarseagg + fineagg + age, data = concrete_train)

plot(concrete_model)

