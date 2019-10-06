df = data.frame("St_no" = c(1,2,3),
                "Name" = c("Karthik", "Chano", "Chamal"),
                
                "Age" = c(23,20,23),stringsAsFactors =FALSE)
print(df)
df[nrow(df)+1,] <- c(4,"Niluka",23) #inserting a record
print(df)
df[nrow(df)+1,] <- c(5,"Oshadhi",22)
print(df)
df[5,"Age"] <- 22
df$Gender<-c("M","F","M","M","F") #inserting a column
df$Weight <-c(70,53,31,66,74)
df$Gender <- NULL #deleting a column
df <- df[-3,] #deleteing a row
df[4,""]
rownames(df) = seq(length = nrow(df))
df <- df[-4,] #deleteing a row
print(df)
