library(datasets)
library(NbClust)

x <- iris[,-5]
y <- iris$Species

output = NbClust(x,distance = "euclidean",
                 min.nc = 2,max.nc = 10,
                 method = "kmeans",index = "all")

#ni.nc How the grouping will
