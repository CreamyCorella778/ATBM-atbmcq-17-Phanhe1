-- Chay trong SQL Developer de tao du lieu, chay voi atbm_user
create table sach (
ma_sach number,
ma_thu_vien number,
ten_sach nvarchar2(50),
loai_sach number,
primary key(ma_sach)
);

create table loai_sach (
ma_loai_sach number,
ten_loai_sach nvarchar2(50),
primary key(ma_loai_sach)
);

create table thu_vien (
ma_thu_vien number,
ten_thu_vien nvarchar2(50),
primary key(ma_thu_vien)
);

create table doc_gia (
ma_doc_gia number,
ho_ten nvarchar2(50),
cmnd char(12),
sdt char(10),
ngay_sinh date,
primary key(ma_doc_gia)
);

create table nhan_vien (
ma_nhan_vien number,
ma_thu_vien number,
loai_nhan_vien number,
ho_ten nvarchar2(50),
ngay_sinh date,
sdt char(10),
email nvarchar2(50),
luong float,
primary key(ma_nhan_vien)
);

create table loai_nhan_vien (
ma_loai_nhan_vien number,
ten_loai_nhan_vien nvarchar2(50),
primary key (ma_loai_nhan_vien)
);

create table phieu_muon (
ma_phieu_muon number,
ma_thu_vien number,
ma_doc_gia number,
thoi_gian date,
so_luong number,
ma_thu_thu number,
primary key(ma_phieu_muon)
);

create table chi_tiet_phieu_muon (
ma_phieu_muon number,
ma_sach number,
so_luong number,
primary key(ma_phieu_muon, ma_sach)
);

alter table sach add constraint fk_loai_sach foreign key (loai_sach) references loai_sach(ma_loai_sach);
alter table sach add constraint fk_sach_ma_thu_vien foreign key (ma_thu_vien) references thu_vien(ma_thu_vien);
alter table nhan_vien add constraint fk_nhan_vien_ma_thu_vien foreign key (ma_thu_vien) references thu_vien(ma_thu_vien);
alter table nhan_vien add constraint fk_loai_nhan_vien foreign key (loai_nhan_vien) references loai_nhan_vien(ma_loai_nhan_vien);
alter table phieu_muon add constraint fk_phieu_muon_ma_thu_vien foreign key (ma_thu_vien) references thu_vien(ma_thu_vien);
alter table phieu_muon add constraint fk_ma_doc_gia foreign key (ma_doc_gia) references doc_gia(ma_doc_gia);
alter table phieu_muon add constraint fk_ma_thu_thu foreign key (ma_thu_thu) references nhan_vien(ma_nhan_vien);
alter table chi_tiet_phieu_muon add constraint fk_ma_phieu_muon foreign key (ma_phieu_muon) references phieu_muon(ma_phieu_muon);
alter table chi_tiet_phieu_muon add constraint fk_ma_sach foreign key (ma_sach) references sach(ma_sach);


-- 4.2: Viết scrip nhập dữ liệu cho cơ sở dữ liệu.
INSERT INTO thu_vien (ma_thu_vien, ten_thu_vien) VALUES (1, N'Thư viện Quốc gia Việt Nam');
INSERT INTO thu_vien (ma_thu_vien, ten_thu_vien) VALUES (2, N'Thư viện Siêu Quốc gia Việt Nam');
INSERT INTO thu_vien (ma_thu_vien, ten_thu_vien) VALUES (3, N'Thư viện Đại gia Việt Nam');

INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (1, N'Nhân viên thủ thư');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (2, N'Nhân viên quản lý');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (3, N'Nhân viên phục vụ bạn đọc');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (4, N'Chuyên viên bảo quản');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (5, N'Cán bộ hướng dẫn');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (6, N'Kỹ thuật viên thư viện');

INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (1, N'Sách giáo khoa');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (2, N'Giáo trình đại học');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (3, N'Tài liệu tham khảo');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (4, N'Tiểu thuyết');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (5, N'Truyện ngắn');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (6, N'Thơ');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (7, N'Văn học dân gian');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (8, N'Văn học nước ngoài');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (9, N'Khoa học tự nhiên');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (10, N'Khoa học xã hội');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (11, N'Công nghệ thông tin');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (12, N'Y học');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (13, N'Nông nghiệp');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (14, N'Lịch sử Việt Nam');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (15, N'Lịch sử thế giới');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (16, N'Địa lý Việt Nam');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (17, N'Địa lý thế giới');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (18, N'Kinh tế học');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (19, N'Quản trị kinh doanh');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (20, N'Pháp luật Việt Nam');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (21, N'Luật quốc tế');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (22, N'Mỹ thuật');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (23, N'Âm nhạc');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (24, N'Kiến trúc');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (25, N'Sách dạy nấu ăn');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (26, N'Tâm lý học');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (27, N'Sách kỹ năng sống');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (28, N'Sách phát triển bản thân');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (29, N'Truyện tranh thiếu nhi');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (30, N'Sách khoa học cho trẻ em');

INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (1, 1, N'Đại Việt sử ký toàn thư', 14);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (2, 1, N'Truyện Kiều', 6);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (3, 1, N'Luật Dân sự Việt Nam', 20);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (4, 1, N'Địa lý tự nhiên Việt Nam', 16);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (5, 1, N'Từ điển Bách khoa Việt Nam', 3);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (6, 1, N'Văn học dân gian Việt Nam', 7);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (7, 1, N'Kinh tế Việt Nam 2023', 18);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (8, 1, N'Kiến trúc cổ Việt Nam', 24);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (9, 1, N'Y học cổ truyền Việt Nam', 12);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (10, 1, N'Làng nghề truyền thống Việt Nam', 10);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (11, 2, N'Khoa học dữ liệu cơ bản', 11);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (12, 2, N'Lịch sử Sài Gòn - TP.HCM', 14);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (13, 2, N'Kỹ năng lãnh đạo', 27);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (14, 2, N'Ẩm thực Nam Bộ', 25);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (15, 2, N'Phát triển web với React', 11);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (16, 2, N'Kinh tế số', 18);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (17, 2, N'Tâm lý học đám đông', 26);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (18, 2, N'Nghệ thuật giao tiếp', 27);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (19, 2, N'Y học hiện đại', 12);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (20, 2, N'Kiến trúc đương đại', 24);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (21, 3, N'Giáo trình Toán cao cấp', 2);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (22, 3, N'Vật lý đại cương', 9);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (23, 3, N'Nguyên lý kế toán', 19);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (24, 3, N'Lập trình Python', 11);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (25, 3, N'Văn học Anh thế kỷ 19', 8);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (26, 3, N'Giáo trình Luật Hiến pháp', 20);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (27, 3, N'Phương pháp nghiên cứu khoa học', 10);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (28, 3, N'Hóa học hữu cơ', 9);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (29, 3, N'Kinh tế vi mô', 18);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (30, 3, N'Lịch sử triết học phương Tây', 15);

INSERT INTO doc_gia VALUES (1, N'Nguyễn Văn An', '001200000001', '0912345678', TO_DATE('15/05/1998', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (2, N'Trần Thị Bình', '001200000002', '0912345679', TO_DATE('22/08/1999', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (3, N'Lê Hoàng Cường', '001200000003', '0912345680', TO_DATE('03/01/2000', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (4, N'Phạm Thúy Dung', '001200000004', '0912345681', TO_DATE('14/07/2001', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (5, N'Hoàng Văn Đạt', '001200000005', '0912345682', TO_DATE('25/11/2002', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (6, N'Vũ Thị Hương', '001200000006', '0912345683', TO_DATE('30/04/1985', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (7, N'Đặng Văn Khải', '001200000007', '0912345684', TO_DATE('12/09/1988', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (8, N'Bùi Ngọc Linh', '001200000008', '0912345685', TO_DATE('08/03/1990', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (9, N'Mai Văn Minh', '001200000009', '0912345686', TO_DATE('19/12/1982', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (10, N'Lý Thị Nga', '001200000010', '0912345687', TO_DATE('05/06/1979', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (11, N'Ngô Văn Phúc', '001200000011', '0912345688', TO_DATE('17/10/1972', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (12, N'Đỗ Thị Quỳnh', '001200000012', '0912345689', TO_DATE('29/02/1968', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (13, N'Trương Văn Sơn', '001200000013', '0912345690', TO_DATE('11/08/1965', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (14, N'Phan Thị Tuyết', '001200000014', '0912345691', TO_DATE('23/05/1970', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (15, N'Lâm Văn Uyên', '001200000015', '0912345692', TO_DATE('07/12/1963', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (16, N'Nguyễn Thành Vinh', '001200000016', '0912345693', TO_DATE('09/04/2003', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (17, N'Trần Khánh Vy', '001200000017', '0912345694', TO_DATE('18/09/2004', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (18, N'Lê Minh Xuân', '001200000018', '0912345695', TO_DATE('27/07/2005', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (19, N'Hoàng Thị Yến', '001200000019', '0912345696', TO_DATE('14/02/2002', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (20, N'Phùng Văn Đại', '001200000020', '0912345697', TO_DATE('03/11/2001', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (21, N'Vương Thị Anh', '001200000021', '0912345698', TO_DATE('16/03/1987', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (22, N'Trịnh Văn Bảo', '001200000022', '0912345699', TO_DATE('24/06/1984', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (23, N'Chu Thị Cẩm', '001200000023', '0912345700', TO_DATE('01/09/1980', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (24, N'Hồ Văn Dũng', '001200000024', '0912345701', TO_DATE('12/05/1978', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (25, N'Dương Thị Hạnh', '001200000025', '0912345702', TO_DATE('28/10/1983', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (26, N'Đinh Văn Hiếu', '001200000026', '0912345703', TO_DATE('13/07/1975', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (27, N'Lưu Thị Kim', '001200000027', '0912345704', TO_DATE('20/01/1977', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (28, N'Triệu Văn Long', '001200000028', '0912345705', TO_DATE('06/12/1969', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (29, N'Võ Thị My', '001200000029', '0912345706', TO_DATE('22/04/1981', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (30, N'Kim Văn Nam', '001200000030', '0912345707', TO_DATE('15/08/1976', 'DD/MM/YYYY'));

INSERT INTO nhan_vien VALUES (1, 1, 1, N'Nguyễn Thị Thu Hà', TO_DATE('15/05/1985', 'DD/MM/YYYY'), '0987654321', N'thuha@tvqg.vn', 12000000);
INSERT INTO nhan_vien VALUES (2, 1, 2, N'Trần Văn Bảo', TO_DATE('22/08/1988', 'DD/MM/YYYY'), '0987654322', N'vanbao@tvqg.vn', 11000000);
INSERT INTO nhan_vien VALUES (3, 1, 1, N'Lê Thị Minh Ngọc', TO_DATE('03/01/1990', 'DD/MM/YYYY'), '0987654323', N'minhngoc@tvqg.vn', 9500000);
INSERT INTO nhan_vien VALUES (4, 1, 2, N'Phạm Đức Cường', TO_DATE('14/07/1982', 'DD/MM/YYYY'), '0987654324', N'duccuong@tvqg.vn', 12500000);
INSERT INTO nhan_vien VALUES (5, 1, 3, N'Hoàng Thị Lan Anh', TO_DATE('25/11/1992', 'DD/MM/YYYY'), '0987654325', N'lananh@tvqg.vn', 9000000);
INSERT INTO nhan_vien VALUES (6, 1, 4, N'Vũ Văn Đạt', TO_DATE('30/04/1987', 'DD/MM/YYYY'), '0987654326', N'vandat@tvqg.vn', 11500000);
INSERT INTO nhan_vien VALUES (7, 1, 6, N'Đặng Thị Hương', TO_DATE('12/09/1991', 'DD/MM/YYYY'), '0987654327', N'thihuong@tvqg.vn', 9800000);
INSERT INTO nhan_vien VALUES (8, 1, 5, N'Bùi Ngọc Sơn', TO_DATE('08/03/1980', 'DD/MM/YYYY'), '0987654328', N'ngocson@tvqg.vn', 13000000);
INSERT INTO nhan_vien VALUES (9, 1, 1, N'Mai Thị Thuỷ', TO_DATE('19/12/1989', 'DD/MM/YYYY'), '0987654329', N'thithuy@tvqg.vn', 10500000);
INSERT INTO nhan_vien VALUES (10, 2, 3, N'Lý Văn Khánh', TO_DATE('17/10/1986', 'DD/MM/YYYY'), '0987654330', N'vankhanh@sqg.vn', 10000000);
INSERT INTO nhan_vien VALUES (11, 2, 4, N'Ngô Thị Quỳnh', TO_DATE('29/02/1984', 'DD/MM/YYYY'), '0987654331', N'thiquynh@sqg.vn', 11500000);
INSERT INTO nhan_vien VALUES (12, 2, 1, N'Đỗ Minh Sáng', TO_DATE('11/08/1993', 'DD/MM/YYYY'), '0987654332', N'minhsang@sqg.vn', 9200000);
INSERT INTO nhan_vien VALUES (13, 2, 2, N'Trương Thị Tuyết', TO_DATE('23/05/1981', 'DD/MM/YYYY'), '0987654333', N'thituyet@sqg.vn', 12500000);
INSERT INTO nhan_vien VALUES (14, 2, 2, N'Phan Văn Uy', TO_DATE('07/12/1987', 'DD/MM/YYYY'), '0987654334', N'vanuy@sqg.vn', 10500000);
INSERT INTO nhan_vien VALUES (15, 2, 1, N'Lâm Thị Vân', TO_DATE('09/04/1989', 'DD/MM/YYYY'), '0987654335', N'thivan@sqg.vn', 11800000);
INSERT INTO nhan_vien VALUES (16, 2, 1, N'Vương Minh Xuân', TO_DATE('18/09/1990', 'DD/MM/YYYY'), '0987654336', N'minhxuan@sqg.vn', 9500000);
INSERT INTO nhan_vien VALUES (17, 2, 5, N'Trịnh Ngọc Yến', TO_DATE('27/07/1983', 'DD/MM/YYYY'), '0987654337', N'ngocyen@sqg.vn', 12200000);
INSERT INTO nhan_vien VALUES (18, 2, 6, N'Chu Văn An', TO_DATE('14/02/1985', 'DD/MM/YYYY'), '0987654338', N'vanan@sqg.vn', 10800000);
INSERT INTO nhan_vien VALUES (19, 3, 5, N'Hồ Thị Bích', TO_DATE('16/03/1988', 'DD/MM/YYYY'), '0987654339', N'thibich@dg.vn', 9800000);
INSERT INTO nhan_vien VALUES (20, 3, 6, N'Dương Văn Cảnh', TO_DATE('24/06/1982', 'DD/MM/YYYY'), '0987654340', N'vancanh@dg.vn', 11200000);
INSERT INTO nhan_vien VALUES (21, 3, 5, N'Đinh Thị Diệu', TO_DATE('01/09/1991', 'DD/MM/YYYY'), '0987654341', N'thidieu@dg.vn', 10200000);
INSERT INTO nhan_vien VALUES (22, 3, 1, N'Lưu Văn Giang', TO_DATE('12/05/1980', 'DD/MM/YYYY'), '0987654342', N'vangiang@dg.vn', 12000000);
INSERT INTO nhan_vien VALUES (23, 3, 1, N'Triệu Thị Hoa', TO_DATE('28/10/1987', 'DD/MM/YYYY'), '0987654343', N'thihoa@dg.vn', 10500000);
INSERT INTO nhan_vien VALUES (24, 3, 1, N'Võ Minh Khoa', TO_DATE('13/07/1984', 'DD/MM/YYYY'), '0987654344', N'minhkhoa@dg.vn', 11500000);
INSERT INTO nhan_vien VALUES (25, 3, 2, N'Kim Thị Lan', TO_DATE('20/01/1989', 'DD/MM/YYYY'), '0987654345', N'thilan@dg.vn', 9900000);
INSERT INTO nhan_vien VALUES (26, 3, 2, N'Nguyễn Văn Long', TO_DATE('06/12/1983', 'DD/MM/YYYY'), '0987654346', N'vanlong@dg.vn', 12500000);
INSERT INTO nhan_vien VALUES (27, 3, 4, N'Trần Thị My', TO_DATE('22/04/1986', 'DD/MM/YYYY'), '0987654347', N'thimy@dg.vn', 10700000);

INSERT INTO phieu_muon VALUES (1, 1, 3, TO_DATE('10/01/2023', 'DD/MM/YYYY'), 2, 1);
INSERT INTO phieu_muon VALUES (2, 1, 7, TO_DATE('15/02/2023', 'DD/MM/YYYY'), 1, 3);
INSERT INTO phieu_muon VALUES (3, 1, 12, TO_DATE('20/03/2023', 'DD/MM/YYYY'), 3, 9);
INSERT INTO phieu_muon VALUES (4, 1, 5, TO_DATE('05/04/2023', 'DD/MM/YYYY'), 2, 12);
INSERT INTO phieu_muon VALUES (5, 1, 9, TO_DATE('12/05/2023', 'DD/MM/YYYY'), 1, 15);
INSERT INTO phieu_muon VALUES (6, 2, 14, TO_DATE('18/01/2023', 'DD/MM/YYYY'), 2, 16);
INSERT INTO phieu_muon VALUES (7, 2, 18, TO_DATE('22/02/2023', 'DD/MM/YYYY'), 1, 12);
INSERT INTO phieu_muon VALUES (8, 2, 21, TO_DATE('03/03/2023', 'DD/MM/YYYY'), 3, 15);
INSERT INTO phieu_muon VALUES (9, 2, 25, TO_DATE('09/04/2023', 'DD/MM/YYYY'), 2, 16);
INSERT INTO phieu_muon VALUES (10, 2, 30, TO_DATE('15/05/2023', 'DD/MM/YYYY'), 1, 12);
INSERT INTO phieu_muon VALUES (11, 3, 2, TO_DATE('11/01/2023', 'DD/MM/YYYY'), 2, 12);
INSERT INTO phieu_muon VALUES (12, 3, 8, TO_DATE('16/02/2023', 'DD/MM/YYYY'), 1, 22);
INSERT INTO phieu_muon VALUES (13, 3, 16, TO_DATE('21/03/2023', 'DD/MM/YYYY'), 3, 24);
INSERT INTO phieu_muon VALUES (14, 3, 22, TO_DATE('06/04/2023', 'DD/MM/YYYY'), 2, 22);
INSERT INTO phieu_muon VALUES (15, 3, 28, TO_DATE('14/05/2023', 'DD/MM/YYYY'), 1, 23);

INSERT INTO chi_tiet_phieu_muon VALUES (1, 1, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (1, 3, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (2, 5, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (3, 2, 1); 
INSERT INTO chi_tiet_phieu_muon VALUES (3, 4, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (3, 6, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (4, 7, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (4, 9, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (5, 10, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (6, 11, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (6, 13, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (7, 15, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (8, 12, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (8, 14, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (8, 16, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (9, 17, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (9, 19, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (10, 20, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (11, 21, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (11, 23, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (12, 25, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (13, 22, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (13, 24, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (13, 26, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (14, 27, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (14, 29, 1);
INSERT INTO chi_tiet_phieu_muon VALUES (15, 30, 1); 