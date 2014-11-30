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
INSERT INTO category(name, priority) VALUES ('Điện thoại', 1); -- 1
INSERT INTO category(name, priority) VALUES ('Laptop', 2); -- 2
INSERT INTO category(name, priority) VALUES ('Máy tính bảng', 3); -- 3
INSERT INTO category(name, priority) VALUES ('Máy tính', 4); -- 4
INSERT INTO category(name, priority) VALUES ('Máy nghe nhạc', 5); -- 5
INSERT INTO category(name, priority) VALUES ('Headphone', 6); -- 6
INSERT INTO category(name, priority) VALUES ('Phụ kiện', 7); -- 7

-- Taxes
INSERT INTO tax(name, value) VALUES ('VAT', 10); -- 1
INSERT INTO tax(name, value) VALUES ('GTGT', 10); -- 2

-- Transport fees
INSERT INTO transport_fee(name, price) VALUES ('Quận/Huyện', 0); -- 1
INSERT INTO transport_fee(name, price) VALUES ('Nội thành', 25000); -- 2
INSERT INTO transport_fee(name, price) VALUES ('Ngoại thành', 50000); -- 3
INSERT INTO transport_fee(name, price) VALUES ('Tỉnh', 100000); -- 4
INSERT INTO transport_fee(name, price) VALUES ('Miền', 200000); -- 5