CREATE TABLE user
(
    Id          varchar(10) PRIMARY KEY,
    name        varchar(20) NOT NULL,
    Email       varchar(20),
    password    varchar(20)
);
INSERT INTO user VALUES ('hsk9188', 'John Doe', 'johndoe@email.com', 'pwd12345');
INSERT INTO user VALUES ('su8394', 'Jane Smith', 'janesmith@email.com', 'smithJane789');
INSERT INTO user VALUES ('look839', 'Mike Brown', 'mikebrown@email.com', 'mikeB2001');
INSERT INTO user VALUES ('art5678', 'Sarah Johnson', 'sarahj@email.com', 'sarahJ2020');
INSERT INTO user VALUES ('max9123', 'Chris Lee', 'chrislee@email.com', 'leeChris321');
INSERT INTO user VALUES ('skyhigh', 'Emma Wilson', 'emmaw@email.com', 'wilsonE123');
INSERT INTO user VALUES ('runfast', 'Daniel Kim', 'danielk@email.com', 'kimD2021');
INSERT INTO user VALUES ('jump987', 'Sophia Martinez', 'sophiam@email.com', 'martinezS1');
INSERT INTO user VALUES ('bike456', 'James White', 'jamesw@email.com', 'whiteJ456');
INSERT INTO user VALUES ('swimfast', 'Lisa Hall', 'lisah@email.com', 'hallLisa900');
INSERT INTO user VALUES ('flyaway', 'Tom Clark', 'tomc@email.com', 'clarkT789');
INSERT INTO user VALUES ('dance123', 'Grace Turner', 'gracet@email.com', 'turnerG321');
INSERT INTO user VALUES ('singnow', 'Evan Lewis', 'evanl@email.com', 'lewisEvan123');
INSERT INTO user VALUES ('painter', 'Mia Young', 'miay@email.com', 'youngM2022');
INSERT INTO user VALUES ('writepen', 'Alex King', 'alexk@email.com', 'kingA456');
INSERT INTO user VALUES ('readbook', 'Ruby Scott', 'rubys@email.com', 'scottR789');
INSERT INTO user VALUES ('cookwell', 'Oliver Adams', 'olivera@email.com', 'adamsO321');
INSERT INTO user VALUES ('gardener', 'Charlotte Brooks', 'charlotteb@email.com', 'brooksC123');
INSERT INTO user VALUES ('playmusic', 'Noah Rivera', 'noahr@email.com', 'riveraN456');
INSERT INTO user VALUES ('traveler', 'Ella Morris', 'ellam@email.com', 'morrisE789');

CREATE TABLE sales
(
    SaleId            varchar(10) PRIMARY KEY,
    UserId            varchar(10),
    ItemName          varchar(50) NOT NULL,
    ItemDescription   varchar(255),
    SaleDate          date,
    SalePrice         decimal(10, 2),
    FOREIGN KEY (UserId) REFERENCES user(Id)
);
INSERT INTO sales VALUES ('S01', 'hsk9188', 'Cooking Pot', 'Large cooking pot perfect for stews', '2023-01-15', 29.99);
INSERT INTO sales VALUES ('S02', 'su8394', 'Baking Sheet', 'Non-stick baking sheet for pastries', '2023-02-01', 15.99);
INSERT INTO sales VALUES ('S03', 'look839', 'Knife Set', 'Set of chef knives for cutting', '2023-02-17', 45.99);
INSERT INTO sales VALUES ('S04', 'art5678', 'Mixing Bowl', 'Stainless steel mixing bowl set', '2023-03-05', 19.99);
INSERT INTO sales VALUES ('S05', 'max9123', 'Measuring Cups', 'Precise measuring cups for baking', '2023-03-20', 9.99);
INSERT INTO sales VALUES ('S06', 'skyhigh', 'Blender', 'Powerful blender for smoothies', '2023-04-10', 49.99);
INSERT INTO sales VALUES ('S07', 'runfast', 'Toaster', '4-slice toaster with browning settings', '2023-04-25', 25.99);
INSERT INTO sales VALUES ('S08', 'jump987', 'Food Processor', 'Multipurpose food processor', '2023-05-09', 59.99);
INSERT INTO sales VALUES ('S09', 'bike456', 'Rice Cooker', 'Electric rice cooker with timer', '2023-05-24', 29.99);
INSERT INTO sales VALUES ('S10', 'swimfast', 'Casserole Dish', 'Glass casserole dish for baking', '2023-06-08', 14.99);
INSERT INTO sales VALUES ('S11', 'flyaway', 'Griddle Pan', 'Non-stick griddle pan', '2023-06-23', 24.99);
INSERT INTO sales VALUES ('S12', 'dance123', 'Colander', 'Stainless steel colander for draining', '2023-07-07', 12.99);
INSERT INTO sales VALUES ('S13', 'singnow', 'Peeler', 'Sharp vegetable peeler', '2023-07-22', 4.99);
INSERT INTO sales VALUES ('S14', 'painter', 'Spatula Set', 'Silicone spatula set for cooking', '2023-08-06', 11.99);
INSERT INTO sales VALUES ('S15', 'writepen', 'Oven Mitts', 'Heat-resistant oven mitts', '2023-08-21', 8.99);
INSERT INTO sales VALUES ('S16', 'readbook', 'Teapot', 'Ceramic teapot with infuser', '2023-09-05', 20.99);
INSERT INTO sales VALUES ('S17', 'cookwell', 'Grill Pan', 'Cast iron grill pan', '2023-09-20', 35.99);
INSERT INTO sales VALUES ('S18', 'gardener', 'Juicer', 'Manual fruit juicer', '2023-10-04', 17.99);
INSERT INTO sales VALUES ('S19', 'playmusic', 'Pasta Maker', 'Manual pasta maker for homemade pasta', '2023-10-19', 40.99);
INSERT INTO sales VALUES ('S20', 'traveler', 'Slow Cooker', 'Large slow cooker for easy meals', '2023-11-03', 55.99);

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

INSERT INTO trade_requests VALUES ('hsk9188', 'S01', 'Would like to rent the stainless steel pot', '2023-01-05', '2023-01-07', '2023-01-12');
INSERT INTO trade_requests VALUES ('su8394', 'S02', 'Interested in the blender for a week', '2023-01-06', '2023-01-08', '2023-01-15');
INSERT INTO trade_requests VALUES ('look839', 'S03', 'Looking to rent chef knife', '2023-01-07', '2023-01-09', '2023-01-14');
INSERT INTO trade_requests VALUES ('art5678', 'S04', 'Interested in toaster rental', '2023-01-08', '2023-01-11', '2023-01-18');
INSERT INTO trade_requests VALUES ('max9123', 'S05', 'Would like to try out the cutting board', '2023-01-09', '2023-01-12', '2023-01-17');
INSERT INTO trade_requests VALUES ('skyhigh', 'S06', 'Interested in renting mixing bowls', '2023-01-10', '2023-01-13', '2023-01-20');
INSERT INTO trade_requests VALUES ('runfast', 'S07', 'Want to rent the frying pan for an event', '2023-01-11', '2023-01-14', '2023-01-21');
INSERT INTO trade_requests VALUES ('jump987', 'S08', 'Looking to rent rice cooker', '2023-01-12', '2023-01-15', '2023-01-22');
INSERT INTO trade_requests VALUES ('bike456', 'S09', 'Interested in microwave oven rental', '2023-01-13', '2023-01-16', '2023-01-23');
INSERT INTO trade_requests VALUES ('swimfast', 'S10', 'Looking for a food processor rental', '2023-01-14', '2023-01-17', '2023-01-24');
INSERT INTO trade_requests VALUES ('flyaway', 'S11', 'Interested in the tea kettle', '2023-01-12', '2023-01-19', '2023-01-26');
INSERT INTO trade_requests VALUES ('dance123', 'S12', 'Need baking dish for a party', '2023-01-13', '2023-01-20', '2023-01-27');
INSERT INTO trade_requests VALUES ('singnow', 'S13', 'Dutch oven rental inquiry', '2023-01-14', '2023-01-21', '2023-01-28');
INSERT INTO trade_requests VALUES ('painter', 'S14', 'Looking for an electric grill', '2023-01-15', '2023-01-22', '2023-01-29');
INSERT INTO trade_requests VALUES ('writepen', 'S15', 'Coffee maker needed for event', '2023-01-16', '2023-01-23', '2023-01-30');
INSERT INTO trade_requests VALUES ('readbook', 'S16', 'Interested in bread maker', '2023-01-17', '2023-01-24', '2023-01-31');
INSERT INTO trade_requests VALUES ('cookwell', 'S17', 'Looking for a pasta maker to try', '2023-01-18', '2023-01-25', '2023-02-01');
INSERT INTO trade_requests VALUES ('gardener', 'S18', 'Need a crock pot for slow cooking', '2023-01-19', '2023-01-26', '2023-02-02');
INSERT INTO trade_requests VALUES ('playmusic', 'S19', 'Interested in waffle iron', '2023-01-20', '2023-01-27', '2023-02-03');
INSERT INTO trade_requests VALUES ('traveler', 'S20', 'Juicer needed for a health kick', '2023-01-21', '2023-01-28', '2023-02-04');
