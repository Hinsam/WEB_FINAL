CREATE TABLE user
(
    Id          varchar(10) PRIMARY KEY,
    name        varchar(20) NOT NULL,
    Email       varchar(25),
    password    varchar(20)
);
INSERT INTO user VALUES ('a1b2c', 'John Doe', 'john.doe@google.com', 'pass123');
INSERT INTO user VALUES ('xYz12', 'Jane Smith', 'jane.smith@google.com', 'password456');
INSERT INTO user VALUES ('7h8g9', 'Bob Johnson', 'bob.j@google.com', 'securePass');
INSERT INTO user VALUES ('q2w3e', 'Alice Williams', 'alice.w@google.com', 'mySecret');
INSERT INTO user VALUES ('c4b5n', 'Charlie Brown', 'charlie.b@google.com', 'brown123');
INSERT INTO user VALUES ('eVaD7', 'Eva Davis', 'eva.d@google.com', 'evaPass');
INSERT INTO user VALUES ('fW123', 'Frank Wilson', 'frank.w@google.com', 'password7');
INSERT INTO user VALUES ('gM987', 'Grace exMiller', 'grace.m@google.com', 'gracePass');
INSERT INTO user VALUES ('hJ_23', 'Henry Jones', 'henry.j@google.com', 'password9');
INSERT INTO user VALUES ('IvyL5', 'Ivy Lee', 'ivy.l@google.com', 'ivyPass');
INSERT INTO user VALUES ('jW987', 'Jack White', 'jack.w@google.com', 'white123');
INSERT INTO user VALUES ('kT432', 'Karen Taylor', 'karen.t@google.com', 'karenPass');
INSERT INTO user VALUES ('lD432', 'Leo Davis', 'leo.d@google.com', 'leoPass');
INSERT INTO user VALUES ('MiaB', 'Mia Brown', 'mia.b@google.com', 'password14');
INSERT INTO user VALUES ('NtM78', 'Nathan Miller', 'nathan.m@google.com', 'nathanPass');
INSERT INTO user VALUES ('oW123', 'Olivia Wilson', 'olivia.w@google.com', 'olivia123');
INSERT INTO user VALUES ('PauS1', 'Paul Smith', 'paul.s@google.com', 'paulPass');
INSERT INTO user VALUES ('Quinn', 'Quinn Johnson', 'quinn.j@google.com', 'quinnPass');
INSERT INTO user VALUES ('rL567', 'Ryan Lee', 'ryan.l@google.com', 'ryan123');
INSERT INTO user VALUES ('SaraT', 'Sara Taylor', 'sara.t@google.com', 'saraPass');

CREATE TABLE sales (
    SaleId INT NOT NULL auto_increment PRIMARY KEY,
    ItemName varchar(50) not null,
    UserId varchar(50) not null,
    ItemDescription text not null,
    SaleDate varchar(50) not null,
    SalePrice varchar(50) not null
);
INSERT INTO sales VALUES ('1', 'PauS1', 'Laptop', 'Brand new laptop for sale', '2023-01-15', 899.99);
INSERT INTO sales VALUES ('2', 'PauS1', 'Smartwatch', 'Latest model smartwatch', '2023-02-28', 199.99);
INSERT INTO sales VALUES ('3', 'PauS1', 'Camera', 'Professional camera for sale', '2023-03-10', 1299.99);
INSERT INTO sales VALUES ('4', 'PauS1', 'Tablet', 'High-performance tablet', '2023-04-05', 499.99);
INSERT INTO sales VALUES ('5', 'PauS1', 'Gaming Console', 'Next-gen gaming console', '2023-05-20', 599.99);
INSERT INTO sales VALUES ('6', 'oW123', 'Fitness Tracker', 'Advanced fitness tracker', '2023-06-08', 79.99);
INSERT INTO sales VALUES ('7', 'oW123', 'Smart Speaker', 'Voice-controlled smart speaker', '2023-07-01', 149.99);
INSERT INTO sales VALUES ('8', 'oW123', 'Headphones', 'Noise-canceling headphones', '2023-08-12', 129.99);
INSERT INTO sales VALUES ('9', 'oW123', 'External Hard Drive', 'High-capacity external HDD', '2023-09-03', 89.99);
INSERT INTO sales VALUES ('10', 'oW123', 'Printer', 'Wireless color printer', '2023-10-15', 249.99);
INSERT INTO sales VALUES ('11', 'oW123', 'Smart Home Hub', 'Centralized smart home control', '2023-11-20', 199.99);
INSERT INTO sales VALUES ('12', 'MiaB', 'Monitor', 'Ultra-wide gaming monitor', '2023-12-05', 799.99);
INSERT INTO sales VALUES ('13', 'Graphic Tablet', 'MiaB', 'Digital graphic drawing tablet', '2024-01-08', 299.99);
INSERT INTO sales VALUES ('14', 'MiaB', 'Wireless Mouse', 'Ergonomic wireless mouse', '2024-02-14', 39.99);
INSERT INTO sales VALUES ('15', 'MiaB', 'VR Headset', 'Immersive virtual reality headset', '2024-03-22', 499.99);
INSERT INTO sales VALUES ('16', 'oW123', 'Wireless Keyboard', 'Compact wireless keyboard', '2024-04-10', 69.99);
INSERT INTO sales VALUES ('17', 'PauS1', 'Webcam', 'HD webcam with microphone', '2024-05-15', 59.99);
INSERT INTO sales VALUES ('18', 'MiaB', 'Bluetooth Earbuds', 'Wireless Bluetooth earbuds', '2024-06-18', 79.99);
INSERT INTO sales VALUES ('19', 'fW123', 'Smart Thermostat', 'Energy-efficient smart thermostat', '2024-07-02', 129.99);
INSERT INTO sales VALUES ('20', 'SaraT', 'Wireless Charger', 'Fast-charging wireless charger', '2024-08-09', 49.99);


CREATE TABLE trade_requests
(
    UserId            varchar(10),
    SaleId            varchar(10),
    Comment           varchar(255),
    RequestDate       date,
    RentalStartDate   date,
    RentalEndDate     date,
    PRIMARY KEY (UserId, SaleId),
    FOREIGN KEY (UserId) REFERENCES user(Id),
    FOREIGN KEY (SaleId) REFERENCES sales(SaleId)
);

INSERT INTO trade_requests VALUES ('a1b2c', '1', 'Interested in buying', '2023-01-16', '2023-01-17', '2023-01-19');
INSERT INTO trade_requests VALUES ('7h8g9', '1', 'Would like to discuss terms', '2023-03-01', '2023-03-10', '2023-03-20');
INSERT INTO trade_requests VALUES ('c4b5n', '2', 'Considering rental options', '2023-03-12', '2023-03-15', '2023-03-25');
INSERT INTO trade_requests VALUES ('c4b5n', '5', 'Interested in purchasing', '2023-04-06', '2023-04-07', '2023-04-10');
INSERT INTO trade_requests VALUES ('Quinn', '7', 'Looking to trade', '2023-05-25', '2023-06-01', '2023-06-15');
INSERT INTO trade_requests VALUES ('Quinn', '8', 'Interested in a short-term rental', '2023-06-10', '2023-06-15', '2023-06-25');
INSERT INTO trade_requests VALUES ('gM987', '10', 'Considering purchase options', '2023-07-02', '2023-07-10', '2023-07-15');
INSERT INTO trade_requests VALUES ('a1b2c', '15', 'Interested in a trade', '2023-08-15', '2023-08-20', '2023-08-30');
INSERT INTO trade_requests VALUES ('gM987', '17', 'Looking for a long-term rental', '2023-09-05', '2023-09-10', '2023-09-30');
INSERT INTO trade_requests VALUES ('rL567', '18', 'Interested in a trade', '2023-10-18', '2023-10-20', '2023-10-25');
INSERT INTO trade_requests VALUES ('fW123', '20', 'Considering purchase options', '2023-11-25', '2023-11-26', '2023-11-30');