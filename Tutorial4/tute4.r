library(datasets)
print(head(iris))

str(iris)
x <- iris[,-5]
print(head(x))

y <- iris$Species
y
output <- kmeans(x,3) #kmeans clustering

output$withness
#inspecting cluster
table(y,output$cluster)
#depicting the cluster with 2 variables out of 5 - data that needs to be shown, colour according to data set
plot(x[c("Sepal.Length","Sepal.Width")],col=output$cluster)
