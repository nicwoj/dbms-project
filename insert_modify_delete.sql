INSERT INTO esell.CUSTOMER VALUES (1, 'John', 'Doe', 'jdoe45@gmail.com', '98 Main Street, New York, NY', 'M');
INSERT INTO esell.CUSTOMER VALUES (2, 'Barbara', 'Johnson', 'barb.johnson@gmail.com', '4122 Oak St, New York, NY', 'F');
INSERT INTO esell.CUSTOMER VALUES (3, 'Susan', 'Baker', 'sue22@gmail.com', '7 Summer Lane, New York, NY', 'F');
INSERT INTO esell.CUSTOMER VALUES (4, 'Alexander', 'Soloman', 'a.soloman95@gmail.com', '199 Second Avenue, New York, NY', 'M');
INSERT INTO esell.CUSTOMER VALUES (5, 'Debbie', 'James', 'dj76@gmail.com', '489 Cornell Road, New York, NY', 'F');
INSERT INTO esell.CUSTOMER VALUES (6, 'William', 'Smith', 'wsmith@gmail.com', '126 Winding Road, New York, NY', 'M');
INSERT INTO esell.CUSTOMER VALUES (7, 'Ben', 'Thompson', 'bt25@gmail.com', '9 Front Street, New York, NY', 'M');

INSERT INTO esell.POST VALUES (1, 1, 'Hello Everyone', 'Check out my new photo!', '2021-03-01 03:10:22');
INSERT INTO esell.POST VALUES (2, 4, 'Summer BBQ', 'I had a great time at the BBQ this weekend.', '2021-03-21 08:19:45');
INSERT INTO esell.POST VALUES (3, 2, 'New Post', 'Visited family yesterday.', '2021-03-22 09:01:03');
INSERT INTO esell.POST VALUES (4, 2, 'Party Tomorrow', 'Hope everyone can make it!', '2021-03-23 11:02:55');
INSERT INTO esell.POST VALUES (5, 5, 'Happy Birthday!', 'Happy Birthday Margaret!', '2021-03-25 01:02:25');
INSERT INTO esell.POST VALUES (6, 6, 'Soccer Practice', 'Practice at noon tomorrow', '2021-03-26 07:34:00');

INSERT INTO esell.FRIENDSHIP VALUES (1, 2); 	/* John, Barbara */
INSERT INTO esell.FRIENDSHIP VALUES (1, 3);	/* John, Susan */
INSERT INTO esell.FRIENDSHIP VALUES (1, 5);	/* John, Debbie */
INSERT INTO esell.FRIENDSHIP VALUES (1, 4);	/* John, Alexander */
INSERT INTO esell.FRIENDSHIP VALUES (2, 3);	/* Barbara, Susan */
INSERT INTO esell.FRIENDSHIP VALUES (2, 4);	/* Barbara, Alexander */
INSERT INTO esell.FRIENDSHIP VALUES (3, 5);	/* Susan, Debbie */
INSERT INTO esell.FRIENDSHIP VALUES (4, 5);	/* Alexander, Debbie */
INSERT INTO esell.FRIENDSHIP VALUES (5, 6);	/* Debbie, W */

INSERT INTO esell.MERCHANT VALUES (1, 'Cool Things Shop');
INSERT INTO esell.MERCHANT VALUES (2, 'Stacys Stuff');
INSERT INTO esell.MERCHANT VALUES (3, 'T Sports');
INSERT INTO esell.MERCHANT VALUES (4, 'Dans Apparel');
INSERT INTO esell.MERCHANT VALUES (5, 'Crafts Boutique');
INSERT INTO esell.MERCHANT VALUES (6, 'Joes Tech');
INSERT INTO esell.MERCHANT VALUES (7, 'Bettys Books');

INSERT INTO esell.PRODUCT VALUES (1, 2, 'Blue TShirt', '10.99');
INSERT INTO esell.PRODUCT VALUES (2, 1, 'Used Bike', '59.99');
INSERT INTO esell.PRODUCT VALUES (3, 5, 'Small Painting', '20.00');
INSERT INTO esell.PRODUCT VALUES (4, 2, 'Ripped Jeans', '15.99');
INSERT INTO esell.PRODUCT VALUES (5, 3, 'Used Soccer Cleats Size 8', '18.99');
INSERT INTO esell.PRODUCT VALUES (6, 4, 'Green Pants', '9.99');
INSERT INTO esell.PRODUCT VALUES (7, 2, 'Algebra Textbook', '19.99');
INSERT INTO esell.PRODUCT VALUES (8, 6, 'Used Cell Phone', '27.00');
INSERT INTO esell.PRODUCT VALUES (9, 6, 'Used Laptop', '50.00');
INSERT INTO esell.PRODUCT VALUES (10, 6, 'Used Wireless Keyboard', '10.00');

INSERT INTO esell.`ORDER` VALUES (1, 1, 2, 0, '2021-03-22 01:02:25');
INSERT INTO esell.`ORDER` VALUES (2, 4, 1, 0, '2021-03-26 09:02:35');
INSERT INTO esell.`ORDER` VALUES (3, 4, 5, 0, '2021-03-28 07:21:10');
INSERT INTO esell.`ORDER` VALUES (4, 2, 4, 1, '2021-04-01 12:03:25');
INSERT INTO esell.`ORDER` VALUES (5, 5, 3, 0, '2021-04-03 11:06:43');
INSERT INTO esell.`ORDER` VALUES (6, 4, 7, 0, '2021-04-04 10:30:00');

INSERT INTO esell.ADVERTISEMENT (ad_id, merchant_id, prod_id) VALUES (1, 1, 2); /* Cool Things Shop, Used Bike */
INSERT INTO esell.ADVERTISEMENT (ad_id, merchant_id, prod_id) VALUES (2, 2, 1); /* Stacys Stuff, Blue TShirt */
INSERT INTO esell.ADVERTISEMENT (ad_id, merchant_id, prod_id) VALUES (3, 2, 4); /* Stacys Stuff, Ripped Jeans */
INSERT INTO esell.ADVERTISEMENT (ad_id, merchant_id, prod_id) VALUES (4, 2, 7); /* Stacys Stuff, Algebra Textbook */
INSERT INTO esell.ADVERTISEMENT (ad_id, merchant_id, prod_id) VALUES (5, 4, 6); /* Dans Apparel, Green Pants */
INSERT INTO esell.ADVERTISEMENT (ad_id, merchant_id, prod_id) VALUES (6, 6, 8); /* Joes Tech, Used Cell Phone */
INSERT INTO esell.ADVERTISEMENT (ad_id, merchant_id, prod_id) VALUES (7, 3, 5); /* T Sports, Used Soccer Cleats Size 8 */

/* Change the email of the customer with a cust_id of 6 to william.smith@gmail.com */
UPDATE esell.CUSTOMER
SET email = 'william.smith@gmail.com'
WHERE cust_id = 6;

/* Delete the customer with a cust_id of 7 */
DELETE FROM esell.CUSTOMER
WHERE cust_id = 7;

/* Change the post_title and post_body of the post with a post_id of 6 */
UPDATE esell.POST
SET post_title = 'Cancellation', post_body = 'Soccer practice has been cancelled.'
WHERE post_id = 6;

/* Delete the post with a post_id of 6 */
DELETE FROM esell.POST
WHERE post_id = 6;

/* Delete the friendship between customers 5 and 6 */
DELETE FROM esell.FRIENDSHIP
WHERE (cust1_id, cust2_id) = (5, 6);

/* Change the name of the merchant with a merchant_id of 3 */
UPDATE esell.MERCHANT
SET mname = 'T Sportswear'
WHERE merchant_id = 3;

/* Delete the merchant with a merchant_id of 7 */
DELETE FROM esell.MERCHANT
WHERE merchant_id = 7;

/* Decrease the price of the product with a prod_id of 3 by 20% */
UPDATE esell.PRODUCT
SET price = price / 1.25
WHERE prod_id = 3;

/* Delete the product with a prod_id of 10 */
DELETE FROM esell.PRODUCT
WHERE prod_id = 10;

/* Set the order with an order_id of 5 to true, indicating that it has been shipped */
UPDATE esell.`ORDER`
SET has_shipped = 1
WHERE order_id = 5;

/* Delete the order with an order_id of 6 */
DELETE FROM esell.`ORDER`
WHERE order_id = 6;

/* Change the advertisement with an ad_id of 6 to refer to the product with a prod_id of 9 */
UPDATE esell.ADVERTISEMENT
SET prod_id = 9
WHERE ad_id = 6;

/* Delete the advertisements with a merchant_id of 2 (Stacys Stuff) */
DELETE FROM esell.ADVERTISEMENT
WHERE merchant_id = 2;