-- User group
INSERT INTO user_group(name) VALUES ('Admin'); -- 1
INSERT INTO user_group(name) VALUES ('Member'); -- 2

-- Default user
INSERT INTO os_user(group_id, username, password, full_name, address, phone, email)
    VALUES (1, 'admin', 'admin', 'Adminstrator', 'None', 'None', 'None'); -- 1
INSERT INTO os_user(group_id, username, password, full_name, address, phone, email)
    VALUES (2, 'member', 'member', 'Member', 'None', 'None', 'None'); -- 1

-- Statuses of product
INSERT INTO status(name) VALUES ('new'); -- 1 
INSERT INTO status(name) VALUES ('hot'); -- 2
INSERT INTO status(name) VALUES ('waiting'); -- 3
INSERT INTO status(name) VALUES ('in stock'); -- 4
INSERT INTO status(name) VALUES ('out of stock'); -- 5

-- Statuses of order
INSERT INTO status(name) VALUES ('create'); -- 6
INSERT INTO status(name) VALUES ('confirm'); -- 7
INSERT INTO status(name) VALUES ('shipping'); -- 7
INSERT INTO status(name) VALUES ('done'); -- 8
INSERT INTO status(name) VALUES ('cancel'); -- 9


