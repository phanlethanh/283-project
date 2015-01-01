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
INSERT INTO status(status_type, name) VALUES ('product', 'Mới'); -- 1 
INSERT INTO status(status_type, name) VALUES ('product', 'Hot'); -- 2
INSERT INTO status(status_type, name) VALUES ('product', 'Chưa có hàng'); -- 3
INSERT INTO status(status_type, name) VALUES ('product', 'Còn hàng'); -- 4
INSERT INTO status(status_type, name) VALUES ('product', 'Hết hàng'); -- 5

-- Statuses of order
INSERT INTO status(status_type, name) VALUES ('order', 'Mới'); -- 6
INSERT INTO status(status_type, name) VALUES ('order', 'Đã xác nhận'); -- 7
INSERT INTO status(status_type, name) VALUES ('order', 'Đang giao hàng'); -- 8
INSERT INTO status(status_type, name) VALUES ('order', 'Hoàn tất'); -- 9
INSERT INTO status(status_type, name) VALUES ('order', 'Đã hủy'); -- 10
INSERT INTO status(status_type, name) VALUES ('order', 'Đã thanh toán'); -- 11

-- Configs
INSERT INTO config(name, data_type, value)
    VALUES ('Min payment', 'VNÐ', '1000000'); -- 1
INSERT INTO config(name, data_type, value) 
    VALUES ('Max payment', 'VNÐ', '80000000'); -- 2

