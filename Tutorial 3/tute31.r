library(datasets)
head(iris)
str(iris)
#remove clustering name
x <-iris[,-5]
str(x)
output <-kmeans(x,3)
print(output)

