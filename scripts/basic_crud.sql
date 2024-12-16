-- Create (Insert) Operations:
-- Insert a New Customer:
INSERT INTO customer (first_name, last_name, email_id, phone_number, state, country, sign_up_date)
VALUES ('John', 'Doe', 'john.doe@example.com', '555-1234', 'California', 'USA', CURRENT_DATE);


-- Insert New Content:
INSERT INTO content (title, genre, duration, cost_per_stream, release_date, distributor)
VALUES ('Movie Title', 'Action', 120, 5.99, '2023-12-01', 'Distributor_1');


-- Insert New Stream:
INSERT INTO streams (customer_id, content_id, stream_date, stream_time, stream_duration, stream_rating)
VALUES (1, 1, '2024-12-15', '14:30', 90, 5);


-- Insert New Invoice:
INSERT INTO invoice (customer_id, plan, service_period, payment_method, total)
VALUES (1, 'Premium', '2024-12', 'Credit Card', 99.99);



-- Read (Select) Operations:
Select All Customers:
SELECT * FROM customer;


-- Select Customer by customer_id:
SELECT * FROM customer WHERE customer_id = 1;


-- Select All Content of Genre 'Action':
SELECT * FROM content WHERE genre = 'Action';


-- Select Streams by Customer:
SELECT * FROM streams WHERE customer_id = 1;


-- Select Invoices for 'Premium' Plan:
SELECT * FROM invoice WHERE plan = 'Premium';



-- Update Operations:
-- Update Customer Email:
UPDATE customer
SET email_id = 'new.email@example.com'
WHERE customer_id = 1;


-- Update Content Cost per Stream:
UPDATE content
SET cost_per_stream = 7.99
WHERE content_id = 1;


-- Update Stream Rating:
UPDATE streams
SET stream_rating = 4
WHERE stream_id = 1;


-- Update Invoice Total Amount:
UPDATE invoice
SET total = 109.99
WHERE invoice_number = 1;



-- Delete Operations:
-- Delete a Customer:
DELETE FROM customer WHERE customer_id = 1;
-- Delete Content:
DELETE FROM content WHERE content_id = 1;
-- Delete a Stream:
DELETE FROM streams WHERE stream_id = 1;
-- Delete an Invoice:
DELETE FROM invoice WHERE invoice_number = 1;



-- Join Queries:
-- Get All Customer Names with Their Plan and Total Payments:
SELECT c.first_name, c.last_name, cp.plan, cp.total_payments
FROM customer c
JOIN customer_plan cp ON c.customer_id = cp.customer_id;


-- Get All Streamed Content and Stream Rating for a Customer:
SELECT s.stream_date, s.stream_time, c.title, s.stream_rating
FROM streams s
JOIN content c ON s.content_id = c.content_id
WHERE s.customer_id = 1;


-- Get All Invoices and Corresponding Customer Information:
SELECT i.invoice_number, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;




