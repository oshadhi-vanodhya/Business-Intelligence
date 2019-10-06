library(RMySQL)

mydb <- dbConnect(MySQL() ,dbname = 'data_mart',
                  user = 'root', password = 'lakshi1996', host = '127.0.0.1');
                 
dbSendQuery(mydb,"
CREATE TABLE customer (
            cus_id INT,
            fname VARCHAR (50),
            lname VARCHAR (50));")

dbListTables(mydb)

dbSendQuery (mydb, "Insert INTO customer 
(cus_id,fname,lname) 
             VALUES (1, 'Lakshika', 'Siva');"
                    )
fact_info=fetch (dbSendQuery(mydb, "SELECT* FROM Facts;"))                  
head(fact_info) # head command will show onl y the first 6 rows of the table
