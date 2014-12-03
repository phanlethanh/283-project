-- UserGroups
-- Statuses
-- Users
INSERT INTO os_user(group_id, username, password, full_name, address, phone, email)
    VALUES (2, 'thanh', 'thanh', 'Phan Lê Thanh', 'Nguyen Duy, P.9, Q.8', '01657776661', 'phanlethanh93@gmail.com'); -- 3
INSERT INTO os_user(group_id, username, password, full_name, address, phone, email)
    VALUES (2, 'thang', 'thang', 'Trần Việt Thắng', 'Nguyen Duy, P.9, Q.8', '01658884442', 'thangviet1206@gmail.com'); -- 4

-- Producers
INSERT INTO producer(name, description) VALUES ('Apple', 'https://www.apple.com/'); -- 1
INSERT INTO producer(name, description) VALUES ('Samsung', 'http://www.samsung.com/vn/home'); -- 2
INSERT INTO producer(name, description) VALUES ('Sony', 'http://www.sony.com.vn/'); -- 3
INSERT INTO producer(name, description) VALUES ('Nokia', 'http://www.nokia.com/vn-vi/'); -- 4
INSERT INTO producer(name, description) VALUES ('Microsoft', 'http://www.microsoft.com/'); -- 5
INSERT INTO producer(name, description) VALUES ('HTC', 'http://www.htc.com/vn/'); -- 6
INSERT INTO producer(name, description) VALUES ('LG', 'http://www.lg.com/vn'); -- 7
INSERT INTO producer(name, description) VALUES ('Philips', 'http://www.philips.com.vn/'); -- 8
INSERT INTO producer(name, description) VALUES ('OPPO', 'http://www.oppomobile.vn/'); -- 9
INSERT INTO producer(name, description) VALUES ('Gionee', 'Gionee'); -- 10
INSERT INTO producer(name, description) VALUES ('Lenovo', 'http://www.lenovo.com/'); -- 11
INSERT INTO producer(name, description) VALUES ('Mobiistar', 'http://www.mobiistar.vn/'); -- 12
INSERT INTO producer(name, description) VALUES ('Q-Mobile', 'http://qmobile.vn/'); -- 13
INSERT INTO producer(name, description) VALUES ('Pantech', 'http://pantech.com/'); -- 14
INSERT INTO producer(name, description) VALUES ('Dell', 'http://www.dell.com/vn'); -- 15
INSERT INTO producer(name, description) VALUES ('HP', 'http://www8.hp.com/vn/en/home.html'); -- 16
INSERT INTO producer(name, description) VALUES ('Asus', 'http://www.asus.com/vn/'); -- 17
INSERT INTO producer(name, description) VALUES ('Acer', 'http://www.acer.com/'); -- 18
INSERT INTO producer(name, description) VALUES ('Google Nexus', 'http://www.google.com/nexus/'); -- 19
INSERT INTO producer(name, description) VALUES ('Huawei', 'http://huawei.com.vn/'); -- 20

-- Categories
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Điện thoại', 1); -- 1
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Laptop', 2); -- 2
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Máy tính bảng', 3); -- 3
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Máy tính', 4); -- 4
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Máy nghe nhạc', 5); -- 5
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Headphone', 6); -- 6
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Phụ kiện', 7); -- 7

-- Taxes
INSERT INTO tax(name, value) VALUES ('VAT', 10); -- 1
INSERT INTO tax(name, value) VALUES ('GTGT', 10); -- 2

-- Transport fees
INSERT INTO transport_fee(name, price) VALUES ('Quận/Huyện', 0); -- 1
INSERT INTO transport_fee(name, price) VALUES ('Nội thành', 25000); -- 2
INSERT INTO transport_fee(name, price) VALUES ('Ngoại thành', 50000); -- 3
INSERT INTO transport_fee(name, price) VALUES ('Tỉnh', 100000); -- 4
INSERT INTO transport_fee(name, price) VALUES ('Miền', 200000); -- 5

-- Prices
INSERT INTO price(price) VALUES (25590000); -- 1: Iphone 6 Plus 128GB
INSERT INTO price(price) VALUES (22990000); -- 2: Iphone 6 128GB
INSERT INTO price(price) VALUES (15990000); -- 3: Iphone 5s 32GB
INSERT INTO price(price) VALUES (8390000); -- 4: Iphone 4s 8GB

-- Promotion
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Sale 10%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 10% trong tháng 12'); -- 1
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Sale 20%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 20% trong tháng 12'); -- 2
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Sale 30%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 30% trong tháng 12'); -- 3
	
-- Galleries
INSERT INTO gallery(name) VALUES ('Iphone 6 Plus'); -- 1
INSERT INTO gallery(name) VALUES ('Iphone 6'); -- 2
INSERT INTO gallery(name) VALUES ('Iphone 5s'); -- 3
INSERT INTO gallery(name) VALUES ('Iphone 4s'); -- 4

-- Images
INSERT INTO image(gallery_id, name) VALUES (1, 'iphone6plus_1.png');
INSERT INTO image(gallery_id, name) VALUES (1, 'iphone6plus_2.png');
INSERT INTO image(gallery_id, name) VALUES (2, 'iphone6_1.png');
INSERT INTO image(gallery_id, name) VALUES (2, 'iphone6_2.png');
INSERT INTO image(gallery_id, name) VALUES (3, 'iphone5s_1.png');
INSERT INTO image(gallery_id, name) VALUES (3, 'iphone5s_2.png');
INSERT INTO image(gallery_id, name) VALUES (4, 'iphone4s_1.png');
INSERT INTO image(gallery_id, name) VALUES (4, 'iphone4s_1.png');

-- Product
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, description)
    VALUES (1, 1, 1, 1, 1, 'Iphone 6 Plus 128GB', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 1
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, description)
    VALUES (1, 1, 1, 2, 2, 'Iphone 6 128GB', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 2
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, description)
    VALUES (1, 1, 1, 3, 3, 'Iphone 5s 32GB', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 3
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, description)
    VALUES (1, 1, 1, 4, 4, 'Iphone 4s 8GB', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 4

-- Orders
INSERT INTO os_order(user_id, status_id, transport_fee_id, tax_id, address, phone)
    VALUES (3, 7, 1, 1, 'Nguyen Duy, P.9, Q.8', '01657776661'); -- 1
INSERT INTO os_order(user_id, status_id, transport_fee_id, tax_id, address, phone)
    VALUES (4, 7, 1, 1, 'Nguyen Duy, P.9, Q.8', '01658884442'); -- 2
	
-- Order details
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (1, 1, 1, 25590000); -- 1
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (2, 1, 1, 22990000); -- 2
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (3, 2, 1, 15990000); -- 3
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (4, 2, 1, 8390000); -- 4
	
-- Category products
INSERT INTO category_product(category_id, product_id) VALUES (1, 1);
INSERT INTO category_product(category_id, product_id) VALUES (1, 2);
INSERT INTO category_product(category_id, product_id) VALUES (1, 3);
INSERT INTO category_product(category_id, product_id) VALUES (1, 4);

-- Carts
INSERT INTO cart(id) VALUES (1); -- 1
INSERT INTO cart(id) VALUES (2); -- 2

-- Cart products
INSERT INTO cart_product(cart_id, product_id) VALUES (1, 1);
INSERT INTO cart_product(cart_id, product_id) VALUES (1, 2);
INSERT INTO cart_product(cart_id, product_id) VALUES (2, 3);
INSERT INTO cart_product(cart_id, product_id) VALUES (2, 4);