CREATE DATABASE esell;

CREATE TABLE esell.CUSTOMER (
cust_id		INT NOT NULL AUTO_INCREMENT, 
fname		VARCHAR(15) NOT NULL,   
lname		VARCHAR(15) NOT NULL, 
email		VARCHAR(30),
address		VARCHAR(50),  
sex		CHAR,
PRIMARY KEY (cust_id)
);

CREATE TABLE esell.POST (
post_id		INT NOT NULL AUTO_INCREMENT,
cust_id		INT NOT NULL,
post_title	VARCHAR(15) NOT NULL,
post_body	VARCHAR(50) NOT NULL,
post_date	DATETIME NOT NULL,
PRIMARY KEY (post_id),
FOREIGN KEY (cust_id) REFERENCES esell.CUSTOMER (cust_id)
);

CREATE TABLE esell.FRIENDSHIP (
cust1_id	INT NOT NULL,
cust2_id	INT NOT NULL,
PRIMARY KEY (cust1_id, cust2_id),
FOREIGN KEY (cust1_id) REFERENCES esell.CUSTOMER (cust_id),
FOREIGN KEY (cust2_id) REFERENCES esell.CUSTOMER (cust_id),
CHECK (cust1_id < cust2_id),
CHECK (cust1_id != cust2_id)
);

CREATE TABLE esell.MERCHANT (
merchant_id	INT NOT NULL AUTO_INCREMENT,
mname		VARCHAR(25) NOT NULL UNIQUE,
PRIMARY KEY (merchant_id)
);

CREATE TABLE esell.PRODUCT (
prod_id		INT NOT NULL AUTO_INCREMENT,
merchant_id	INT NOT NULL,
pname		VARCHAR(35) NOT NULL,
price		DECIMAL(5, 2) NOT NULL,
PRIMARY KEY (prod_id),
FOREIGN KEY (merchant_id) REFERENCES esell.MERCHANT (merchant_id)
);

CREATE TABLE esell.`ORDER` (
order_id	INT NOT NULL AUTO_INCREMENT,
cust_id		INT NOT NULL,
prod_id		INT NOT NULL UNIQUE,
has_shipped	BOOLEAN DEFAULT 0,
order_date	DATETIME NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (cust_id) REFERENCES esell.CUSTOMER (cust_id),
FOREIGN KEY (prod_id) REFERENCES esell.PRODUCT (prod_id)
);

CREATE TABLE esell.ADVERTISEMENT (
ad_id		INT NOT NULL AUTO_INCREMENT,
merchant_id	INT NOT NULL,
prod_id		INT NOT NULL UNIQUE,
fee		DECIMAL(4, 2) DEFAULT 1.50,
PRIMARY KEY (ad_id),
FOREIGN KEY (merchant_id) REFERENCES esell.MERCHANT (merchant_id),
FOREIGN KEY (prod_id) REFERENCES esell.PRODUCT (prod_id) 
);

/* Displays all of the advertisement fees and 10% of the prices for all the sold products. 
A product has been sold if it exists in the order table. */
CREATE VIEW esell.REVENUE AS 
SELECT ROUND(P.price/10, 2) AS profit
FROM esell.PRODUCT AS P
WHERE P.prod_id IN (SELECT O.prod_id FROM esell.`ORDER` AS O)
UNION ALL
SELECT fee
FROM esell.ADVERTISEMENT;