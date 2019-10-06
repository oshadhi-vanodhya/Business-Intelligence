library(RMySQL)

mydb <- dbConnect(MySQL(),dbname='datamart',
                  user='root', password="", host='localhost');
dbListTables(mydb)
dbSendQuery(mydb, "
            CREATE TABLE customer (
            cus_id INT,
            fname VARCHAR(50),
            lname VARCHAR(50));")

dbListTables(mydb)

dbSendQuery(mydb, "INSERT INTO customer
(cus_id, fname, lname)
  VALUES(1, 'Sachintha', 'Pitigala');")

fact_info=fetch (dbSendQuery(mydb, "SELECT * FROM facts;"))
head(fact_info)

