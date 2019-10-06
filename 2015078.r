library(RMySQL)

mydb <- dbConnect(MySQL(),dbname='hotelchain',
                  user='root', password="", host='localhost');
dbSendQuery(mydb, "
            CREATE TABLE location (
            location_id INT(4) NOT NULL,
            city VARCHAR(50) NOT NULL,
            state VARCHAR(50) NOT NULL,
            region VARCHAR(50) NOT NULL,
            PRIMARY KEY(location_id)
            );")

dbSendQuery(mydb, "
            CREATE TABLE hotel (
            hotel_id INT(4) NOT NULL,
            hotel_name VARCHAR(80) NOT NULL,
            category VARCHAR(50) NOT NULL,
            PRIMARY KEY(hotel_id)
);")

dbSendQuery(mydb, "
            CREATE TABLE feature (
            feature_id INT(4) NOT NULL,
            feature_description VARCHAR(80) NOT NULL,
            PRIMARY KEY(feature_id)
);")

dbSendQuery(mydb, "
            CREATE TABLE time_day (
            timeid_day INT(2) NOT NULL,
            year INT(4) NOT NULL,
            holiday BOOLEAN NOT NULL DEFAULT 0,
            month VARCHAR(10) NOT NULL,
            day INT(2) NOT NULL,
            PRIMARY KEY(timeid_day)
            );")



dbSendQuery(mydb, "
            CREATE TABLE time_month (
            timeid_month INT(2) NOT NULL,
            month VARCHAR(10) NOT NULL,
            year INT(4) NOT NULL,
            PRIMARY KEY(timeid_month)
            );")

dbSendQuery(mydb, "
            CREATE TABLE time_year (
            timeid_year INT(2) NOT NULL,
            year INT(4) NOT NULL,
            PRIMARY KEY(timeid_year)
);")

dbSendQuery(mydb, "
            CREATE TABLE bookings (
            booking_id INT(4) NOT NULL,
            location_id INT(4) NOT NULL,
            PRIMARY KEY(timeid_year)
);")

dbSendQuery(mydb, "INSERT INTO location
(location_id, city, state, region)
    VALUES(0001, 'Rajagiriya', 'Colombo', 'Western'),
    (0002, 'Colombo7', 'Colombo', 'Western'),
    (0003, 'KandY', 'Kandy', 'Central'),
    (0004, 'Kadawatha', 'Gampaha', 'Western'),
    (0005, 'Anuradhapura', 'Anuradhapura', 'North Central');")




dbSendQuery(mydb, "INSERT INTO hotel
(hotel_id, hotel_name, category)
  VALUES(0001, 'Topaz', '4 Stars');")



dbSendQuery(mydb, "INSERT INTO feature
(feature_id, feature_description)
    VALUES(0001, '4 beds'),
    (0002, '5 beds'),
    (0003, 'watertub'),
    (0004, 'TV');")



dbSendQuery(mydb, "INSERT INTO time_day
(timeid_day, year, holiday, month, day)
    VALUES(0001, '2018', 0, 'March', '24'),
    (0002, '2018', 1, 'April', '24'),
    (0003, '2017', 0, 'May', '18'),
    (0004, '2016', 0, 'May', '24'),
    (0005, '2016', 0, 'May', '24');")


dbSendQuery(mydb, "INSERT INTO time_month
(timeid_month, month, year)
    VALUES(0001, 'March', 2018'),
    (0002, 'April', '2018'),
    (0003, 'May', '2017'),
    (0004, 'May', '2016'),
    (0005, 'May', '2016');")



dbSendQuery(mydb, "INSERT INTO time_year
(timeid_year, year)
    VALUES(0001, '2018'),
    (0002, '2018'),
    (0003, '2017'),
    (0004, '2016'),
    (0005, '2016');")


#dbListTables(mydb)
