/* Q1: Retrieve all orders that were placed during the month of April */
SELECT *
FROM esell.`ORDER`
WHERE MONTH(order_date) = 4;

/* Q2: Retrieves the total profit for the company */
SELECT SUM(profit) AS total_profit
FROM esell.REVENUE;

/* Q3: Retrieve all of the product names from Stacys Stuff */
SELECT P.pname
FROM esell.PRODUCT AS P, esell.MERCHANT AS M
WHERE P.merchant_id = M.merchant_id AND M.mname LIKE 'Stacys Stuff';

/* Q4: Retrieves all of John's friends' names */
SELECT C2.cust_id AS friend_id, C2.fname AS friend
FROM esell.FRIENDSHIP as F, esell.CUSTOMER AS C1, esell.CUSTOMER AS C2
WHERE F.cust1_id = C1.cust_id AND F.cust2_id = C2.cust_id AND C1.fname LIKE 'John';

/* Q5: Retrieves the number of female customers */
SELECT COUNT(*) AS num_female
FROM esell.CUSTOMER
WHERE sex = 'F';