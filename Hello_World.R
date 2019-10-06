x = data.frame("St_No" = c(1,5,3), "Age" = c(21, 20, 23),
               "Name"=c("Fawaaz", "Dilshani", "Naleef"), stringsAsFactors = FALSE)


print(x)

#see the structure of the data frame
print(str(x))

#add a new row to the existing data frame
x[nrow(x) + 1, ] <- c(4,22, "Lakindu")
print(x)

# change the Age of the 4th person to 21
x[4, "Age"] <- 21

#add a column called gender and specify its values
x$Gender = c("M", "F", "M", "M")
print(x)

#delete the age column
x$Age  <- NULL
print(x)

#to delete an entire row from the data frame
x <- x[-3, ]
print(x)

#to delete a record from a particular row
x[1, "St_No"] <- 0
print(x)

#to add a record from a particular row
x[1, "St_No"] <- 12
print(x)

#restructre the rows (eg: 1 2 3)
rownames(x) = seq(length = nrow(x))
print(x)


