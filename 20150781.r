library(RMySQL)

mydb <- dbConnect(MySQL(),dbname='hotelchain',
                  user='root', password="", host='localhost');

#Creting table for location
dbSendQuery(mydb, "
            CREATE TABLE location (
            location_id VARCHAR(5) NOT NULL,
            city VARCHAR(50) NOT NULL,
            state VARCHAR(50) NOT NULL,
            region VARCHAR(50) NOT NULL,
            PRIMARY KEY(location_id)
            );")

#Inserting records to location

dbSendQuery(mydb, "INSERT INTO location
(location_id, city, state, region)
            VALUES('RAJ11',	'Rajagiriya',	'Colombo',	'Western'),
            ('RAJ12',	'Welikada',	'Colombo',	'Western'),
            ('COL12',	'Colombo7',	'Colombo',	'Western'),
            ('KOT14',	'Kotte',	'Colombo',	'Western'),
            ('DEH15',	'Dehiwala',	'Colombo',	'Western'),
            ('JAW16',	'Jaela',	'Gampaha',	'Western'),
            ('KAD14',	'Kadawatha',	'Gampaha',	'Western'),
            ('KAD17',	'Kaduwela',	'Gampaha',	'Western'),
            ('KAN13',	'Kandy',	'Kandy',	'Central'),
            ('ANU15',	'Anuradhapura',	'Anuradhapura',	'North Central')
            ;")

#Creating table for hotel

dbSendQuery(mydb, "
            CREATE TABLE hotel (
            hotel_id VARCHAR(4) NOT NULL,
            hotel_name VARCHAR(20) NOT NULL,
            category VARCHAR(10) NOT NULL,
            PRIMARY KEY(hotel_id)
            );")

#Inserting records to hotel
dbSendQuery(mydb, "INSERT INTO hotel
(hotel_id, hotel_name, category)
            VALUES('RAJ1',	'Topaz',	'4 Stars'),
            ('RAJ2',	'Senora',	'4 Stars'),
            ('RAJ3',	'LemonGrass',	'5 Stars'),
            ('RAJ4',	'Siyenra',	'3 Stars'),
            ('RAJ5',	'Gornea',	'4 Stars'),
            ('COL1',	'Cinamon Red',	'5 Stars'),
            ('COL2',	'Java Lounge',	'4 Stars'),
            ('COL3',	'Cinamon Citadel',	'3 Stars'),
            ('COL5',	'Cinamon Anurapurs',	'4 Stars'),
            ('COL6',	'Cinamon Blue',	'4 Stars'),
            ('KAD4',	'Cinamon Kadawatha',	'4 Stars'),
            ('JAW6',	'cinew',	'4 Stars');")


#Create table for feature
dbSendQuery(mydb, "
            CREATE TABLE feature (
            feature_id INT(2) NOT NULL,
            feature_description VARCHAR(80) NOT NULL,
            PRIMARY KEY(feature_id)
            );")

#Inserting records to feature
dbSendQuery(mydb, "INSERT INTO feature
            (feature_id, feature_description)
            VALUES(1,	'1 Bed, TV'),
            (2,	'2 beds, TV'),
            (3,	'3 Beds, TV, Fridge'),
            (4,	'4 beds, TV, Fridge, Watertub');")

#Creating table to time
dbSendQuery(mydb, "
            CREATE TABLE time (
            time_id INT(8) NOT NULL,
            year INT(4) NOT NULL,
            month VARCHAR(10) NOT NULL,
            day INT(2) NOT NULL,
            holiday BOOLEAN NOT NULL DEFAULT 0,
            PRIMARY KEY(time_id)
            );")
#Inserting records to time
dbSendQuery(mydb, "INSERT INTO time
            (time_id, year, month, day, holiday)
            VALUES( 20170525,	 2017,	 'May',	 25,	0),
            ( 20170526,	 2017,	 'May',	 26,	0),
            ( 20170527,	 2017,	 'May',	 27,	1),
            ( 20170625,	 2017,	 'Jun',	 25,	0),
            ( 20170626,	 2017,	 'Jun',	 26,	0),
            ( 20170627,	 2017,	 'Jun',	 27,	1),
            ( 20050525,	 2005,	 'May',	 25,	0),
            ( 20050526,	 2005,	 'May',	 26,	0),
            ( 20050527,	 2005,	 'May',	 27,	1),
            ( 20050625,	 2005,	 'Jun',	 25,	0),
            ( 20050626,	 2005,	 'Jun',	 26,	0),
            ( 20050627,	 2005,	 'Jun',	 27,	1);")

#Creating bookings facts table
dbSendQuery(mydb, "
            CREATE TABLE bookings (
            hotel_id VARCHAR(4) NOT NULL,
            location_id VARCHAR(5) NOT NULL,
            time_id INT(8) NOT NULL,
            room_no VARCHAR(8) NOT NULL,
            status VARCHAR(15) NOT NULL,
            expected_income DOUBLE NOT NULL,
            PRIMARY KEY(hotel_id, location_id, time_id, room_no),
            FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id),
            FOREIGN KEY(location_id) REFERENCES location(location_id),
            FOREIGN KEY(time_id) REFERENCES time(time_id)
            );")

#Inserting records to bookings
dbSendQuery(mydb, "INSERT INTO bookings
            (hotel_id, location_id, time_id, room_no, status, expected_income)
            VALUES('RAJ1',	'RAJ11',	20170525,	'R100',	'Reserved',	10000.00),
            ('RAJ1',	'RAJ11',	20170525,	'R101',	'Not Available',	10000.00),
            ('RAJ1',	'RAJ11',	20170526,	'R100',	'Free',	10000.00),
            ('RAJ2',	'RAJ12',	20170526,	'R200',	'Free',	50000.00),
            ('RAJ2',	'RAJ12',	20170525,	'R200',	'Not Available',	50000.00),
            ('RAJ2',	'RAJ12',	20170526,	'R201',	'Free',	50000.00),
            ('RAJ2',	'RAJ12',	20170526,	'R202',	'Not Available',	50000.00),
            ('RAJ2',	'RAJ12',	20170527,	'R203',	'Not Available',	50000.00),
            ('RAJ2',	'RAJ12',	20170527,	'R204',	'Not Available',	50000.00),
            ('COL1',	'COL12',	20170627,	'R301',	'Not Available',	60000.00),
            ('COL1',	'COL12',	20170627,	'R303',	'Not Available',	60000.00),
            ('COL1',	'COL12',	20170627,	'R304',	'Reserved',	60000.00),
            ('COL2',	'DEH15',	20170627,	'R400',	'Reserved',	10000.00),
            ('COL2',	'DEH15',	20170627,	'R401',	'Reserved',	10000.00),
            ('COL2',	'DEH15',	20170627,	'R500',	'Free',	100000.00),
            ('COL2',	'DEH15',	20170627,	'R501',	'Not Available',	100000.00),
            ('COL2',	'DEH15',	20170627,	'R502',	'Not Available',	100000.00),
            ('KAD4',	'KAD14',	20170525,	'R600',	'Reserved',	210000.00),
            ('KAD4',	'KAD14',	20170525,	'R601',	'Not Available',	210000.00),
            ('KAD4',	'KAD14',	20170525,	'R602',	'Not Available',	210000.00),
            ('JAW6',	'JAW16',	20170526,	'R700',	'Reserved',	115000.00),
            ('JAW6',	'JAW16',	20170526,	'R701',	'Not Available',	115000.00),
            ('JAW6',	'JAW16',	20170526,	'R702',	'Free',	115000.00),
            ('JAW6',	'JAW16',	20170526,	'R703',	'Not Available',	115000.00),
            ('JAW6',	'JAW16',	20170527,	'R702',	'Not available',	115000.00),
            ('JAW6',	'JAW16',	20170527,	'R705',	'Not Available',	115000.00),
            ('JAW6',	'JAW16',	20170627,	'R704',	'Not Available',	115000.00),
            ('KAD4',	'KAD14',	20170625,	'R600',	'Reserved',	210000.00),
            ('KAD4',	'KAD14',	20170625,	'R601',	'Not Available',	210000.00),
            ('KAD4',	'KAD14',	20170625,	'R602',	'Free',	210000.00),
            ('JAW6',	'JAW16',	20170626,	'R700',	'Not Available',	115000.00),
            ('JAW6',	'JAW16',	20170626,	'R701',	'Not Available',	115000.00),
            ('JAW6',	'JAW16',	20170626,	'R702',	'Free',	115000.00)
            ;")

#Create table for chekout fact table
dbSendQuery(mydb, "
            CREATE TABLE checkout (
            hotel_id VARCHAR(4) NOT NULL,
            location_id VARCHAR(5) NOT NULL,
            time_id INT(8) NOT NULL,
            feature_id INT(2) NOT NULL,
            room_no VARCHAR(8) NOT NULL,
            income DOUBLE NOT NULL,
            PRIMARY KEY(hotel_id, location_id, time_id, feature_id, room_no),
            FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id),
            FOREIGN KEY(location_id) REFERENCES location(location_id),
            FOREIGN KEY(time_id) REFERENCES time(time_id),
            FOREIGN KEY(feature_id) REFERENCES feature(feature_id)
            );")


#Insert records to checkout
dbSendQuery(mydb, "INSERT INTO checkout
            (hotel_id, location_id, time_id, feature_id, room_no, income)
            VALUES('RAJ1',	'RAJ11',	20050525,	1,	'R100',	40000),
('RAJ1',	'RAJ11',	20050526,	2,	'R102',	60000),
            ('RAJ1',	'RAJ11',	20050527,	1,	'R100',	40000.00),
            ('RAJ1',	'RAJ11',	20050526,	2,	'R101',	60000.00),
            ('RAJ1',	'RAJ11',	20050625,	1,	'R100',	40000.00),
            ('RAJ1',	'RAJ11',	20050626,	3,	'R102',	90000.00),
            ('RAJ1',	'RAJ11',	20050627,	1,	'R100',	80000.00),
            ('RAJ1',	'RAJ11',	20050626,	2,	'R102',	60000.00),
            ('RAJ2',	'RAJ12',	20050525,	1,	'R200',	40000.00),
            ('RAJ2',	'RAJ12',	20050526,	2,	'R201',	60000.00),
            ('RAJ2',	'RAJ12',	20050525,	2,	'R202',	40000.00),
            ('RAJ2',	'RAJ12',	20050526,	3,	'R203',	60000.00),
            ('RAJ2',	'RAJ12',	20050625,	1,	'R205',	40000.00),
            ('COL1',	'COL12',	20050626,	3,	'R309',	100000.00),
            ('COL1',	'COL12',	20050625,	3,	'R309',	100000.00),
            ('COL1',	'COL12',	20050626,	2,	'R310',	60000.00),
            ('KAD4',	'KAD14',	20050525,	1,	'R600',	40000.00),
            ('KAD4',	'KAD14',	20050526,	2,	'R601',	60000.00),
            ('KAD4',	'KAD14',	20050525,	1,	'R602',	40000.00),
            ('KAD4',	'KAD14',	20050526,	2,	'R603',	90000.00),
            ('KAD4',	'KAD14',	20050625,	1,	'R604',	80000.00),
            ('KAD4',	'KAD14',	20050626,	3,	'R605',	60000.00),
            ('KAD4',	'KAD14',	20050625,	3,	'R606',	60000.00),
            ('KAD4',	'KAD14',	20050626,	2,	'R701',	60000.00),
            ('JAW6',	'JAW16',	20050525,	1,	'R702',	40000.00),
            ('JAW6',	'JAW16',	20050526,	2,	'R703',	100000.00),
            ('JAW6',	'JAW16',	20050525,	1,	'R704',	65000.00),
            ('JAW6',	'JAW16',	20050526,	2,	'R705',	65000.00),
            ('JAW6',	'JAW16',	20050625,	1,	'R706',	65000.00)
            ;")

dbListTables(mydb)

#calculating the portion of reserved rooms, free rooms and unavailable rooms

percentage = fetch(dbSendQuery(mydb, "SELECT t.year AS YEAR, t.month AS MONTH, l.state AS STATE,

      (COUNT(CASE WHEN b.status='Free' THEN 1 END)/COUNT(CASE WHEN b.status='Free' OR 
                b.status = 'Not Available' or 
                b.status = 'Reserved' THEN 1 END)*100) 
      AS 'PERCENTAGE OF FREE ROOMS', 


      (COUNT(CASE WHEN b.status='Reserved' THEN 1 END)/COUNT(CASE WHEN b.status='Free' OR 
                b.status = 'Not Available' or 
                b.status = 'Reserved' THEN 1 END)*100) 
      AS 'PERCENTAGE OF RESERVED ROOMS',

      (COUNT(CASE WHEN b.status='Not Available' THEN 1 END)/COUNT(CASE WHEN b.status='Free' OR 
                b.status = 'Not Available' or 
                               b.status = 'Reserved' THEN 1 END)*100) 
                               AS 'PERCENTAGE OF UNAVAILABLE ROOMS'  FROM bookings b, time t, location l

                WHERE b.time_id = t.time_id AND b.location_id = l.location_id AND 
      t.year= 2017 GROUP BY MONTH, STATE;"))


head(percentage)
rm(income)

#analyzing the income of 4-star hotels for the given criteria in question

income = fetch(dbSendQuery(mydb, "SELECT time.year AS YEAR,
                          time.month AS MONTH,                            
                          location.state AS STATE, 
                          SUM(checkout.income) AS 'INCOME OF 4 STAR HOTELS'
                          FROM hotel, time, location, checkout
                          WHERE time.year = 2005 AND hotel.category = '4 Stars' AND 
                          time.time_id=checkout.time_id AND 
                          hotel.hotel_id=checkout.hotel_id AND 
                          location.location_id=checkout.location_id 
                          GROUP BY MONTH, STATE ORDER BY YEAR;"))
head(income)

#Calculating the total cumulative income year of all 4 Star Hotels for the given criteria in question

#1st method - without adding a column retreiving the final cumulative income

TotalCumulativeincome_4StarHotels <- sum(income$INCOME)
print(TotalCumulativeincome_4StarHotels)


#second method -  by adding a column

Cumulativeincome_4StarHotels <- cumsum(income$INCOME)
income[, "CUMULATIVE INCOME OF 4 STAR HOTELS"] <- Cumulativeincome_4StarHotels <- cumsum(income$INCOME)
head(income)

#Clearing data
rm(Cumulativeincome_4StarHotels)
rm(TotalCumulativeincome_4StarHotels)



