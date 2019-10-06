df = data.frame("St_no" = c(1,2,3),
                "Name" = c("Karthik", "Chano", "Chamal"),
                
                "Age" = c(23,20,23))
df
str(df)
nrow(df)
 ncol(df)
 df["Name"]
 df[1, "Age"]
 df[2,"Age"] <- 18