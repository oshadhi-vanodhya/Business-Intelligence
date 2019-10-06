library(datasets)
head(iris) # we r going to work on iris dataset for clustering
str(iris)
x <- iris [,-5]
str(x)
output <- kmeans(x,3)
print(output)

# between_ss
