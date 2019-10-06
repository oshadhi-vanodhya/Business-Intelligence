library(rattle.data)
#load rattle data
data("wine",package = 'rattle.data')

head(wine)
#structure of data
str(wine)

#remove type in column 
training_set <-wine[-1]
str(training_set)

# kvalue has being set to 3
kc <- kmeans(training_set,3)
print(kc$withinss)

# for loop range from 1 to 15 in i and train i value
# eg wss[2]=sum(kmeans(dataset,centers=2)$withinss)
wss <- 0
for (i in 1:15){
  wss[i] <-
    sum(kmeans(training_set, centers=i)$withinss )
}
print(wss)
#creating the plot diagram
plot(1:15,
     wss,
     type="b", ### "b" for both####)
     xlab="Number of Clusters",
     ylab="Within groups of squares")

kc <- kmeans(training_set,3)
print(kc$withinss)