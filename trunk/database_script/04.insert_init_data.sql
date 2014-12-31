-- User group
INSERT INTO user_group(name) VALUES ('Admin'); -- 1
INSERT INTO user_group(name) VALUES ('Member'); -- 2
INSERT INTO user_group(name) VALUES ('Frequent Member'); -- 3
INSERT INTO user_group(name) VALUES ('VIP'); -- 4

-- Default user
INSERT INTO os_user(group_id, username, password, full_name, address, phone, email)
    VALUES (1, 'admin', 'admin', 'Adminstrator', 'None', 'None', 'None'); -- 1
INSERT INTO os_user(group_id, username, password, full_name, address, phone, email)
    VALUES (2, 'member', 'member', 'Member', 'None', 'None', 'None'); -- 2
	
-- Statuses of product
INSERT INTO status(name) VALUES ('New'); -- 1 
INSERT INTO status(name) VALUES ('Hot'); -- 2
INSERT INTO status(name) VALUES ('Waiting'); -- 3
INSERT INTO status(name) VALUES ('In stock'); -- 4
INSERT INTO status(name) VALUES ('Out of stock'); -- 5

-- Statuses of order
INSERT INTO status(name) VALUES ('New'); -- 6
INSERT INTO status(name) VALUES ('Confirmed'); -- 7
INSERT INTO status(name) VALUES ('Shipping'); -- 8
INSERT INTO status(name) VALUES ('Done'); -- 9
INSERT INTO status(name) VALUES ('Canceled'); -- 10

-- Configs
INSERT INTO config(name, data_type, value)
    VALUES ('Min payment', 'VNÐ', '1000000'); -- 1
INSERT INTO config(name, data_type, value) 
    VALUES ('Max payment', 'VNÐ', '80000000'); -- 2

