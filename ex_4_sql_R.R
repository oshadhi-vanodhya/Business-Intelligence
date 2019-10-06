library(RMySQL)

mydb <- dbConnect(MySQL(), dbname = 'datamart', user = 'root', 
                 password = '', host = '127.0.0.1')


#to check if R has connected to database
#test = fetch(dbSendQuery(mydb, "SELECT * FROM timedim;"))
#head(test)

test = fetch(dbSendQuery(mydb, "SELECT * FROM facts;"))
head(test)

dbSendQuery(mydb, "CREATE TABLE customer(
            cus_id INT,
            fname VARCHAR(50),
            lname VARCHAR(50));")

dbListTables(mydb)

dbSendQuery(mydb, "INSERT INTO customer(
            cus_id, fname, lname)
                VALUES(1,'Sachintha', 'Pitigala');")