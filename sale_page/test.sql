CREATE TABLE user
(
    Id          varchar(10) PRIMARY KEY,
    name        varchar(20) NOT NULL,
    Email       varchar(25),
    password    varchar(20),
    phone       varchar(20)

);
INSERT INTO user VALUES ('a1b2c', 'John Doe', 'john.doe@google.com', 'pass123', '010-0000-0000');
INSERT INTO user VALUES ('xYz12', 'Jane Smith', 'jane.smith@google.com', 'password456', '010-0000-1111');
INSERT INTO user VALUES ('7h8g9', 'Bob Johnson', 'bob.j@google.com', 'securePass', '010-0000-2222');
INSERT INTO user VALUES ('q2w3e', 'Alice Williams', 'alice.w@google.com', 'mySecret', '010-0000-3333');
INSERT INTO user VALUES ('c4b5n', 'Charlie Brown', 'charlie.b@google.com', 'brown123', '010-0000-4444');
INSERT INTO user VALUES ('eVaD7', 'Eva Davis', 'eva.d@google.com', 'evaPass', '010-0000-5555');
INSERT INTO user VALUES ('fW123', 'Frank Wilson', 'frank.w@google.com', 'password7', '010-0000-6666');
INSERT INTO user VALUES ('gM987', 'Grace exMiller', 'grace.m@google.com', 'gracePass', '010-0000-7777');
INSERT INTO user VALUES ('hJ_23', 'Henry Jones', 'henry.j@google.com', 'password9', '010-0000-8888');
INSERT INTO user VALUES ('IvyL5', 'Ivy Lee', 'ivy.l@google.com', 'ivyPass', '010-0000-0000');
INSERT INTO user VALUES ('jW987', 'Jack White', 'jack.w@google.com', 'white123', '010-0000-1222');
INSERT INTO user VALUES ('kT432', 'Karen Taylor', 'karen.t@google.com', 'karenPass', '010-0000-1333');
INSERT INTO user VALUES ('lD432', 'Leo Davis', 'leo.d@google.com', 'leoPass', '010-0000-1444');
INSERT INTO user VALUES ('MiaB', 'Mia Brown', 'mia.b@google.com', 'password14', '010-0000-1555');
INSERT INTO user VALUES ('NtM78', 'Nathan Miller', 'nathan.m@google.com', 'nathanPass', '010-0000-1666');
INSERT INTO user VALUES ('oW123', 'Olivia Wilson', 'olivia.w@google.com', 'olivia123', '010-0000-1777');
INSERT INTO user VALUES ('PauS1', 'Paul Smith', 'paul.s@google.com', 'paulPass', '010-0000-1888');
INSERT INTO user VALUES ('Quinn', 'Quinn Johnson', 'quinn.j@google.com', 'quinnPass', '010-0000-1999');
INSERT INTO user VALUES ('rL567', 'Ryan Lee', 'ryan.l@google.com', 'ryan123', '010-0000-2222');
INSERT INTO user VALUES ('SaraT', 'Sara Taylor', 'sara.t@google.com', 'saraPass', '010-0000-3333');

CREATE TABLE sales (
    SaleId INT NOT NULL auto_increment PRIMARY KEY,
    ItemName varchar(50) not null,
    UserId varchar(50) not null,
    ItemDescription text not null,
    SaleDate varchar(50) not null,
    SalePrice varchar(50) not null
);
INSERT INTO sales VALUES (1, 'Laptop', 'PauS1', 'Brand new laptop for sale', '2023-01-15', 899.99);
INSERT INTO sales VALUES (2, 'Smartwatch', 'PauS1', 'Latest model smartwatch', '2023-02-28', 199.99);
INSERT INTO sales VALUES (3, 'Camera', 'PauS1', 'Professional camera for sale', '2023-03-10', 1299.99);
INSERT INTO sales VALUES (4, 'Tablet', 'PauS1', 'High-performance tablet', '2023-04-05', 499.99);
INSERT INTO sales VALUES (5, 'Gaming Console', 'PauS1', 'Next-gen gaming console', '2023-05-20', 599.99);
INSERT INTO sales VALUES (6, 'Fitness Tracker', 'oW123', 'Advanced fitness tracker', '2023-06-08', 79.99);
INSERT INTO sales VALUES (7, 'Smart Speaker', 'oW123', 'Voice-controlled smart speaker', '2023-07-01', 149.99);
INSERT INTO sales VALUES (8, 'Headphones', 'oW123', 'Noise-canceling headphones', '2023-08-12', 129.99);
INSERT INTO sales VALUES (9, 'External Hard Drive', 'oW123', 'High-capacity external HDD', '2023-09-03', 89.99);
INSERT INTO sales VALUES (10, 'Printer', 'oW123', 'Wireless color printer', '2023-10-15', 249.99);
INSERT INTO sales VALUES (11, 'Smart Home Hub', 'oW123', 'Centralized smart home control', '2023-11-20', 199.99);
INSERT INTO sales VALUES (12, 'Monitor', 'MiaB', 'Ultra-wide gaming monitor', '2023-12-05', 799.99);
INSERT INTO sales VALUES (13, 'Graphic Tablet', 'MiaB', 'Digital graphic drawing tablet', '2024-01-08', 299.99);
INSERT INTO sales VALUES (14, 'Wireless Mouse', 'MiaB', 'Ergonomic wireless mouse', '2024-02-14', 39.99);
INSERT INTO sales VALUES (15, 'VR Headset', 'MiaB', 'Immersive virtual reality headset', '2024-03-22', 499.99);
INSERT INTO sales VALUES (16, 'Wireless Keyboard', 'MiaB', 'Compact wireless keyboard', '2024-04-10', 69.99);
INSERT INTO sales VALUES (17, 'Webcam', 'oW123', 'HD webcam with microphone', '2024-05-15', 59.99);
INSERT INTO sales VALUES (18, 'Bluetooth Earbuds', 'oW123', 'Wireless Bluetooth earbuds', '2024-06-18', 79.99);
INSERT INTO sales VALUES (19, 'Smart Thermostat', 'oW123', 'Energy-efficient smart thermostat', '2024-07-02', 129.99);
INSERT INTO sales VALUES (20, 'Wireless Charger', 'PauS1', 'Fast-charging wireless charger', '2024-08-09', 49.99);


CREATE TABLE trade_requests
(
    UserId            varchar(10),
    SaleId            INT,
    Comment           varchar(255),
    RequestDate       date,
    RentalStartDate   date,
    RentalEndDate     date,
    PRIMARY KEY (UserId, SaleId),
    FOREIGN KEY (UserId) REFERENCES user(Id),
    FOREIGN KEY (SaleId) REFERENCES sales(SaleId)
);

INSERT INTO trade_requests VALUES ('a1b2c', 1, 'Interested in buying', '2023-01-16', '2023-01-17', '2023-01-19');
INSERT INTO trade_requests VALUES ('7h8g9', 1, 'Would like to discuss terms', '2023-03-01', '2023-03-10', '2023-03-20');
INSERT INTO trade_requests VALUES ('c4b5n', 2, 'Considering rental options', '2023-03-12', '2023-03-15', '2023-03-25');
INSERT INTO trade_requests VALUES ('c4b5n', 5, 'Interested in purchasing', '2023-04-06', '2023-04-07', '2023-04-10');
INSERT INTO trade_requests VALUES ('Quinn', 7, 'Looking to trade', '2023-05-25', '2023-06-01', '2023-06-15');
INSERT INTO trade_requests VALUES ('Quinn', 8, 'Interested in a short-term rental', '2023-06-10', '2023-06-15', '2023-06-25');
INSERT INTO trade_requests VALUES ('gM987', 10, 'Considering purchase options', '2023-07-02', '2023-07-10', '2023-07-15');
INSERT INTO trade_requests VALUES ('a1b2c', 15, 'Interested in a trade', '2023-08-15', '2023-08-20', '2023-08-30');
INSERT INTO trade_requests VALUES ('gM987', 17, 'Looking for a long-term rental', '2023-09-05', '2023-09-10', '2023-09-30');
INSERT INTO trade_requests VALUES ('rL567', 18, 'Interested in a trade', '2023-10-18', '2023-10-20', '2023-10-25');
INSERT INTO trade_requests VALUES ('fW123', 20, 'Considering purchase options', '2023-11-25', '2023-11-26', '2023-11-30');