-- UserGroups
-- Statuses

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
    VALUES ('Giảm giá 10%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 10% trong tháng 12'); -- 1
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Giảm giá 20%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 20% trong tháng 12'); -- 2
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Giảm giá 30%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 30% trong tháng 12'); -- 3
	
-- Galleries
INSERT INTO gallery(name) VALUES ('Iphone 6 Plus'); -- 1
INSERT INTO gallery(name) VALUES ('Iphone 6'); -- 2
INSERT INTO gallery(name) VALUES ('Iphone 5s'); -- 3
INSERT INTO gallery(name) VALUES ('Iphone 4s'); -- 4

-- Images
INSERT INTO image(gallery_id, name, description) 
	VALUES (1, 'image/product_image/iphone-6-plus_1.jpg', 'Cuộc cách tân lớn nhất trong lịch sử iPhone với màn hình 5.5 inch, 4 góc bo tròn và mặt kính mài tinh xảo, dễ dàng cầm nắm thao tác sản phẩm hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (1, 'image/product_image/iphone-6-plus_2.jpg', 'Màn hình Retina, độ phân giải Full HD, cấu hình mạnh mẽ, chip A8-64 bit cho trải nghiệm xem phim, chơi game duyệt web hấp dẫn và thoải mái.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (1, 'image/product_image/iphone-6-plus_3.jpg', 'Giao diện, bàn phím ảo nằm ngang như trên iPad giúp bạn thao tác, soạn văn bản dễ dàng như trên một chiếc tablet.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (1, 'image/product_image/iphone-6-plus_4.jpg', 'Camera lồi 8 MP, camera trước 1.2 MP cùng nhiều cải tiến công nghệ, tính năng chống rung quang học giúp ảnh sắc nét căng, màu sắc trung thực giàu chi tiết.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (1, 'image/product_image/iphone-6-plus_5.jpg', 'Cải thiện Touch ID hỗ trợ bảo mật thông tin, hình ảnh an toàn hơn. Khả năng nhận diện dấu vân tay nhanh hơn giúp người dùng mở máy tức thì, chính xác.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (2, 'image/product_image/iphone-6-64gb_1.jpg', 'Thiết kế hoàn toàn mới lạ với bốn góc bo tròn mạnh, mép kính mài tinh tế giúp bạn cầm máy mềm mại, êm tay hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (2, 'image/product_image/iphone-6-64gb_2.jpg', 'Nút nguồn đặt ở cạnh phải, phím âm lượng dạng thanh dễ thao tác hơn. Toàn bộ thân máy nhôm nguyên khối, mỏng hơn cả iPhone 5S');
INSERT INTO image(gallery_id, name, description) 
	VALUES (2, 'image/product_image/iphone-6-64gb_3.jpg', 'Màn hình Retina HD 4.7 inch to hơn, sắc nét hơn mang đến không gian trải nghiệm rộng rãi, hấp dẫn, sống động hơn khi duyệt web, chơi game, xem video.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (2, 'image/product_image/iphone-6-64gb_4.jpg', 'Camera lồi 8 MP cùng camera trước 1.2 MP với công nghệ chống rung, kích thước điểm ảnh lớn, lấy nét cực nhanh, chụp ảnh tức thì cho ảnh đẹp mịn màng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (2, 'image/product_image/iphone-6-64gb_5.jpg', 'Bộ xử lý mạnh mẽ với chip A8 64-bit giúp máy chạy mượt mà, tốc độ phản hồi nhanh chóng mọi tác vụ, chơi game, xem video không hề giật, lag.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (2, 'image/product_image/iphone-6-64gb_6.jpg', 'Cải thiện cảm biến vân tay chính xác và nhanh hơn để ngón tay bạn trở thành Password hoàn hảo nhất, bảo mật dữ liệu, giúp bạn khóa/mở màn hình dễ dàng');
INSERT INTO image(gallery_id, name, description) VALUES (3, 'image/product_image/iPhone-5S-bac_1.jpg', '');
INSERT INTO image(gallery_id, name, description) VALUES (3, 'image/product_image/iPhone-5S-bac_2.jpg', '');
INSERT INTO image(gallery_id, name, description) VALUES (3, 'image/product_image/iPhone-5S-bac_3.jpg', '');
INSERT INTO image(gallery_id, name, description) VALUES (3, 'image/product_image/iPhone-5S-bac_4.jpg', '');
INSERT INTO image(gallery_id, name, description) VALUES (3, 'image/product_image/iPhone-5S-bac_5.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (4, 'image/product_image/iphone-4s-8gb_1.jpg', 'Thiết kế nguyên khối hoàn hảo với từng đường vát, bo tròn sắc sảo. Viền kim loại sáng bóng, mặt lưng bằng kính bóng mượt đầy sang trọng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (4, 'image/product_image/iphone-4s-8gb_2.jpg', 'Camera iPhone 4S CPU iPhone 4S Màn hình Retina 3.5 inch dùng mặt kính cường lực Gorrila Glass 3 vừa hiển thị sắc nét mịn màng, vừa có khả năng chống xước rất cao');
INSERT INTO image(gallery_id, name, description) 
	VALUES (4, 'image/product_image/iphone-4s-8gb_3.jpg', 'Camera 8 MP chụp ảnh cực chất, sắc nét chất lượng như trên máy ảnh chuyên nghiệp');
INSERT INTO image(gallery_id, name, description) 
	VALUES (4, 'image/product_image/iphone-4s-8gb_4.jpg', 'Chip A5, lõi kép xử lý nhanh gấp 2 lần, xử lý đồ họa gấp 7 lần iPhone 4 giúp máy chạy mượt mà mọi ứng dụng, game không hề giật, lag');

-- Product
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, description)
    VALUES (1, 1, 1, 1, 1, 'Iphone 6 Plus 128GB', 'image/product_icon/iphone-6-plus.jpg', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 1
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, description)
    VALUES (1, 1, 1, 2, 2, 'Iphone 6 128GB', 'image/product_icon/iphone-6.jpg', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 2
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, description)
    VALUES (1, 1, 1, 3, 3, 'Iphone 5s 32GB', 'image/product_icon/iphone-5s.jpg', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 3
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, description)
    VALUES (1, 1, 1, 4, 4, 'Iphone 4s 8GB', 'image/product_icon/iphone-4.jpg', 'Điện thoại thông minh cao cấp. HĐH: iOS'); -- 4
	
-- Category products
INSERT INTO category_product(category_id, product_id) VALUES (1, 1);
INSERT INTO category_product(category_id, product_id) VALUES (1, 2);
INSERT INTO category_product(category_id, product_id) VALUES (1, 3);
INSERT INTO category_product(category_id, product_id) VALUES (1, 4);

-- Carts
INSERT INTO cart(id) VALUES (1); -- 1
INSERT INTO cart(id) VALUES (2); -- 2

-- Cart products
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (1, 1, 1);
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (1, 2, 1);
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (2, 3, 1);
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (2, 4, 1);

-- Users
INSERT INTO os_user(group_id, cart_id, username, password, full_name, address, phone, email)
    VALUES (2, 1, 'thanh', 'thanh', 'Phan Lê Thanh', 'Nguyen Duy, P.9, Q.8', '01657776661', 'phanlethanh93@gmail.com'); -- 3
INSERT INTO os_user(group_id, cart_id, username, password, full_name, address, phone, email)
    VALUES (2, 2, 'thang', 'thang', 'Trần Việt Thắng', 'Nguyen Duy, P.9, Q.8', '01658884442', 'thangviet1206@gmail.com'); -- 4

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