-- UserGroups
-- Statuses

-- ###############################################################################################################
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
INSERT INTO producer(name, description) VALUES ('Beat Audio', 'http://vn.beatsbydre.com/'); -- 21
INSERT INTO producer(name, description) VALUES ('Toshiba', 'http://www.toshiba.com.vn/'); -- 22


-- ###############################################################################################################
-- Categories
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Điện thoại', 1); -- 1
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Laptop', 2); -- 2
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Máy tính bảng', 3); -- 3
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Máy tính', 4); -- 4
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Máy nghe nhạc', 5); -- 5
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Headphone', 6); -- 6
INSERT INTO category(parent_id, name, priority) VALUES (0, 'Phụ kiện', 7); -- 7
-- Danh mục điện thoại
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Apple (iPhone)', 1); -- 8
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Samsung', 2); -- 9
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Nokia', 3); -- 10
INSERT INTO category(parent_id, name, priority) VALUES (1, 'HTC', 4); -- 11
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Sony', 5); -- 12
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Asus (Zenfone)', 6); -- 13
INSERT INTO category(parent_id, name, priority) VALUES (1, 'LG', 7); -- 14
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Philips', 8); -- 15
INSERT INTO category(parent_id, name, priority) VALUES (1, 'OPPO', 9); -- 16
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Gionee', 10); -- 17
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Mobiistar', 11); -- 18
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Q-Mobile', 12); -- 19
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Pantech', 13); -- 20
INSERT INTO category(parent_id, name, priority) VALUES (1, 'Microsoft', 14); -- 21
-- Danh mục laptop
INSERT INTO category(parent_id, name, priority) VALUES (2, 'Apple (Macbook)', 1); -- 22
INSERT INTO category(parent_id, name, priority) VALUES (2, 'Dell', 2); -- 23
INSERT INTO category(parent_id, name, priority) VALUES (2, 'Acer', 3); -- 24
INSERT INTO category(parent_id, name, priority) VALUES (2, 'Asus', 4); -- 25
INSERT INTO category(parent_id, name, priority) VALUES (2, 'HP-Compaq', 5); -- 26
INSERT INTO category(parent_id, name, priority) VALUES (2, 'Lenovo', 6); -- 27
INSERT INTO category(parent_id, name, priority) VALUES (2, 'Toshiba', 6); -- 28
-- Danh mục máy tính bảng
INSERT INTO category(parent_id, name, priority) VALUES (3, 'Apple (iPad)', 1); -- 29
INSERT INTO category(parent_id, name, priority) VALUES (3, 'Samsung', 2); -- 30
INSERT INTO category(parent_id, name, priority) VALUES (3, 'Asus', 3); -- 31
INSERT INTO category(parent_id, name, priority) VALUES (3, 'Huawei', 4); -- 32
INSERT INTO category(parent_id, name, priority) VALUES (3, 'Google Nexus', 5); -- 33
-- Danh mục máy tính
INSERT INTO category(parent_id, name, priority) VALUES (4, 'Apple (iMac)', 1); -- 34
INSERT INTO category(parent_id, name, priority) VALUES (4, 'Dell', 2); -- 35
INSERT INTO category(parent_id, name, priority) VALUES (4, 'Sony', 3); -- 36
INSERT INTO category(parent_id, name, priority) VALUES (4, 'HP', 4); -- 37
-- Danh mục máy nghe nhạc
INSERT INTO category(parent_id, name, priority) VALUES (5, 'Apple (iPod)', 1); -- 38
INSERT INTO category(parent_id, name, priority) VALUES (5, 'Sony', 2); -- 39
-- Danh mục headphone
INSERT INTO category(parent_id, name, priority) VALUES (6, 'Beat Audio', 1); -- 40
INSERT INTO category(parent_id, name, priority) VALUES (6, 'Sony', 2); -- 41
-- Danh mục phụ kiện
INSERT INTO category(parent_id, name, priority) VALUES (7, 'Sạc dự phòng', 1); -- 42
INSERT INTO category(parent_id, name, priority) VALUES (7, 'Pin dự phòng', 2); -- 43
INSERT INTO category(parent_id, name, priority) VALUES (7, 'Tai nghe', 3); -- 44
INSERT INTO category(parent_id, name, priority) VALUES (7, 'Chuột máy tính', 4); -- 45
INSERT INTO category(parent_id, name, priority) VALUES (7, 'Bàn phím', 5); -- 46
INSERT INTO category(parent_id, name, priority) VALUES (7, 'USB', 6); -- 47
INSERT INTO category(parent_id, name, priority) VALUES (7, 'Ốp lưng điện thoại', 7); -- 48
INSERT INTO category(parent_id, name, priority) VALUES (7, 'Thẻ nhớ', 8); -- 49

-- ###############################################################################################################
-- Taxes
INSERT INTO tax(name, value) VALUES ('VAT', 10); -- 1
INSERT INTO tax(name, value) VALUES ('GTGT', 10); -- 2

-- ###############################################################################################################
-- Transport fees
INSERT INTO transport_fee(name, price) VALUES ('Quận/Huyện', 0); -- 1
INSERT INTO transport_fee(name, price) VALUES ('Nội thành', 25000); -- 2
INSERT INTO transport_fee(name, price) VALUES ('Ngoại thành', 50000); -- 3
INSERT INTO transport_fee(name, price) VALUES ('Tỉnh', 100000); -- 4
INSERT INTO transport_fee(name, price) VALUES ('Miền', 200000); -- 5

-- ###############################################################################################################
-- Promotion
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Giảm giá 10%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 10% trong tháng 12'); -- 1
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Giảm giá 20%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 20% trong tháng 12'); -- 2
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Giảm giá 30%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 30% trong tháng 12'); -- 3
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Giảm giá 40%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 40% trong tháng 12'); -- 4
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Giảm giá 50%', '2014-12-01', '2014-12-31', 'Sale off', 'Giảm giá 50% trong tháng 12'); -- 5
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Phiếu mua hàng 100.000đ', '2014-12-01', '2014-12-31', 'Voucher', 'Phiếu mua hàng trị giá 100.000đ'); -- 6
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Phiếu mua hàng 200.000đ', '2014-12-01', '2014-12-31', 'Voucher', 'Phiếu mua hàng trị giá 200.000đ'); -- 7
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Phiếu mua hàng 300.000đ', '2014-12-01', '2014-12-31', 'Voucher', 'Phiếu mua hàng trị giá 300.000đ'); -- 8
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Phiếu mua hàng 400.000đ', '2014-12-01', '2014-12-31', 'Voucher', 'Phiếu mua hàng trị giá 400.000đ'); -- 9
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Phiếu mua hàng 500.000đ', '2014-12-01', '2014-12-31', 'Voucher', 'Phiếu mua hàng trị giá 500.000đ'); -- 10
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Tặng thẻ nhớ 4GB', '2014-12-01', '2014-12-31', 'Gift', 'Khách hàng được tặng kèm thẻ nhớ 4GB'); -- 11
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Tặng thẻ nhớ 8GB', '2014-12-01', '2014-12-31', 'Gift', 'Khách hàng được tặng kèm thẻ nhớ 8GB'); -- 12
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Tặng ốp lưng', '2014-12-01', '2014-12-31', 'Gift', 'Khách hàng được tặng kèm ốp lưng điện thoại'); -- 13
INSERT INTO promotion(name, start_date, end_date, type_promotion, description)
    VALUES ('Tặng pin dự phòng', '2014-12-01', '2014-12-31', 'Gift', 'Khách hàng được tặng kèm pin dự phòng cho điện thoại'); -- 14

-- ###############################################################################################################
-- Prices
INSERT INTO price(price) VALUES (25590000); -- 1: Iphone 6 Plus 128GB
INSERT INTO price(price) VALUES (22990000); -- 2: Iphone 6 128GB
INSERT INTO price(price) VALUES (15990000); -- 3: Iphone 5s 32GB
INSERT INTO price(price) VALUES (8390000); -- 4: Iphone 4s 8GB

INSERT INTO price(price) VALUES (17990000); -- 5: Samsung Galaxy Note 4
INSERT INTO price(price) VALUES (9990000); -- 6: Samsung Galaxy S5 G900
INSERT INTO price(price) VALUES (11990000); -- 7: Samsung Galaxy Note 3
INSERT INTO price(price) VALUES (2240000); -- 8: Samsung Galaxy V
INSERT INTO price(price) VALUES (2790000); -- 9: Samsung Galaxy Trend Plus S7580
INSERT INTO price(price) VALUES (4990000); -- 10: Samsung Galaxy Grand Prime G530
INSERT INTO price(price) VALUES (7990000); -- 11: Samsung Galaxy S4 i9500
INSERT INTO price(price) VALUES (3890000); -- 12: Samsung Galaxy Core 2 G355
INSERT INTO price(price) VALUES (3790000); -- 13: Samsung Galaxy Win I8552

INSERT INTO price(price) VALUES (15990000); -- 14: Sony Xperia Z3
INSERT INTO price(price) VALUES (12990000); -- 15: Sony Xperia Z2
INSERT INTO price(price) VALUES (10990000); -- 16: Sony Xperia Z1 C6902
INSERT INTO price(price) VALUES (13990000); -- 17: Sony Xperia Z3 Compact
INSERT INTO price(price) VALUES (8490000); -- 18: Sony Xperia Z Ultra C6802
INSERT INTO price(price) VALUES (9990000); -- 19: Sony Xperia T2 Ultra
INSERT INTO price(price) VALUES (7490000); -- 20: Sony Xperia M2 Aqua
INSERT INTO price(price) VALUES (4990000); -- 21: Sony Xperia M2
INSERT INTO price(price) VALUES (5990000); -- 22: Sony Xperia C3
INSERT INTO price(price) VALUES (2990000); -- 23: Sony Xperia E1
INSERT INTO price(price) VALUES (3990000); -- 24: Sony Xperia E3

INSERT INTO price(price) VALUES (10990000); -- 25: Nokia Lumia 930
INSERT INTO price(price) VALUES (8990000); -- 26: Nokia Lumia 1520
INSERT INTO price(price) VALUES (7990000); -- 27: Nokia Lumia 830
INSERT INTO price(price) VALUES (4990000); -- 28: Nokia Lumia 730 Dual SIM
INSERT INTO price(price) VALUES (4090000); -- 29: Nokia Lumia 625
INSERT INTO price(price) VALUES (5990000); -- 30: Nokia Lumia 1320
INSERT INTO price(price) VALUES (2990000); -- 31: Nokia Lumia 630
INSERT INTO price(price) VALUES (1990000); -- 32: Nokia Lumia 530

INSERT INTO price(price) VALUES (3490000); -- 33: Microsoft Lumia 535

INSERT INTO price(price) VALUES (5490000); -- 34: Asus Zenfone 6
INSERT INTO price(price) VALUES (3990000); -- 35: Asus Zenfone 5
INSERT INTO price(price) VALUES (2790000); -- 36: Asus Zenfone 4 A450
INSERT INTO price(price) VALUES (2190000); -- 37: Asus Zenfone 4

INSERT INTO price(price) VALUES (7990000); -- 38: Philips i928
INSERT INTO price(price) VALUES (6490000); -- 39: Philips i908
INSERT INTO price(price) VALUES (4990000); -- 40: Philips Xenium W6610
INSERT INTO price(price) VALUES (2190000); -- 41: Philips S388
INSERT INTO price(price) VALUES (1590000); -- 42: Philips S308
INSERT INTO price(price) VALUES (5490000); -- 43: Pantech Vega Iron
INSERT INTO price(price) VALUES (10200000); -- 44: Pantech Vega Iron 2

-- ###############################################################################################################
-- Galleries
INSERT INTO gallery(name) VALUES ('Iphone 6 Plus'); -- 1
INSERT INTO gallery(name) VALUES ('Iphone 6'); -- 2
INSERT INTO gallery(name) VALUES ('Iphone 5s'); -- 3
INSERT INTO gallery(name) VALUES ('Iphone 4s'); -- 4

INSERT INTO gallery(name) VALUES ('Samsung Galaxy Note 4'); -- 5
INSERT INTO gallery(name) VALUES ('Samsung Galaxy S5 G900'); -- 6
INSERT INTO gallery(name) VALUES ('Samsung Galaxy Note 3'); -- 7
INSERT INTO gallery(name) VALUES ('Samsung Galaxy V'); -- 8
INSERT INTO gallery(name) VALUES ('Samsung Galaxy Trend Plus S7580'); -- 9
INSERT INTO gallery(name) VALUES ('Samsung Galaxy Grand Prime G530'); -- 10
INSERT INTO gallery(name) VALUES ('Samsung Galaxy S4 i9500'); -- 11
INSERT INTO gallery(name) VALUES ('Samsung Galaxy Core 2 G355'); -- 12
INSERT INTO gallery(name) VALUES ('Samsung Galaxy Win I8552'); -- 13

INSERT INTO gallery(name) VALUES ('Sony Xperia Z3'); -- 14
INSERT INTO gallery(name) VALUES ('Sony Xperia Z2'); -- 15
INSERT INTO gallery(name) VALUES ('Sony Xperia Z1 C6902'); -- 16
INSERT INTO gallery(name) VALUES ('Sony Xperia Z3 Compact'); -- 17
INSERT INTO gallery(name) VALUES ('Sony Xperia Z Ultra C6802'); -- 18
INSERT INTO gallery(name) VALUES ('Sony Xperia T2 Ultra'); -- 19
INSERT INTO gallery(name) VALUES ('Sony Xperia M2 Aqua'); -- 20
INSERT INTO gallery(name) VALUES ('Sony Xperia M2'); -- 21
INSERT INTO gallery(name) VALUES ('Sony Xperia C3'); -- 22
INSERT INTO gallery(name) VALUES ('Sony Xperia E1'); -- 23
INSERT INTO gallery(name) VALUES ('Sony Xperia E3'); -- 24

INSERT INTO gallery(name) VALUES ('Nokia Lumia 930'); -- 25
INSERT INTO gallery(name) VALUES ('Nokia Lumia 1520'); -- 26
INSERT INTO gallery(name) VALUES ('Nokia Lumia 830'); -- 27
INSERT INTO gallery(name) VALUES ('Nokia Lumia 730 Dual SIM'); -- 28
INSERT INTO gallery(name) VALUES ('Nokia Lumia 625'); -- 29
INSERT INTO gallery(name) VALUES ('Nokia Lumia 1320'); -- 30
INSERT INTO gallery(name) VALUES ('Nokia Lumia 630'); -- 31
INSERT INTO gallery(name) VALUES ('Nokia Lumia 530'); -- 32
INSERT INTO gallery(name) VALUES ('Microsoft Lumia 535'); -- 33

INSERT INTO gallery(name) VALUES ('Asus Zenfone 6'); -- 34
INSERT INTO gallery(name) VALUES ('Asus Zenfone 5'); -- 35
INSERT INTO gallery(name) VALUES ('Asus Zenfone 4 A450'); -- 36
INSERT INTO gallery(name) VALUES ('Asus Zenfone 4'); -- 37

INSERT INTO gallery(name) VALUES ('Philips i928'); -- 38
INSERT INTO gallery(name) VALUES ('Philips i908'); -- 39
INSERT INTO gallery(name) VALUES ('Philips Xenium W6610'); -- 40
INSERT INTO gallery(name) VALUES ('Philips S388'); -- 41
INSERT INTO gallery(name) VALUES ('Philips S308'); -- 42
INSERT INTO gallery(name) VALUES ('Pantech Vega Iron'); -- 43
INSERT INTO gallery(name) VALUES ('Pantech Vega Iron 2'); -- 44

-- ###############################################################################################################
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

INSERT INTO image(gallery_id, name, description) 
	VALUES (5, 'image/product_image/samsung-galaxy-note-4-1.jpg', 'Màn hình 5.7 inch công nghệ Super AMOLED, chuẩn 2K siêu nét, màu sắc trung thực, sống động gấp 4 lần chuẩn HD thông thường.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (5, 'image/product_image/samsung-galaxy-note-4-2.jpg', 'Cấu hình khủng cùng hệ điều hành Android 4.4 giúp máy “chiến” mượt mà mọi ứng dụng nặng, game đồ họa cao.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (5, 'image/product_image/samsung-galaxy-note-4-3.jpg', 'Thế hệ Galaxy Note đầu tiên có thiết kế viền kim loại đầy đột phá. Máy đẹp hơn, chắc chắn và sang trọng hơn, xứng tầm một siêu phẩm.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (5, 'image/product_image/samsung-galaxy-note-4-4.jpg', 'Với bút S-pen bạn có thể thoải mái ghi chú, phác thảo mọi ý tưởng lên Note 4 dễ dàng như đang viết trên một cuốn sổ thông minh.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (5, 'image/product_image/samsung-galaxy-note-4-5.jpg', 'Camera 16 MP chống rung quang học giúp bạn lưu giữ mọi khoảnh khắc thật hoàn hảo, ngay trong điều kiện thiếu sáng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (5, 'image/product_image/samsung-galaxy-note-4-6.jpg', 'Sạc 50% pin chỉ trong 30 phút nhờ công nghệ sạc nhanh tiên tiến, vượt trội hơn hẳn các thế hệ tiền nhiệm.');

INSERT INTO image(gallery_id, name, description) 
	VALUES (6, 'image/product_image/samsung-galaxy-s5-1.jpg', 'Thiết kế sang trọng và hiện đại với mặt lưng họa tiết vân lỗ bắt mắt, chống xước, chống bám dấu vân tay hiệu quả.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (6, 'image/product_image/samsung-galaxy-s5-2.jpg', 'Camera 16 MP lấy nét cực nhanh giúp ảnh có độ nét cao cùng nhiều tùy chỉnh cho màu sắc trung thực, ấn tượng và giàu cảm xúc.  ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (6, 'image/product_image/samsung-galaxy-s5-3.jpg', 'Màn hình 5.1 inch Full HD công nghệ Super AMOLED có màu sắc tươi sáng, rực rỡ, hiển thị rõ nét khi dùng ngoài trời. ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (6, 'image/product_image/samsung-galaxy-s5-4.jpg', 'Thiết kế nắp đậy các cổng kết nối giúp máy chống bụi và nước giúp S5 bền bỉ trong điều kiện sử dụng dưới mua, làm đổ chất lỏng lên máy… ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (6, 'image/product_image/samsung-galaxy-s5-5.jpg', 'Kết nối WiFi nhanh gấp đôi nhờ chuẩn kết nối mới và công nghệ MIMO hiện đại giúp bạn xem phim, đăng tải, chia sẻ mạng xã hội nhanh chóng.');

INSERT INTO image(gallery_id, name, description) 
	VALUES (7, 'image/product_image/samsung-galaxy-note-3-1.jpg', 'Mặt lưng giả da, viền giả kim loại bao quanh máy được vát thành những đường dọc tinh xảo giống như một cuốn sổ tay được gấp lại');
INSERT INTO image(gallery_id, name, description) 
	VALUES (7, 'image/product_image/samsung-galaxy-note-3-2.jpg', 'Làm việc, giải trí thoải mái với màn hình rộng 5.7 inch Super AMOLED full HD kích thước mỏng, độ tương phản, độ sáng cao và tiết kiệm năng lượng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (7, 'image/product_image/samsung-galaxy-note-3-3.jpg', 'Bút S-Pen đa tài giúp mọi thao tác trên Note 3 chuyên nghiệp và tiện lợi: ghi chú như bút thật, chụp màn hình, tìm kiếm nâng cao, mở nhiều cửa sổ cùng lúc');
INSERT INTO image(gallery_id, name, description) 
	VALUES (7, 'image/product_image/samsung-galaxy-note-3-4.jpg', 'Chụp ảnh 13 MP công nghệ tiên tiến, chụp ảnh nhanh cùng công nghệ chống rung giúp cho ảnh hay video có chất lượng cực tốt, sắc nét và màu sắc hài hòa');
INSERT INTO image(gallery_id, name, description) 
	VALUES (7, 'image/product_image/samsung-galaxy-note-3-5.jpg', 'Thách thức mọi game, ứng dụng nặng, đồ họa cao hay xem phim Full HD mượt mà với chip xử lý 8 nhân cao cấp, RAM khủng 3 GB');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (8, 'image/product_image/samsung-galaxy-v-1.jpg', 'Thách thức tiếng ồn nhờ tích hợp tính năng tuỳ chỉnh âm lượng, loa ngoài lớn hơn 3dB so với thông thường giúp bạn nghe rõ ràng mọi cuộc gọi.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (8, 'image/product_image/samsung-galaxy-v-2.jpg', 'Smartphone giá rẻ có tích hợp camera trước giúp bạn tha hồ chụp ảnh tự sướng, chia sẻ với bạn bè, đăng tải trên Facebook.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (8, 'image/product_image/samsung-galaxy-v-3.jpg', 'Màn hình 4 inch nhỏ gọn giúp bạn dễ dàng mang máy theo mình đi khắp mọi nơi');
INSERT INTO image(gallery_id, name, description) 
	VALUES (8, 'image/product_image/samsung-galaxy-v-4.jpg', 'Thiết kế trẻ trung với các góc được bo tròn mềm mại. Mặt lưng vân da, đường viền giả kim loại sang trọng, chắc chắn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (8, 'image/product_image/samsung-galaxy-v-5.jpg', 'Chạy hệ điều hành Android 4.4 Kitkat cùng vi xử lý 1.2 GHz giúp máy chạy mượt mà nhiều ứng dụng hàng ngày, chơi tốt các game giải trí thông dụng.');

INSERT INTO image(gallery_id, name, description) 
	VALUES (9, 'image/product_image/samsung-galaxy-trend-plus-s7580-1.jpg', 'Thiết kế nhỏ gọn với 4 góc bo tròn mềm mại và viền giả kim loại có vân xước sang trọng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (9, 'image/product_image/samsung-galaxy-trend-plus-s7580-2.jpg', 'Màn hình 4 inch cùng  giao diện TouchWiz đầy màu sắc mang đến hình ảnh sắc nét, tươi sáng, rực rỡ. ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (9, 'image/product_image/samsung-galaxy-trend-plus-s7580-3.jpg', 'Camera 5 MP tự động lấy nét có hỗ trợ Flash giúp bạn chụp ảnh độ nét cao trong điều kiện ánh sáng ngoài trời hay trong phòng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (9, 'image/product_image/samsung-galaxy-trend-plus-s7580-4.jpg', 'Bộ xử lý 2 nhân, tốc độ 1.2 GHz khá tốt trong tầm giá mang đến khả năng chạy đa nhiệm hay sử dụng các ứng dụng mail, web, Facebook không giật lag.');

INSERT INTO image(gallery_id, name, description) 
	VALUES (10, 'image/product_image/samsung-galaxy-grand-prime-g530-1.jpg', 'Viền giả kim loại chắc chắn cùng với mặt lưng nhám chống bám dấu vân tay mang đến nét thiết kế sang trọng, thanh lịch');
INSERT INTO image(gallery_id, name, description) 
	VALUES (10, 'image/product_image/samsung-galaxy-grand-prime-g530-2.jpg', 'Màn hình 5 inch rộng rãi, hiển thị màu sắc khá rực rỡ, tươi sáng giúp bạn duyệt ảnh, chơi game hấp dẫn hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (10, 'image/product_image/samsung-galaxy-grand-prime-g530-3.jpg', 'Smartphone chuyên chụp ảnh tự sướng sắc nét, màu sắc trung thực với camera trước 5 MP, ống kính góc rộng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (10, 'image/product_image/samsung-galaxy-grand-prime-g530-4.jpg', 'Cấu hình lõi tứ mạnh mẽ giúp bạn lướt web, chơi game, chạy đa nhiệm mượt mà.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (11, 'image/product_image/samsung-galaxy-s4-i9500-1.jpg', 'Bộ xử lý 8 nhân mạnh mẽ vận hành mượ mà mọi ứng dụng nặng, game đồ hoạ cao giúp bạn giải trí thật đã');
INSERT INTO image(gallery_id, name, description) 
	VALUES (11, 'image/product_image/samsung-galaxy-s4-i9500-2.jpg', 'Thiết kế mạnh mẽ và sang trọng hơn với bề mặt phẳng, viền giả kim loại có phay xước rất tinh tế và mặt lưng giả da mịn màng, chắc tay khi sử dụng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (11, 'image/product_image/samsung-galaxy-s4-i9500-3.jpg', 'Màn hình 5 inch Super AMOLED Full HD cực kỳ sắc nét, tái tạo hình ảnh sống động, rực rỡ, giúp bạn giải trí đã hơn, hấp dẫn hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (11, 'image/product_image/samsung-galaxy-s4-i9500-4.jpg', 'Camera 13 chấm, cùng các tính năng chụp cùng lúc camera trước và sau, kèm âm thanh… giúp S4 lưu giữ trọn vẹn khoảnh khắc đáng nhớ của bạn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (11, 'image/product_image/samsung-galaxy-s4-i9500-5.jpg', 'Truy cập web, lướt Facebook, tải phim HD, 4K nhanh hơn gấp 3 lần nhờ chuẩn WiFi AC mới');
INSERT INTO image(gallery_id, name, description) 
	VALUES (11, 'image/product_image/samsung-galaxy-s4-i9500-6.jpg', 'Điều khiển bằng đôi mắt, cử chỉ: dừng phát video khi bạn đưa mắt hướng khác, tự động cuộn trang để bạn theo dõi liên tục trang web một cách dễ dàng nhất');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (12, 'image/product_image/samsung-galaxy-core-2-1.jpg', 'Thiết vế bo tròn bốn góc, mặt lưng giả da đậm phong cách của Samsung cùng với viền giả kim loại mang đến vẻ đẹp sang trọng, thanh lịch.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (12, 'image/product_image/samsung-galaxy-core-2-2.jpg', 'Cấu hình lõi tứ mạnh mẽ trong tầm giá kết hợp hệ điều hành Android 4.4 Kitkat giúp bạn chơi game, lướt web mượt mà không giật lag.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (12, 'image/product_image/samsung-galaxy-core-2-3.jpg', 'Camera 5 MP hỗ trợ Flash LED có khả năng chụp ảnh sắc nét hơn trong điều kiện thiếu sáng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (12, 'image/product_image/samsung-galaxy-core-2-4.jpg', '2 SIM 2 sóng giúp liên lạc, lướt web bằng 3G thuận lợi hơn, tiết kiệm hơn');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (13, 'image/product_image/samsung-galaxy-win-i8552-1.jpg', 'Thiết kế bo tròn đặc trưng của Samsung, khung giả kim loại sang trọng, chắc chắn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (13, 'image/product_image/samsung-galaxy-win-i8552-2.jpg', 'Camera 5MP tự động lấy nét nhanh, hình ảnh trong, sắc nét, màu sắc chân thực. ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (13, 'image/product_image/samsung-galaxy-win-i8552-3.jpg', 'Cấu hình 4 nhân, pin dung lượng cao 2000 mAh giúp máy duyệt web nhanh, chơi game mượt với thời gian sử dụng lâu hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (13, 'image/product_image/samsung-galaxy-win-i8552-4.jpg', 'Hỗ trợ 2 SIM 2 sóng giúp bạn liên lạc, sử dụng 3G tiện lợi và tiết kiệm hơn.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (14, 'image/product_image/sony-xperia-z3-1.jpg', 'Khung nhôm bo tròn, siêu mỏng 7.3mm, thanh lịch và sang trọng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (14, 'image/product_image/sony-xperia-z3-2.jpg', 'Màn hình 5.2 inch Full HD, công nghệ TRILUMINOS™ mang đến màu sắc trung thực, sắc nét, độ sáng cao, góc nhìn rộng 178 độ và hiển thị rõ nét ngoài trời');
INSERT INTO image(gallery_id, name, description) 
	VALUES (14, 'image/product_image/sony-xperia-z3-3.jpg', 'Bạn hoàn toàn yên tâm khi chụp ảnh dưới nước, sử dụng máy dưới trời mưa nhờ tiêu chuẩn chống nước, chống bụi cao nhất IP 65/68');
INSERT INTO image(gallery_id, name, description) 
	VALUES (14, 'image/product_image/sony-xperia-z3-4.jpg', 'Chiếc smartphone chụp ảnh đẹp nhất của Sony nhờ camera 20.7 MP công nghệ mới, quay phim 4K rõ nét, trung thực kể cả trong điều kiện thiếu sáng');

INSERT INTO image(gallery_id, name, description) 
	VALUES (15, 'image/product_image/sony-xperia-z2-1.jpg', 'Camera 20.7 MP chất lượng hình ảnh sánh ngang máy ảnh du lịch của Sony, quay phim 4K sắc nét, giàu chi tiết, bắt chụp mọi khoảnh khắc cuộc sống');
INSERT INTO image(gallery_id, name, description) 
	VALUES (15, 'image/product_image/sony-xperia-z2-2.jpg', 'Màn hình 5.2 inch sử dụng công nghệ tiên tiến tăng độ sâu màu sắc kết hợp tấm nền IPS chống chói giúp trải nghiệm hình ảnh chân thực, sống động');
INSERT INTO image(gallery_id, name, description) 
	VALUES (15, 'image/product_image/sony-xperia-z2-3.jpg', 'Thiết kế tỉ mỉ từng góc cạnh với hai mặt kính phản quang, thiết kế đối xứng liền mạch giúp máy sang trọng và cầm nắm chắc tay');
INSERT INTO image(gallery_id, name, description) 
	VALUES (15, 'image/product_image/sony-xperia-z2-4.jpg', 'Khả năng chống nước ấn tượng giúp máy vẫn hoạt động bền bỉ khi dùng dưới trời mưa, bị đổ cà phê lên máy hay chụp ảnh dưới nước đầy sáng tạo');

INSERT INTO image(gallery_id, name, description) 
	VALUES (16, 'image/product_image/sony-xperia-z1-1.jpg', 'Màn hình 5 inch Full HD, sử dụng công nghệ của Tivi Bravia mang đến chất lượng hiển thị sắc nét, sống động để xem phim, chơi game hấp dẫn hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (16, 'image/product_image/sony-xperia-z1-2.jpg', 'Chụp ảnh dưới nước, yên tâm sử dụng dưới trời mưa nhờ khả năng chống nước đạt tiêu chuẩn IP 55/58');
INSERT INTO image(gallery_id, name, description) 
	VALUES (16, 'image/product_image/sony-xperia-z1-3.jpg', 'Chơi game 3D mượt mà, chạy đa nhiệm khỏe, khởi chạy các ứng dụng không giật lag nhờ cấu hình 4 nhân, RAM 2GB');
INSERT INTO image(gallery_id, name, description) 
	VALUES (16, 'image/product_image/sony-xperia-z1-4.jpg', 'Khung nhôm nguyên khối liền mạch, mặt kính phản quang, đối xứng theo mọi hướng mang đến nét đẹp sang trọng, vừa vặn khi cầm tay');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (17, 'image/product_image/sony-xperia-z3-compact-1.jpg', 'Thiết kế sang trọng, vuông vức và gọn nhẹ trong lòng bàn tay.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (17, 'image/product_image/sony-xperia-z3-compact-2.jpg', 'Cấu hình mạnh mẽ chơi game mượt, xử lý mọi tác vụ nhanh chóng, thực sự hoàn hảo đối với một phiên bản rút gọn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (17, 'image/product_image/sony-xperia-z3-compact-3.jpg', 'Màn hình 4.6 inch độ phân giải cao sử dụng công nghệ vượt trội của Sony mang lại hình ảnh chân thực, sống động.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (17, 'image/product_image/sony-xperia-z3-compact-4.jpg', 'Với khả năng chống nước hoàn hảo bạn có thể yên tâm chụp ảnh dưới nước hay sử dụng dưới mưa.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (17, 'image/product_image/sony-xperia-z3-compact-5.jpg', 'Camera 20.7 MP sắc nét, màu sắc trung thực sống động.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (17, 'image/product_image/sony-xperia-z3-compact-6.jpg', 'Dung lượng 2600 mAh cùng chế độ tiết kiệm pin độc quyền của Sony giúp Z3 Compact thuộc top smartphone có pin “trâu” nhất hiện nay.');

INSERT INTO image(gallery_id, name, description) 
	VALUES (18, 'image/product_image/sony-xperia-z-ultra-1.jpg', 'Smartphone đầu tiên có kích thước màn hình cực lớn đến 6.4 inch, độ phân giải Full HD, sử dụng công nghệ Triluminos mang đến hình ảnh cực nét, màu sắc rực rỡ. ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (18, 'image/product_image/sony-xperia-z-ultra-2.jpg', 'Hai mặt bằng kính cường lực chống xước cùng khả năng chống bụi, chống nước giúp máy hoạt động tốt trong nhiều điều kiện khắc nghiệt.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (18, 'image/product_image/sony-xperia-z-ultra-3.jpg', 'Thiết kế sang trọng, chắc chắn, siêu mỏng 6.5mm với các cấu trúc đối xứng và cân bằng giúp người dùng thao tác dễ dàng hơn trên một chiếc smartphone cỡ lớn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (18, 'image/product_image/sony-xperia-z-ultra-4.jpg', 'Camera 8 MP dùng cảm biến Exmor RS của Sony cùng nhiều tính năng tuỳ chỉnh hỗ trợ bạn chụp ảnh sắc nét, màu sắc tươi tắn trong nhiều điều kiện ánh sáng khác nhau.  ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (18, 'image/product_image/sony-xperia-z-ultra-5.jpg', 'Cấu hình 4 nhân 2.2 GHz mạnh mẽ, cải thiện hiệu ứng đồ hoạ giúp bạn chơi game 3D hấp dẫn hơn, lướt web, chạy đa nhiệm mượt mà. ');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (19, 'image/product_image/sony-xperia-t2-ultra-1.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (19, 'image/product_image/sony-xperia-t2-ultra-2.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (19, 'image/product_image/sony-xperia-t2-ultra-3.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (19, 'image/product_image/sony-xperia-t2-ultra-4.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (19, 'image/product_image/sony-xperia-t2-ultra-5.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (19, 'image/product_image/sony-xperia-t2-ultra-6.jpg', '');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (20, 'image/product_image/sony-xperia-m2-aqua-1.jpg', 'Máy vẫn hoạt động bình thường ngay khi bạn dùng dưới trời mưa, làm đổ cà phê vào máy nhờ thiết kế chống nước.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (20, 'image/product_image/sony-xperia-m2-aqua-2.jpg', 'Camera 8 MP, cảm biến Exmor RS giúp ảnh rõ nét, màu sắc sống động như trên máy ảnh chuyên nghiệp và có khả năng chụp ảnh dưới nước khá thú vị');
INSERT INTO image(gallery_id, name, description) 
	VALUES (20, 'image/product_image/sony-xperia-m2-aqua-3.jpg', 'Màn hình qHD 4.8 inch, tấm nền IPS, sử dụng công nghệ hiển thị chuyên nghiệp của Tivi Sony mang lại góc nhìn rộng, màu sắc trung thực');
INSERT INTO image(gallery_id, name, description) 
	VALUES (20, 'image/product_image/sony-xperia-m2-aqua-4.jpg', 'Chơi game, xem clip, chạy đa nhiệm mượt mà với tốc độ phản hồi nhanh nhờ cấu hình lõi tứ mạnh mẽ');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (21, 'image/product_image/sony-xperia-m2-1.jpg', 'Camera 8 MP sử dụng cảm biến Exmor RS, nhiều chế độ chụp ảnh chuyên nghiệp mang đến tấm ảnh rõ nét đến từng chi tiết, màu sắc sống động.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (21, 'image/product_image/sony-xperia-m2-2.jpg', 'Màn hình qHD 4.8 inch, sử dụng công nghệ TV Bravia với màu sắc rực rỡ, hình ảnh sắc nét.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (21, 'image/product_image/sony-xperia-m2-3.jpg', 'Thiết kế đậm chất Sony với bề mặt phẳng mịn màng, bộ khung chắc chắn sang trọng, các chi tiết tinh xảo đến hoàn hảo.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (21, 'image/product_image/sony-xperia-m2-4.jpg', 'Cấu hình lõi tứ hiệu suất cao chạy đa nhiệm mạnh mẽ, lướt web nhanh, chơi game và xem clip mượt mà.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (22, 'image/product_image/sony-xperia-c3-1.jpg', 'Thiết kế siêu mỏng 7.6mm, đường viền giả kim loại chắc chắn, thanh lịch.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (22, 'image/product_image/sony-xperia-c3-2.jpg', 'Chụp ảnh “tự sướng” đẹp hơn với camera trước 5MP hỗ trợ Flash dịu với nhiều chế độ nhận diện nụ cười, làm mịn da, chống rung tay');
INSERT INTO image(gallery_id, name, description) 
	VALUES (22, 'image/product_image/sony-xperia-c3-3.jpg', 'Camera sau 8MP hỗ trợ nhiều chế độ chụp ảnh chuyên nghiệp cho hình ảnh sắc nét, màu sắc trung thực.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (22, 'image/product_image/sony-xperia-c3-4.jpg', 'Màn hình HD 5.5 inch, công nghệ IPS góc nhìn rộng, độ tương phản cao giúp bạn trải nghiệm hình ảnh sắc nét từ mọi góc nhìn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (22, 'image/product_image/sony-xperia-c3-5.jpg', 'Smartphone lõi tứ, RAM 1GB, hệ điều hành Android 4.4 Kitkat giúp máy duyệt web, chơi game mượt mà');
INSERT INTO image(gallery_id, name, description) 
	VALUES (22, 'image/product_image/sony-xperia-c3-6.jpg', 'Kết nối NFC để kết nối với đồng hồ thông minh, tai nghe không dây, TV, thiết bị lưu trữ, chia sẻ với thiết bị khác… chỉ với một chạm.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (23, 'image/product_image/sony-xperia-e1-1.jpg', 'Màn hình 4 inch sắc nét mang đến khả năng hiển thị trung thực, rõ nét để bạn đọc tin tức, chơi game thoải mái, không mỏi mắt.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (23, 'image/product_image/sony-xperia-e1-2.jpg', 'Thiết kế bo tròn mềm mại giúp máy nhỏ gọn trong lòng bàn tay. Phím nguồn đặc trưng của Sony tạo điểm nhấn sang trọng và giúp bạn dễ dàng thao tác.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (23, 'image/product_image/sony-xperia-e1-3.jpg', 'Trang bị công nghệ tăng cường âm thanh hiện đại tái tạo âm thanh to và rõ ràng, mang đến trải nghiệm âm nhạc sống động, trong trẻo và hấp dẫn hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (23, 'image/product_image/sony-xperia-e1-4.jpg', 'Cấu hình 2 nhân, 1.2 GHz mạnh mẽ trong phân khúc giúp mạy chạy đa nhiệm khoẻ, chơi các game hay những ứng dụng phổ thông mượt mà.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (23, 'image/product_image/sony-xperia-e1-5.jpg', 'Pin 1700 mAh cùng với công nghệ tiết kiệm pin STAMINA giúp quản lý pin hiệu quả. Máy có thể chơi game, lướt web trong nhiều giờ mà không lo hết pin.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (24, 'image/product_image/sony-xperia-e3-1.jpg', 'Thiết kế phẳng, vuông vức đặc trưng của Sony mang đến vẻ đẹp sang trọng. Máy nhỏ gọn giúp bạn thao tác dễ dàng bằng một tay.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (24, 'image/product_image/sony-xperia-e3-2.jpg', 'Màn hình 4.5 inch tấm nền IPS hiển thị 16 triệu màu sắc nét, sống động.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (24, 'image/product_image/sony-xperia-e3-3.jpg', 'Camera 5 MP lấy nét nhanh giúp ảnh rõ nét, màu sắc tươi tắn hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (24, 'image/product_image/sony-xperia-e3-4.jpg', 'Cấu hình 4 nhân hỗ trợ lướt web, chạy đa nhiệm mượt mà, chơi game hấp dẫn hơn.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (25, 'image/product_image/nokia-lumia-930-1.jpg', 'Màn hình 5 inch Full HD cực sáng, nổi hơn khung viền nên tạo cảm giác hình ảnh sống động hơn. Mặt kính Gorilla Glass 3 cho khả năng chống xước vượt trội');
INSERT INTO image(gallery_id, name, description) 
	VALUES (25, 'image/product_image/nokia-lumia-930-1.jpg', 'Cấu hình 4 nhân RAM 2GB mạnh mẽ để bạn có thể chơi bất kỳ game hấp dẫn hay ứng dụng làm việc nặng nào mà không lo máy giật, lag');
INSERT INTO image(gallery_id, name, description) 
	VALUES (25, 'image/product_image/nokia-lumia-930-1.jpg', 'Thiết kế nhiều màu sắc, chất liệu nhựa cao cấp được viền kim loại vuông vức nhưng ôm sát lòng bàn tay và vừa vặn để bỏ túi');
INSERT INTO image(gallery_id, name, description) 
	VALUES (25, 'image/product_image/nokia-lumia-930-1.jpg', 'Cài đặt sẵn Windows Phone 8.1với các ô Live Titles luôn cập nhật tin tức mới nhất, tùy chỉnh màn hình theo ý thích giúp điện thoại của bạn cá tính hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (25, 'image/product_image/nokia-lumia-930-1.jpg', 'Camera PureView 20 MP, sử dụng ống kính Carl Zeiss nổi tiếng cho chất lượng ảnh như trên máy ảnh chuyên nghiệp');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (26, 'image/product_image/nokia-lumia-1520-1.jpg', 'Màn hình 6 inch Full HD siêu nhạy,hiển thị sắc nét, màu sắc rực rỡ, không bị chói khi dùn gở ngoài trời và cảm ứng chính xác dù bạn đang đeo găng tay');
INSERT INTO image(gallery_id, name, description) 
	VALUES (26, 'image/product_image/nokia-lumia-1520-2.jpg', 'Máy được trang bị vi xử lý 4 nhân, tốc độ cao 2.2 GHz, chạy mượt mà các game đồ hoạ cao mang đến những trải nghiệm thú vị');
INSERT INTO image(gallery_id, name, description) 
	VALUES (26, 'image/product_image/nokia-lumia-1520-3.jpg', 'Hệ điều hành Windows Phone 8 cập nhật tin tức mới nhất ở các ô Live Titles và tích hợp sẵn ứng dụng MS Office giúp bạn làm việc tiện lợi khi không có máy tính');
INSERT INTO image(gallery_id, name, description) 
	VALUES (26, 'image/product_image/nokia-lumia-1520-4.jpg', 'Ứng dụng Storyteller giúp bạn lưu giữ những câu chuyện của bạn theo thời gian và địa điểm đã đi qua, tích hợp trên bản đồ HERE Maps');
INSERT INTO image(gallery_id, name, description) 
	VALUES (26, 'image/product_image/nokia-lumia-1520-5.jpg', 'Camera 20MP chụp ảnh nhanh, độ nét cao,màu sắc trung thực. Các ứng dụng chỉnh sửa ảnh độc quyền mang đến những tấm ảnh thú vị, ấn tượng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (26, 'image/product_image/nokia-lumia-1520-6.jpg', 'Khả năng bắt tiếng tốt nhờ 4 micro tích hợp sẵn giúp thu được âm thanh đa chiều, trong trẻo, rõ ràng');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (27, 'image/product_image/nokia-lumia-830-1.jpg', 'Sự kết hợp hài hòa giữa khung kim loại và vỏ nhựa mang lại sự sang trọng và cảm giác thoải mái khi sử dụng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (27, 'image/product_image/nokia-lumia-830-2.jpg', 'Camera PureView 10 MP với công nghệ chống rung quang học, chụp ảnh nét, màu sắc trung thực ngay trong điều kiện thiếu sáng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (27, 'image/product_image/nokia-lumia-830-3.jpg', 'Màn hình HD 5 inch sắc nét, tấm nền IPS chống chói hiệu quả, hiển thị tốt ngoài trời.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (27, 'image/product_image/nokia-lumia-830-4.jpg', 'Với cấu hình 4 nhân, RAM 1GB, nhưng với hệ điều hành Windows phone 8.1 denim mới nhất giúp máy chạy mượt mà và ổn định.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (28, 'image/product_image/nokia-lumia-730-dual-sim-1.jpg', 'Thiết kế vuông vức cho cảm giác mạnh mẽ và chắc chắn khi cầm trên tay.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (28, 'image/product_image/nokia-lumia-730-dual-sim-1.jpg', 'Màn hình 4.7 inch, hiển thị sắc nét với mặt kính cường lực Gorilla Glass 3 chống xước cao.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (28, 'image/product_image/nokia-lumia-730-dual-sim-1.jpg', 'Bộ xử lý 4 nhân cho khả năng chạy đa nhiệm tốt, không giật lag khi chơi game, lướt web.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (28, 'image/product_image/nokia-lumia-730-dual-sim-1.jpg', 'Camera trước 5 MP sử dụng ống kính góc rộng giúp chụp ảnh tự sướng với khung hình lớn hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (28, 'image/product_image/nokia-lumia-730-dual-sim-1.jpg', 'Hệ điều hành Windows phone 8.1 phiên bản denim mới nhất giúp máy chạy mượt mà và ổn định.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (29, 'image/product_image/nokia-lumia-625-1.jpg', 'Màn hình 4.7 inch, tấm nền IPS cho góc nhìn 178 độ, màu sắc rực rỡ. Công nghệ cảm ứng siêu nhạy giúp bạn dễ dàng thao tác ngay khi đeo găng tay');
INSERT INTO image(gallery_id, name, description) 
	VALUES (29, 'image/product_image/nokia-lumia-625-2.jpg', 'Thiết kế chắc chắn với mặt lưng mịn màng và các góc bo tròn, ôm sát lòng bàn tay. Bộ vỏ màu sắc trẻ trung khiến bạn nổi bật và cá tính hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (29, 'image/product_image/nokia-lumia-625-3.jpg', 'Camera sau 5 MP cùng phím chụp riêng biệt giúp lấy nét và chụp ảnh nhanh. Ứng dụng Smartcamera tạo nên những tấm ảnh có hiệu ứng thú vị đầy sáng tạo');
INSERT INTO image(gallery_id, name, description) 
	VALUES (29, 'image/product_image/nokia-lumia-625-4.jpg', 'Hệ điều hành Windows 8 giúp bạn cập nhật tin tức mới nhất trên các ô Live Titles hay làm việc mọi lúc mọi nơi với các ứng dụng MS Office tích hợp sẵn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (29, 'image/product_image/nokia-lumia-625-5.jpg', 'Không lo lạc đường với bản đồ HERE Maps, cung cấp lộ trình ngắn nhất, tốt nhất, kể cả khi máy không kết nối internet');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (30, 'image/product_image/nokia-lumia-1320-1.jpg', 'Chơi game hấp dẫn, lướt web thoải mái, xem video ấn tượng hơn với màn hình cỡ lớn 6 inch. Công nghệ IPS giúp màn hình không bị chói khi dùng ngoài trời');
INSERT INTO image(gallery_id, name, description) 
	VALUES (30, 'image/product_image/nokia-lumia-1320-2.jpg', 'Hệ điều hành Windows Phone tích hợp sẵn MS Office, cập nhật tin tức mới nhất trên các ô Live Titles giúp bạn làm việc, giải trí thoải mái khắp mọi nơi.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (30, 'image/product_image/nokia-lumia-1320-3.jpg', 'Thiết kế nổi bật nhờ màu sắc trẻ trung, tươi tắn. Bốn góc bo tròn, bề mặt nhám giúp bạn cầm chiếc máy cỡ lớn chắc chắn và dễ thao tác hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (30, 'image/product_image/nokia-lumia-1320-4.jpg', 'Camera 5 MP cùng các ứng dụng SmartCamera, Creative Studio và Cinemagraph giúp bạn có những tấm ảnh mang phong cách riêng, thú vị và ấn tượng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (30, 'image/product_image/nokia-lumia-1320-5.jpg', 'Bản đồ HERE Maps cung cấp lộ trình tốt nhất, kết hợp Nokia Storyteller sắp xếp các bức ảnh của bạn trên bản đồ, lưu dấu những nơi bạn đã đi qua');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (31, 'image/product_image/', 'Thiết kế trẻ trung màu sắc nổi bật. Máy vừa vuông vức vừa được bo tròn các góc nhẹ nhàng, mặt lưng ôm sát lòng bàn tay giúp bạn thao tác dễ dàng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (31, 'image/product_image/', 'Màn hình 4.5 inch sử dụng tấm nền IPS và mặt kính cường lực Gorilla Glass 3 giúp máy hiển thị sắc nét, rực rỡ và hạn chế bị trầy xước.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (31, 'image/product_image/', 'Camera 5 MP tốc độ lấy nét nhanh kết hợp nhiều hiệu ứng tuỳ chỉnh thú vị, sáng tạo');
INSERT INTO image(gallery_id, name, description) 
	VALUES (31, 'image/product_image/', '2 SIM 2 sóng giúp bạn liên lạc dễ dàng, tiện lợi hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (31, 'image/product_image/', 'Bản đồ HERE MAPS hoạt động ngay khi không có kết nối internet cung cấp lộ trình ngắn nhất, hiệu quả nhất cho bạn.');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (32, 'image/product_image/nokia-lumia-530-1.jpg', 'Smartphone giá rẻ sở hữu cấu hình lõi tứ mang đến khả năng chạy mượt mà các game nặng, lướt web nhanh chóng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (32, 'image/product_image/nokia-lumia-530-2.jpg', 'Phiên bản Windows 8.1 mang đến khả năng soạn thảo văn bản bằng cả VNI và Telex, giúp bạn nhập liệu dễ dàng, chính xác hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (32, 'image/product_image/nokia-lumia-530-3.jpg', 'Tính năng hỗ trợ 2 SIM thông minh có thể chờ và chuyển tiếp cuộc gọi giữa 2 SIM tiện lợi, lên mạng bằng 3G tiết kiệm');
INSERT INTO image(gallery_id, name, description) 
	VALUES (32, 'image/product_image/nokia-lumia-530-4.jpg', 'Thiết kế màu sắc rực rỡ, vỏ nhám chống bám dấu vân tay và mặt lưng bo tròn giúp bạn cầm nắm chắc tay hơn');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (33, 'image/product_image/microsoft-lumia-535-1.jpg', 'Smartphone thương hiệu Microsoft đầu tiên với màn hình 5 inch, cấu hình 4 nhân, và  camera trước và sau đều 5 MP, chụp ảnh tự sướng sắc nét, giàu cảm xúc');
INSERT INTO image(gallery_id, name, description) 
	VALUES (33, 'image/product_image/microsoft-lumia-535-2.jpg', '2 SIM 2 sóng mang đến giải pháp liên lạc thật sự tiết kiệm và tiện lợi');
INSERT INTO image(gallery_id, name, description) 
	VALUES (33, 'image/product_image/microsoft-lumia-535-3.jpg', 'Thiết kế nổi bật, màu sắc rực rỡ gây ấn tượng bởi sự trẻ trung và năng động');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (34, 'image/product_image/asus-zenfone-6-a601-1.jpg', 'Phablet cao cấp nhất của Asus hiện nay, thiết kế lịch lãm, cạnh dưới giả kim loại với vân tròn đồng tâm giúp máy bắt mắt và sang trọng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (34, 'image/product_image/asus-zenfone-6-a601-2.jpg', 'Màn hình 6 inch HD sắc nét, kính cường lực Gorilla Glass 3 hạn chế trầy xước, hỗ trợ hiển thị sắc nét, trong và sáng hơn');
INSERT INTO image(gallery_id, name, description) 
	VALUES (34, 'image/product_image/asus-zenfone-6-a601-3.jpg', 'Chụp ảnh người thân, bạn bè đẹp hơn với camera 13 MP, kết hợp công nghệ PixelMaster chụp tốt hơn trong điều kiện thiếu sáng');
INSERT INTO image(gallery_id, name, description) 
	VALUES (34, 'image/product_image/asus-zenfone-6-a601-4.jpg', 'Trang bị lõi kép, chip Intel, RAM 2 GB mạnh mẽ, Zenfone 6 không gặp trở ngại nào khi chạy những ứng dụng, game nặng hiện nay');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (35, 'image/product_image/asus-zenfone-5-1.jpg', 'Chất liệu khá tốt, mịn màng mang đến cảm giác máy cao cấp so với tầm giá. Mặt lưng bo tròn, phím vật lý có vân tròn giả kim loại sang trọng và bắt mắt');
INSERT INTO image(gallery_id, name, description) 
	VALUES (35, 'image/product_image/asus-zenfone-5-2.jpg', 'Màn hình 5 inch, tấm nền IPS góc nhìn rộng và chống lóa cùng độ phân giải cao giúp bạn lướt web, chơi game hấp dẫn hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (35, 'image/product_image/asus-zenfone-5-3.jpg', 'Máy vận hành mượt mà, mạnh mẽ các ứng dụng phổ biến nhất hiện nay nhờ cấu hình 2 nhân, chip Intel hiệu suất cao');
INSERT INTO image(gallery_id, name, description) 
	VALUES (35, 'image/product_image/asus-zenfone-5-4.jpg', 'Camera 8 MP, công nghệ Pixel Master tăng cường sáng đến 400% giúp chụp ảnh tốt hơn, rõ nét hơn, màu sắc trung thực trong nhiều điều kiện ánh sáng');

INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-1.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-2.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-3.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-4.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-5.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-6.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-7.jpg', '');
INSERT INTO image(gallery_id, name, description) 
	VALUES (36, 'image/product_image/asus-zenfone-4-45-8.jpg', '');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (37, 'image/product_image/asus-zenfone-4-1.jpg', 'Thiết kế nhỏ nhắn, các góc bo tròn, mặt lưng cong ôm sát lòng bàn tay giúp dễ dàng cầm nắm, thao tác');
INSERT INTO image(gallery_id, name, description) 
	VALUES (37, 'image/product_image/asus-zenfone-4-2.jpg', 'Màn hình 4 inch có hiển thị màu sắc tươi tắn, nhiều tùy chỉnh tông màu theo sở thích  nhờ tính năng Splendid  giúp bạn đọc báo, chơi game hấp dẫn hơn ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (37, 'image/product_image/asus-zenfone-4-3.jpg', 'Camera 5 MP chụp ảnh nhanh, sắc nét và có chất lượng vượt trội so với tầm giá');
INSERT INTO image(gallery_id, name, description) 
	VALUES (37, 'image/product_image/asus-zenfone-4-4.jpg', 'Hệ điều hành Android 4.4 tùy biến với giao diện với Zen IU đặc trưng của Asus, thân thiện, dễ sử dụng và hỗ trợ bạn sắp xếp công việc tốt hơn ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (37, 'image/product_image/asus-zenfone-4-5.jpg', '2 SIM 2 sóng giúp bạn liên lạc tiện lợi và tiết kiệm');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (38, 'image/product_image/philips-i928-1.jpg', 'Màn hình Full HD 6 inch, tấm nền IPS chống chói, hiển thị sắc nét');
INSERT INTO image(gallery_id, name, description) 
	VALUES (38, 'image/product_image/philips-i928-2.jpg', 'Thiết kế giả da sang trọng, mỏng và nhẹ dễ dàng bỏ túi');
INSERT INTO image(gallery_id, name, description) 
	VALUES (38, 'image/product_image/philips-i928-3.jpg', 'Cấu hình lõi 8 ấn tượng ở phân khúc tầm trung. Máy lướt web, chạy đa nhiệm mạnh mẽ, “chiến” mượt mà mọi game và ứng dụng nặng.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (38, 'image/product_image/philips-i928-4.jpg', 'Camera chính 13 MP giúp chụp ảnh nhanh, rõ nét. Camera trước 5 MP chụp ảnh tự sướng đẹp hơn.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (38, 'image/product_image/philips-i928-5.jpg', 'Pin khủng 3.000 mAh với công nghệ xenium của Philips tương xứng với màn hình cỡ lớn và cấu hình khỏe, giúp máy hoạt động bền bỉ hơn.');

INSERT INTO image(gallery_id, name, description) 
	VALUES (39, 'image/product_image/philips-i908-1.jpg', 'Vẻ ngoài lịch lãm do chất liệu giả da khá sang trọng. Máy chắc tay, độ hoàn thiện cao như dòng điện thoại cao cấp');
INSERT INTO image(gallery_id, name, description) 
	VALUES (39, 'image/product_image/philips-i908-2.jpg', 'Màn hình 5 inch có độ phân giải Full HD, hiển thị hình ảnh sắc nét, trung thực, chất lượng vượt trội so với đối thủ cùng phân khúc');
INSERT INTO image(gallery_id, name, description) 
	VALUES (39, 'image/product_image/philips-i908-3.jpg', 'Bộ xử lý 8 nhân1.7 Ghz, RAM 2 GB giúp máy không “ngại” bất cứ ứng dụng nặng nào. Chạy đa nhiệm, chơi game đồ hoạ cao mượt mà.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (39, 'image/product_image/philips-i908-4.jpg', 'Sở hữu chiếc camera lên đến 13MP, chụp ảnh sắc nét, giàu chi tiết, góc chụp rộng giúp bạn chụp ảnh đẹp hơn, kể cả khi ánh sáng yếu');
INSERT INTO image(gallery_id, name, description) 
	VALUES (39, 'image/product_image/philips-i908-5.jpg', 'Dung lượng pin cao, cho máy thời lượng hoạt động ấn tượng, sẵn sàng đồng hành cùng bạn đi khắp nơi');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (40, 'image/product_image/philips-xenium-w6610-1.jpg', 'Thiết kế mạnh mẽ, đậm đà cùng mặt sau được phủ một lớp sơn chống bám dính, dễ chịu, giúp máy luôn được sạch sẽ');
INSERT INTO image(gallery_id, name, description) 
	VALUES (40, 'image/product_image/philips-xenium-w6610-2.jpg', 'Màn hình 5 inch thì tấm nền IPS giúp màn hình có được góc nhìn rộng hơn, màu ảnh trong và sáng hơn, thuận tiện cho việc giải trí, nhất là chơi game và xem phim');
INSERT INTO image(gallery_id, name, description) 
	VALUES (40, 'image/product_image/philips-xenium-w6610-3.jpg', 'Chiếc pin Xenium với dung lượng khổng lồ 5300mAh có thể lướt web, đàm thoại bền bỉ  cả ngày');
INSERT INTO image(gallery_id, name, description) 
	VALUES (40, 'image/product_image/philips-xenium-w6610-4.jpg', 'Kết nối 2 SIM cho phép nghe gọi, nhắn tin riêng biệt trên hai sim khác nhau.');
INSERT INTO image(gallery_id, name, description) 
	VALUES (40, 'image/product_image/philips-xenium-w6610-5.jpg', 'Camera 8MP, hỗ trợ đèn Flash trợ sáng, phía trước là camera 2MP chụp khá tốt kể cả với điều kiện thiếu và ngược sáng, chi tiết, màu sắc được tái tạo tốt');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (41, 'image/product_image/philips-s388-1.jpg', 'Thiết kế theo phong cách đặc trưng riêng, màu sắc rất thời trang, có tính di động cao với trọng lượng 136.5g và mỏng chỉ 9.1mm');
INSERT INTO image(gallery_id, name, description) 
	VALUES (41, 'image/product_image/philips-s388-2.jpg', 'Màn hình 4.5 inch các chi tiết hình ảnh có thể được quan sát rõ ràng, màu sắc nổi bật, bắt mắt. Tấm nền IPS cho góc nhìn rộng, chống chói hiệu quả');
INSERT INTO image(gallery_id, name, description) 
	VALUES (41, 'image/product_image/philips-s388-3.jpg', 'Camera 5 MP, hỗ trợ đèn Flash để chụp ảnh rõ nét, đầy đủ sáng trong điều kiện ánh sáng yếu');
INSERT INTO image(gallery_id, name, description) 
	VALUES (41, 'image/product_image/philips-s388-4.jpg', 'Trang bị 2 SIM 2 sóng tiện lợi, liên lạc tiết kiệm');
INSERT INTO image(gallery_id, name, description) 
	VALUES (41, 'image/product_image/philips-s388-5.jpg', 'Cấu hình lõi tứ chạy mượt những ứng dụng hàng ngày, game thông dụng, khá mạnh mẽ trong tầm giá');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (42, 'image/product_image/philips-s308-1.jpg', 'Thiết kế độc đáo với cạnh trên vuông vức nhưng bo cong mềm mại ở cạnh dưới. Thân máy chắc chắn, sang trọng mang đến cảm giác cầm nắm chắc tay');
INSERT INTO image(gallery_id, name, description) 
	VALUES (42, 'image/product_image/philips-s308-2.jpg', 'Màn hình 4 inch hiển thị sắc nét và có mặt kính nằm hơi sâu so với viền máy giúp hạn chế trầy xước, nhất là khi đặt úp điện thoại');
INSERT INTO image(gallery_id, name, description) 
	VALUES (42, 'image/product_image/philips-s308-3.jpg', 'Camera 5 MP, hỗ trợ đèn Flash để chụp ảnh rõ nét, kể cả trong điều kiện ánh sáng yếu');
INSERT INTO image(gallery_id, name, description) 
	VALUES (42, 'image/product_image/philips-s308-4.jpg', 'Trang bị 2 SIM 2 sóng tiện lợi, liên lạc tiết kiệm');
INSERT INTO image(gallery_id, name, description) 
	VALUES (42, 'image/product_image/philips-s308-5.jpg', 'Cấu hình lõi kép chạy mượt những ứng dụng hàng ngày, game thôngdụng, khá mạnh mẽ trong tầm giá');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (43, 'image/product_image/pantech-vega-iron-a870s-1.jpg', 'Thiết kế đẹp và ấn tượng do được gia công tỉ mỉ, khung kim loại nguyên khối, chắc chắn. Một góc máy được vát và tích hợp đèn tín hiệu đầy phá cách');
INSERT INTO image(gallery_id, name, description) 
	VALUES (43, 'image/product_image/pantech-vega-iron-a870s-2.jpg', 'Màn hình 5 inch, tấm nền IPS cùng viền màn hình siêu mỏng cho góc nhìn rộng tối đa, hiển thị sắc nét, độ sáng và tương phản cao giúp sử dụng tốt ngoài trời');
INSERT INTO image(gallery_id, name, description) 
	VALUES (43, 'image/product_image/pantech-vega-iron-a870s-3.jpg', 'Chơi game, lướt web, chạy đa nhiệm không chút trở ngại với bộ xử lý 4 nhân RAM 2 GB');
INSERT INTO image(gallery_id, name, description) 
	VALUES (43, 'image/product_image/pantech-vega-iron-a870s-4.jpg', 'Luôn luôn kết nối với hai viên pin cùng dung lượng 2150mAh');
INSERT INTO image(gallery_id, name, description) 
	VALUES (43, 'image/product_image/pantech-vega-iron-a870s-5.jpg', 'Chụp ảnh và chia sẻ dễ dàng với camera 13 MP hỗ trợ đèn Flash giúp bạn bắt chụp mọi khoảnh khắc nhanh chóng cùng nhiều hiệu ứng chỉnh sửa nhanh, thú vị');
	
INSERT INTO image(gallery_id, name, description) 
	VALUES (44, 'image/product_image/pantech-vega-iron-2-a910s-1.jpg', 'Màn hình 5.3 inch Full HD công nghệ Super AMOLED Plus cho màu nịnh mắt, rực rỡ, góc nhìn rộng, thoải mái');
INSERT INTO image(gallery_id, name, description) 
	VALUES (44, 'image/product_image/pantech-vega-iron-2-a910s-2.jpg', 'Mạnh mẽ với chip xử lý 4 nhân, RAM khủng 3 GB mang đến những trải nghiệm tuyệt vời trên hệ điều hành Android 4.4 Kitkat');
INSERT INTO image(gallery_id, name, description) 
	VALUES (44, 'image/product_image/pantech-vega-iron-2-a910s-3.jpg', 'Camera 13 MP hỗ trợ đèn Flash LED cho khả năng chụp ảnh giàu chi tiết, sắc nét và khả năng chụp thiếu sáng tốt');
INSERT INTO image(gallery_id, name, description) 
	VALUES (44, 'image/product_image/pantech-vega-iron-2-a910s-4.jpg', 'Dung lượng pin khủng 3200 mAh và được tặng kèm thêm 1 viên pin cho phép người dùng chơi game, lướt web cường độ cao cả ngày');
	
-- // INSERT INTO image(gallery_id, name, description) VALUES (3, 'image/product_image/', '');
	
-- ###############################################################################################################
-- Product
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (1, 1, 1, 1, 1, 'Iphone 6 Plus 128GB', 'image/product_icon/iphone-6-plus.jpg', 100, 'Điện thoại thông minh cao cấp.'); -- 1
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (1, 1, 1, 2, 2, 'Iphone 6 128GB', 'image/product_icon/iphone-6.jpg', 100, 'Điện thoại thông minh cao cấp.'); -- 2
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (1, 1, 1, 3, 3, 'Iphone 5s 32GB', 'image/product_icon/iphone-5s.jpg', 100, 'Điện thoại thông minh cao cấp.'); -- 3
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (1, 4, 1, 4, 4, 'Iphone 4s 8GB', 'image/product_icon/iphone-4.jpg', 100, 'Điện thoại thông minh cao cấp.'); -- 4

INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 1, 12, 5, 5, 'Samsung Galaxy Note 4', 'image/product_icon/samsung-galaxy-note-4-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Samsung.'); -- 5
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 1, 12, 6, 6, 'Samsung Galaxy S5 G900', 'image/product_icon/samsung-galaxy-s5-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Samsung.'); -- 6
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 4, 12, 7, 7, 'Samsung Galaxy Note 3', 'image/product_icon/samsung-galaxy-note-3-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Samsung.'); -- 7
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 2, 11, 8, 8, 'Samsung Galaxy V', 'image/product_icon/samsung-galaxy-v-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Samsung.'); -- 8
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 4, 11, 9, 9, 'Samsung GLX Trend Plus S7580', 'image/product_icon/samsung-galaxy-trend-s7560-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Samsung.'); -- 9
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 2, 11, 10, 10, 'Samsung GLX Grand Prime G530', 'image/product_icon/samsung-galaxy-grand-prime-g530-icon.jpg', 100, 'Điện thoại thông minh tầm trung của Samsung.'); -- 10
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 4, 11, 11, 11, 'Samsung Galaxy S4 i9500', 'image/product_icon/Samsung-Galaxy-S4-I9500-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Samsung.'); -- 11
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 4, 11, 12, 12, 'Samsung Galaxy Core 2 G355', 'image/product_icon/samsung-galaxy-core-2-icon.jpg', 100, 'Điện thoại thông minh tầm trung của Samsung.'); -- 12
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (2, 4, 11, 13, 13, 'Samsung Galaxy Win I8552', 'image/product_icon/samsung-galaxy-win-i8552-icon.jpg', 100, 'Điện thoại thông minh tầm trung của Samsung.'); -- 13

INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 1, 6, 14, 14, 'Sony Xperia Z3', 'image/product_icon/sony-xperia-z3-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 14
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 15, 15, 'Sony Xperia Z2', 'image/product_icon/sony-xperia-z2-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 15
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 16, 16, 'Sony Xperia Z1', 'image/product_icon/sony-xperia-z1-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 16
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 1, 6, 17, 17, 'Sony Xperia Z3 Compact', 'image/product_icon/sony-xperia-z3-compact-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 17
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 18, 18, 'Sony Xperia Z Ultra C6802', 'image/product_icon/sony-xperia-z-ultra-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 18
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 19, 19, 'Sony Xperia T2 Ultra', 'image/product_icon/sony-xperia-t2-ultra-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 19
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 20, 20, 'Sony Xperia M2 Aqua', 'image/product_icon/sony-xperia-m2-aqua-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 20
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 21, 21, 'Sony Xperia M2', 'image/product_icon/sony-xpreia-m2-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 21
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 22, 22, 'Sony Xperia C3', 'image/product_icon/sony-xperia-c3-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Sony.'); -- 22
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 23, 23, 'Sony Xperia E1', 'image/product_icon/sony-xperia-e1-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Sony.'); -- 23
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (3, 4, 6, 24, 24, 'Sony Xperia E3', 'image/product_icon/sony-xperia-e3-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Sony.'); -- 24

INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 1, 6, 25, 25, 'Nokia Lumia 930', 'image/product_icon/nokia-lumia-930-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Nokia.'); -- 25
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 1, 6, 26, 26, 'Nokia Lumia 1520', 'image/product_icon/nokia-lumia-1520-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Nokia.'); -- 26
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 1, 6, 27, 27, 'Nokia Lumia 830', 'image/product_icon/nokia-lumia-830-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Nokia.'); -- 27
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 4, 6, 28, 28, 'Nokia Lumia 730 Dual SIM', 'image/product_icon/nokia-lumia-730-dual-sim-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Nokia.'); -- 28
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 4, 6, 29, 29, 'Nokia Lumia 625', 'image/product_icon/nokia-lumia-625-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Nokia.'); -- 29
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 4, 6, 30, 30, 'Nokia Lumia 1320', 'image/product_icon/nokia-lumia-1320-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Nokia.'); -- 30
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 4, 6, 31, 31, 'Nokia Lumia 630', 'image/product_icon/nokia-lumia-630-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Nokia.'); -- 31
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (4, 2, 6, 32, 32, 'Nokia Lumia 530', 'image/product_icon/nokia-lumia-530-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Nokia.'); -- 32
	
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (5, 1, 6, 33, 33, 'Microsoft Lumia 535', 'image/product_icon/microsoft-lumia-535-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Microsoft.'); -- 33
	
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (17, 1, 6, 34, 34, 'Asus Zenfone 6', 'image/product_icon/asus-zenfone-6-a601-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Asus.'); -- 34
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (17, 1, 6, 35, 35, 'Asus Zenfone 5', 'image/product_icon/asus-zenfone-5-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Asus.'); -- 35
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (17, 1, 6, 36, 36, 'Asus Zenfone 4 A450', 'image/product_icon/asus-zenfone-4-45-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Asus.'); -- 36
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (17, 1, 6, 37, 37, 'Asus Zenfone 4', 'image/product_icon/asus-zenfone-4-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Asus.'); -- 37
	
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (8, 4, 6, 38, 38, 'Philips i928', 'image/product_icon/philips-i928-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Philips.'); -- 38
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (8, 4, 6, 39, 39, 'Philips i908', 'image/product_icon/philips-i908-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Philips.'); -- 39
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (8, 4, 6, 40, 40, 'Philips Xenium W6610', 'image/product_icon/philips-xenium-w6610-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Philips.'); -- 40	
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (8, 2, 6, 41, 41, 'Philips S388', 'image/product_icon/philips-s388-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Philips.'); -- 41
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (8, 4, 6, 42, 42, 'Philips S308', 'image/product_icon/philips-s308-icon.jpg', 100, 'Điện thoại thông minh giá rẻ của Philips.'); -- 42
	
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (14, 4, 6, 43, 43, 'Pantech Vega Iron', 'image/product_icon/pantech-vega-iron-a870s-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Pantech.'); -- 43
INSERT INTO product(producer_id, status_id, promotion_id, price_id, gallery_id, name, icon, stock_quantity, description)
    VALUES (14, 4, 6, 44, 44, 'Pantech Vega Iron 2', 'image/product_icon/pantech-vega-iron-2-a910s-icon.jpg', 100, 'Điện thoại thông minh cao cấp của Pantech.'); -- 44
	
-- ###############################################################################################################
-- Category products
INSERT INTO category_product(category_id, product_id) VALUES (1, 1);
INSERT INTO category_product(category_id, product_id) VALUES (1, 2);
INSERT INTO category_product(category_id, product_id) VALUES (1, 3);
INSERT INTO category_product(category_id, product_id) VALUES (1, 4);
INSERT INTO category_product(category_id, product_id) VALUES (8, 1); -- Apple (iPhone)
INSERT INTO category_product(category_id, product_id) VALUES (8, 2);
INSERT INTO category_product(category_id, product_id) VALUES (8, 3);
INSERT INTO category_product(category_id, product_id) VALUES (8, 4);

INSERT INTO category_product(category_id, product_id) VALUES (1, 5);
INSERT INTO category_product(category_id, product_id) VALUES (1, 6);
INSERT INTO category_product(category_id, product_id) VALUES (1, 7);
INSERT INTO category_product(category_id, product_id) VALUES (1, 8);
INSERT INTO category_product(category_id, product_id) VALUES (1, 9);
INSERT INTO category_product(category_id, product_id) VALUES (1, 10);
INSERT INTO category_product(category_id, product_id) VALUES (1, 11);
INSERT INTO category_product(category_id, product_id) VALUES (1, 12);
INSERT INTO category_product(category_id, product_id) VALUES (1, 13);
INSERT INTO category_product(category_id, product_id) VALUES (9, 5); -- Samsung
INSERT INTO category_product(category_id, product_id) VALUES (9, 6);
INSERT INTO category_product(category_id, product_id) VALUES (9, 7);
INSERT INTO category_product(category_id, product_id) VALUES (9, 8);
INSERT INTO category_product(category_id, product_id) VALUES (9, 9);
INSERT INTO category_product(category_id, product_id) VALUES (9, 10);
INSERT INTO category_product(category_id, product_id) VALUES (9, 11);
INSERT INTO category_product(category_id, product_id) VALUES (9, 12);
INSERT INTO category_product(category_id, product_id) VALUES (9, 13);

INSERT INTO category_product(category_id, product_id) VALUES (1, 14);
INSERT INTO category_product(category_id, product_id) VALUES (1, 15);
INSERT INTO category_product(category_id, product_id) VALUES (1, 16);
INSERT INTO category_product(category_id, product_id) VALUES (1, 17);
INSERT INTO category_product(category_id, product_id) VALUES (1, 18);
INSERT INTO category_product(category_id, product_id) VALUES (1, 19);
INSERT INTO category_product(category_id, product_id) VALUES (1, 20);
INSERT INTO category_product(category_id, product_id) VALUES (1, 21);
INSERT INTO category_product(category_id, product_id) VALUES (1, 22);
INSERT INTO category_product(category_id, product_id) VALUES (1, 23);
INSERT INTO category_product(category_id, product_id) VALUES (1, 24);
INSERT INTO category_product(category_id, product_id) VALUES (12, 14); -- Sony
INSERT INTO category_product(category_id, product_id) VALUES (12, 15);
INSERT INTO category_product(category_id, product_id) VALUES (12, 16);
INSERT INTO category_product(category_id, product_id) VALUES (12, 17);
INSERT INTO category_product(category_id, product_id) VALUES (12, 18);
INSERT INTO category_product(category_id, product_id) VALUES (12, 19);
INSERT INTO category_product(category_id, product_id) VALUES (12, 20);
INSERT INTO category_product(category_id, product_id) VALUES (12, 21);
INSERT INTO category_product(category_id, product_id) VALUES (12, 22);
INSERT INTO category_product(category_id, product_id) VALUES (12, 23);
INSERT INTO category_product(category_id, product_id) VALUES (12, 24);

INSERT INTO category_product(category_id, product_id) VALUES (1, 25);
INSERT INTO category_product(category_id, product_id) VALUES (1, 26);
INSERT INTO category_product(category_id, product_id) VALUES (1, 27);
INSERT INTO category_product(category_id, product_id) VALUES (1, 28);
INSERT INTO category_product(category_id, product_id) VALUES (1, 29);
INSERT INTO category_product(category_id, product_id) VALUES (1, 30);
INSERT INTO category_product(category_id, product_id) VALUES (1, 31);
INSERT INTO category_product(category_id, product_id) VALUES (1, 32);
INSERT INTO category_product(category_id, product_id) VALUES (10, 25); -- Nokia
INSERT INTO category_product(category_id, product_id) VALUES (10, 26);
INSERT INTO category_product(category_id, product_id) VALUES (10, 27);
INSERT INTO category_product(category_id, product_id) VALUES (10, 28);
INSERT INTO category_product(category_id, product_id) VALUES (10, 29);
INSERT INTO category_product(category_id, product_id) VALUES (10, 30);
INSERT INTO category_product(category_id, product_id) VALUES (10, 31);
INSERT INTO category_product(category_id, product_id) VALUES (10, 32);

INSERT INTO category_product(category_id, product_id) VALUES (1, 33);
INSERT INTO category_product(category_id, product_id) VALUES (21, 33); -- Microsoft

INSERT INTO category_product(category_id, product_id) VALUES (1, 34);
INSERT INTO category_product(category_id, product_id) VALUES (1, 35);
INSERT INTO category_product(category_id, product_id) VALUES (1, 36);
INSERT INTO category_product(category_id, product_id) VALUES (1, 37);
INSERT INTO category_product(category_id, product_id) VALUES (13, 34); -- Asus (Zenfone)
INSERT INTO category_product(category_id, product_id) VALUES (13, 35);
INSERT INTO category_product(category_id, product_id) VALUES (13, 36);
INSERT INTO category_product(category_id, product_id) VALUES (13, 37);

INSERT INTO category_product(category_id, product_id) VALUES (1, 38);
INSERT INTO category_product(category_id, product_id) VALUES (1, 39);
INSERT INTO category_product(category_id, product_id) VALUES (1, 40);
INSERT INTO category_product(category_id, product_id) VALUES (1, 41);
INSERT INTO category_product(category_id, product_id) VALUES (1, 42);
INSERT INTO category_product(category_id, product_id) VALUES (15, 38); -- Philips
INSERT INTO category_product(category_id, product_id) VALUES (15, 39);
INSERT INTO category_product(category_id, product_id) VALUES (15, 40);
INSERT INTO category_product(category_id, product_id) VALUES (15, 41);
INSERT INTO category_product(category_id, product_id) VALUES (15, 42);

INSERT INTO category_product(category_id, product_id) VALUES (1, 43);
INSERT INTO category_product(category_id, product_id) VALUES (1, 44);
INSERT INTO category_product(category_id, product_id) VALUES (20, 43); -- Pantech
INSERT INTO category_product(category_id, product_id) VALUES (20, 44);

-- ###############################################################################################################
-- Carts
INSERT INTO cart(id) VALUES (1); -- 1
INSERT INTO cart(id) VALUES (2); -- 2

-- ###############################################################################################################
-- Cart products
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (1, 1, 1);
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (1, 2, 1);
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (2, 3, 1);
INSERT INTO cart_product(cart_id, product_id, quantity) VALUES (2, 4, 1);

-- ###############################################################################################################
-- Users
INSERT INTO os_user(group_id, cart_id, username, password, full_name, address, phone, email)
    VALUES (2, 1, 'thanh', 'thanh', 'Phan Lê Thanh', '181 An Binh, P.7, Q.5, TP.HCM', '01657776661', 'phanlethanh93@gmail.com'); -- 3
INSERT INTO os_user(group_id, cart_id, username, password, full_name, address, phone, email)
    VALUES (2, 2, 'thang', 'thang', 'Tran Viet Thang', '302/126C Nguyen Duy, P.9, Q.8, TP.HCM', '01658884442', 'thangviet1206@gmail.com'); -- 4

-- ###############################################################################################################
-- Orders
INSERT INTO os_order(user_id, status_id, transport_fee_id, tax_id, address, phone)
    VALUES (3, 7, 1, 1, '181 An Binh, P.7, Q.5, TP.HCM', '01657776661'); -- 1
INSERT INTO os_order(user_id, status_id, transport_fee_id, tax_id, address, phone)
    VALUES (4, 7, 1, 1, '302/126C Nguyen Duy, P.9, Q.8, TP.HCM', '01658884442'); -- 2

-- ###############################################################################################################
-- Order details
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (1, 1, 1, 25590000); -- 1
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (2, 1, 1, 22990000); -- 2
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (3, 2, 1, 15990000); -- 3
INSERT INTO os_order_detail( product_id, order_id, quantity, price)
    VALUES (4, 2, 1, 8390000); -- 4