-- Data Insertion to customer table: 
DELIMITER $$

CREATE PROCEDURE insert_customer_data()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO
        INSERT INTO customer (customer_id, first_name, last_name, email_id, phone_number, state, country, sign_up_date)
        VALUES (
            i,
            CONCAT('FirstName_', i),
            CONCAT('LastName_', i),
            CONCAT('user', i, '@example.com'),
            CONCAT('555-', LPAD(i, 4, '0')),
            CASE 
                WHEN i % 5 = 0 THEN 'California'
                WHEN i % 5 = 1 THEN 'Texas'
                WHEN i % 5 = 2 THEN 'New York'
                WHEN i % 5 = 3 THEN 'Florida'
                ELSE 'Nevada'
            END,
            'USA',
            CURRENT_DATE - INTERVAL (i * 10) DAY
        );

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;



-- Calling the function to insert data:
CALL insert_customer_data();




-- Data insertion to customer_plan_table:
DELIMITER $$

CREATE PROCEDURE insert_customer_plan_data()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO
        INSERT INTO customer_plan (customer_id, plan, total_payments)
        VALUES (
            i,
            CASE 
                WHEN i % 3 = 0 THEN 'Basic'
                WHEN i % 3 = 1 THEN 'Premium'
                ELSE 'Standard'
            END,
            ROUND(RAND() * 1000, 2)
        );

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;


-- Calling the function to insert data:
CALL insert_customer_plan_data();


-- Data insertion to Content Table:
DELIMITER $$

CREATE PROCEDURE insert_content_data()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO
        INSERT INTO content (content_id, title, genre, duration, cost_per_stream, release_date, distributor)
        VALUES (
            i,
            CONCAT('Content Title ', i),
            CASE 
                WHEN i % 5 = 0 THEN 'Action'
                WHEN i % 5 = 1 THEN 'Drama'
                WHEN i % 5 = 2 THEN 'Comedy'
                WHEN i % 5 = 3 THEN 'Horror'
                ELSE 'Documentary'
            END,
            FLOOR(RAND() * 180) + 30, -- Random duration between 30 and 210 minutes
            ROUND(RAND() * 10, 2), -- Random cost per stream between 0 and 10
            CURRENT_DATE - INTERVAL (i * 30) DAY,
            CONCAT('Distributor_', i)
        );

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;



-- Calling the function to insert data:
CALL insert_content_data();


-- Data insertion to streams table:
DELIMITER $$

CREATE PROCEDURE insert_streams_data()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO
        INSERT INTO streams (stream_id, customer_id, content_id, stream_date, stream_time, stream_duration, stream_rating)
        VALUES (
            i,
            FLOOR(RAND() * 10000) + 1, -- Random customer_id between 1 and 10000
            FLOOR(RAND() * 10000) + 1, -- Random content_id between 1 and 10000
            CURRENT_DATE - INTERVAL (i * 2) DAY,
            CONCAT(FLOOR(RAND() * 24), ':', LPAD(FLOOR(RAND() * 60), 2, '0')),
            FLOOR(RAND() * 120) + 30, -- Random stream duration between 30 and 150 minutes
            FLOOR(RAND() * 5) + 1 -- Random rating between 1 and 5
        );

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;


-- Calling the function to insert data:
CALL insert_streams_data();



-- Data Insertion to Invoice Table:
DELIMITER $$

CREATE PROCEDURE insert_invoice_data()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10000 DO
        INSERT INTO invoice (invoice_number, customer_id, plan, service_period, payment_method, total)
        VALUES (
            i,
            FLOOR(RAND() * 10000) + 1, -- Random customer_id between 1 and 10000
            CASE 
                WHEN i % 3 = 0 THEN 'Basic'
                WHEN i % 3 = 1 THEN 'Premium'
                ELSE 'Standard'
            END,
            CONCAT('Period_', FLOOR(RAND() * 12) + 1), -- Random service period between 1 and 12
            CASE 
                WHEN i % 2 = 0 THEN 'Credit Card'
                ELSE 'PayPal'
            END,
            ROUND(RAND() * 200, 2) -- Random total amount between 0 and 200
        );

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;


-- Calling the function to insert data:
CALL insert_invoice_data();
