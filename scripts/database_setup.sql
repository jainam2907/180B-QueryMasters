-- Creating Database:
CREATE DATABASE media_streaming;
USE media_streaming;



-- Table Creation : 
-- Create the customer table
CREATE TABLE customer (
   customer_id     INTEGER PRIMARY KEY AUTO_INCREMENT,
   first_name      VARCHAR(15),
   last_name       VARCHAR(15),
   email_id        VARCHAR(32),
   phone_number    VARCHAR(12),
   state           VARCHAR(19),
   country         VARCHAR(13),
   sign_up_date    DATE
);



-- Create the customer_plan table
CREATE TABLE customer_plan (
   customer_id     INTEGER PRIMARY KEY,
   plan            VARCHAR(8),
   total_payments  DECIMAL(10,2),
   FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


-- Create the content table
CREATE TABLE content (
   content_id       INTEGER PRIMARY KEY AUTO_INCREMENT,
   title            VARCHAR(90),
   genre            VARCHAR(29),
   duration         INTEGER,
   cost_per_stream  DECIMAL(6,2),
   release_date     DATE,
   distributor      VARCHAR(36)
);


-- Create the streams table
CREATE TABLE streams (
   stream_id       INTEGER PRIMARY KEY AUTO_INCREMENT,
   customer_id     INTEGER,
   content_id      INTEGER,
   stream_date     DATE,
   stream_time     VARCHAR(50),
   stream_duration INTEGER,
   stream_rating   INTEGER,
   FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
   FOREIGN KEY (content_id) REFERENCES content(content_id)
);



-- Create the invoice table
CREATE TABLE invoice (
   invoice_number   INTEGER PRIMARY KEY AUTO_INCREMENT,
   customer_id      INTEGER,
   plan             VARCHAR(8),
   service_period   VARCHAR(25),
   payment_method   VARCHAR(15),
   total            DECIMAL(10,2),
   FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
