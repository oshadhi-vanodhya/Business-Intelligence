df = data.frame("St_no" = c(1,2,3),
                "Name" = c("Karthik", "Chano", "Chamal"),
                
                "Age" = c(23,20,23),stringsAsFactors =FALSE)
print(df)
df[nrow(df)+1,] <- c(4,"Niluka",23)
print(df)