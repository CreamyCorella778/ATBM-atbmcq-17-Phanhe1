DROP TABLE chi_tiet_phieu_muon CASCADE CONSTRAINTS;
DROP TABLE phieu_muon CASCADE CONSTRAINTS;
DROP TABLE sach CASCADE CONSTRAINTS;
DROP TABLE thu_vien CASCADE CONSTRAINTS;
DROP TABLE loai_sach CASCADE CONSTRAINTS;
DROP TABLE doc_gia CASCADE CONSTRAINTS;
DROP TABLE nhan_vien CASCADE CONSTRAINTS;
DROP TABLE loai_nhan_vien CASCADE CONSTRAINTS;

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


-- 4.2: Vi?t scrip nh?p d? li?u cho c? s? d? li?u.
INSERT INTO thu_vien (ma_thu_vien, ten_thu_vien) VALUES (1, N'Th? vi?n Qu?c gia Vi?t Nam');
INSERT INTO thu_vien (ma_thu_vien, ten_thu_vien) VALUES (2, N'Th? vi?n Siêu Qu?c gia Vi?t Nam');
INSERT INTO thu_vien (ma_thu_vien, ten_thu_vien) VALUES (3, N'Th? vi?n ??i gia Vi?t Nam');

INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (1, N'Nhân viên th? th?');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (2, N'Nhân viên qu?n lý');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (3, N'Nhân viên ph?c v? b?n ??c');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (4, N'Chuyên viên b?o qu?n');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (5, N'Cán b? h??ng d?n');
INSERT INTO loai_nhan_vien (ma_loai_nhan_vien, ten_loai_nhan_vien) VALUES (6, N'K? thu?t viên th? vi?n');

INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (1, N'Sách giáo khoa');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (2, N'Giáo trình ??i h?c');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (3, N'Tài li?u tham kh?o');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (4, N'Ti?u thuy?t');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (5, N'Truy?n ng?n');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (6, N'Th?');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (7, N'V?n h?c dân gian');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (8, N'V?n h?c n??c ngoài');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (9, N'Khoa h?c t? nhiên');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (10, N'Khoa h?c xã h?i');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (11, N'Công ngh? thông tin');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (12, N'Y h?c');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (13, N'Nông nghi?p');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (14, N'L?ch s? Vi?t Nam');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (15, N'L?ch s? th? gi?i');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (16, N'??a lý Vi?t Nam');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (17, N'??a lý th? gi?i');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (18, N'Kinh t? h?c');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (19, N'Qu?n tr? kinh doanh');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (20, N'Pháp lu?t Vi?t Nam');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (21, N'Lu?t qu?c t?');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (22, N'M? thu?t');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (23, N'Âm nh?c');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (24, N'Ki?n trúc');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (25, N'Sách d?y n?u ?n');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (26, N'Tâm lý h?c');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (27, N'Sách k? n?ng s?ng');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (28, N'Sách phát tri?n b?n thân');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (29, N'Truy?n tranh thi?u nhi');
INSERT INTO loai_sach (ma_loai_sach, ten_loai_sach) VALUES (30, N'Sách khoa h?c cho tr? em');

INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (1, 1, N'??i Vi?t s? ký toàn th?', 14);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (2, 1, N'Truy?n Ki?u', 6);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (3, 1, N'Lu?t Dân s? Vi?t Nam', 20);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (4, 1, N'??a lý t? nhiên Vi?t Nam', 16);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (5, 1, N'T? ?i?n Bách khoa Vi?t Nam', 3);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (6, 1, N'V?n h?c dân gian Vi?t Nam', 7);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (7, 1, N'Kinh t? Vi?t Nam 2023', 18);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (8, 1, N'Ki?n trúc c? Vi?t Nam', 24);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (9, 1, N'Y h?c c? truy?n Vi?t Nam', 12);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (10, 1, N'Làng ngh? truy?n th?ng Vi?t Nam', 10);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (11, 2, N'Khoa h?c d? li?u c? b?n', 11);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (12, 2, N'L?ch s? Sài Gòn - TP.HCM', 14);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (13, 2, N'K? n?ng lãnh ??o', 27);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (14, 2, N'?m th?c Nam B?', 25);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (15, 2, N'Phát tri?n web v?i React', 11);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (16, 2, N'Kinh t? s?', 18);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (17, 2, N'Tâm lý h?c ?ám ?ông', 26);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (18, 2, N'Ngh? thu?t giao ti?p', 27);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (19, 2, N'Y h?c hi?n ??i', 12);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (20, 2, N'Ki?n trúc ???ng ??i', 24);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (21, 3, N'Giáo trình Toán cao c?p', 2);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (22, 3, N'V?t lý ??i c??ng', 9);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (23, 3, N'Nguyên lý k? toán', 19);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (24, 3, N'L?p trình Python', 11);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (25, 3, N'V?n h?c Anh th? k? 19', 8);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (26, 3, N'Giáo trình Lu?t Hi?n pháp', 20);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (27, 3, N'Ph??ng pháp nghiên c?u khoa h?c', 10);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (28, 3, N'Hóa h?c h?u c?', 9);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (29, 3, N'Kinh t? vi mô', 18);
INSERT INTO sach (ma_sach, ma_thu_vien, ten_sach, loai_sach) VALUES (30, 3, N'L?ch s? tri?t h?c ph??ng Tây', 15);

INSERT INTO doc_gia VALUES (1, N'Nguy?n V?n An', '001200000001', '0912345678', TO_DATE('15/05/1998', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (2, N'Tr?n Th? Bình', '001200000002', '0912345679', TO_DATE('22/08/1999', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (3, N'Lê Hoàng C??ng', '001200000003', '0912345680', TO_DATE('03/01/2000', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (4, N'Ph?m Thúy Dung', '001200000004', '0912345681', TO_DATE('14/07/2001', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (5, N'Hoàng V?n ??t', '001200000005', '0912345682', TO_DATE('25/11/2002', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (6, N'V? Th? H??ng', '001200000006', '0912345683', TO_DATE('30/04/1985', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (7, N'??ng V?n Kh?i', '001200000007', '0912345684', TO_DATE('12/09/1988', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (8, N'Bùi Ng?c Linh', '001200000008', '0912345685', TO_DATE('08/03/1990', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (9, N'Mai V?n Minh', '001200000009', '0912345686', TO_DATE('19/12/1982', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (10, N'Lý Th? Nga', '001200000010', '0912345687', TO_DATE('05/06/1979', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (11, N'Ngô V?n Phúc', '001200000011', '0912345688', TO_DATE('17/10/1972', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (12, N'?? Th? Qu?nh', '001200000012', '0912345689', TO_DATE('29/02/1968', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (13, N'Tr??ng V?n S?n', '001200000013', '0912345690', TO_DATE('11/08/1965', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (14, N'Phan Th? Tuy?t', '001200000014', '0912345691', TO_DATE('23/05/1970', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (15, N'Lâm V?n Uyên', '001200000015', '0912345692', TO_DATE('07/12/1963', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (16, N'Nguy?n Thành Vinh', '001200000016', '0912345693', TO_DATE('09/04/2003', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (17, N'Tr?n Khánh Vy', '001200000017', '0912345694', TO_DATE('18/09/2004', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (18, N'Lê Minh Xuân', '001200000018', '0912345695', TO_DATE('27/07/2005', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (19, N'Hoàng Th? Y?n', '001200000019', '0912345696', TO_DATE('14/02/2002', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (20, N'Phùng V?n ??i', '001200000020', '0912345697', TO_DATE('03/11/2001', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (21, N'V??ng Th? Anh', '001200000021', '0912345698', TO_DATE('16/03/1987', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (22, N'Tr?nh V?n B?o', '001200000022', '0912345699', TO_DATE('24/06/1984', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (23, N'Chu Th? C?m', '001200000023', '0912345700', TO_DATE('01/09/1980', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (24, N'H? V?n D?ng', '001200000024', '0912345701', TO_DATE('12/05/1978', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (25, N'D??ng Th? H?nh', '001200000025', '0912345702', TO_DATE('28/10/1983', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (26, N'?inh V?n Hi?u', '001200000026', '0912345703', TO_DATE('13/07/1975', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (27, N'L?u Th? Kim', '001200000027', '0912345704', TO_DATE('20/01/1977', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (28, N'Tri?u V?n Long', '001200000028', '0912345705', TO_DATE('06/12/1969', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (29, N'Võ Th? My', '001200000029', '0912345706', TO_DATE('22/04/1981', 'DD/MM/YYYY'));
INSERT INTO doc_gia VALUES (30, N'Kim V?n Nam', '001200000030', '0912345707', TO_DATE('15/08/1976', 'DD/MM/YYYY'));

INSERT INTO nhan_vien VALUES (1, 1, 1, N'Nguy?n Th? Thu Hà', TO_DATE('15/05/1985', 'DD/MM/YYYY'), '0987654321', N'thuha@tvqg.vn', 12000000);
INSERT INTO nhan_vien VALUES (2, 1, 2, N'Tr?n V?n B?o', TO_DATE('22/08/1988', 'DD/MM/YYYY'), '0987654322', N'vanbao@tvqg.vn', 11000000);
INSERT INTO nhan_vien VALUES (3, 1, 1, N'Lê Th? Minh Ng?c', TO_DATE('03/01/1990', 'DD/MM/YYYY'), '0987654323', N'minhngoc@tvqg.vn', 9500000);
INSERT INTO nhan_vien VALUES (4, 1, 2, N'Ph?m ??c C??ng', TO_DATE('14/07/1982', 'DD/MM/YYYY'), '0987654324', N'duccuong@tvqg.vn', 12500000);
INSERT INTO nhan_vien VALUES (5, 1, 3, N'Hoàng Th? Lan Anh', TO_DATE('25/11/1992', 'DD/MM/YYYY'), '0987654325', N'lananh@tvqg.vn', 9000000);
INSERT INTO nhan_vien VALUES (6, 1, 4, N'V? V?n ??t', TO_DATE('30/04/1987', 'DD/MM/YYYY'), '0987654326', N'vandat@tvqg.vn', 11500000);
INSERT INTO nhan_vien VALUES (7, 1, 6, N'??ng Th? H??ng', TO_DATE('12/09/1991', 'DD/MM/YYYY'), '0987654327', N'thihuong@tvqg.vn', 9800000);
INSERT INTO nhan_vien VALUES (8, 1, 5, N'Bùi Ng?c S?n', TO_DATE('08/03/1980', 'DD/MM/YYYY'), '0987654328', N'ngocson@tvqg.vn', 13000000);
INSERT INTO nhan_vien VALUES (9, 1, 1, N'Mai Th? Thu?', TO_DATE('19/12/1989', 'DD/MM/YYYY'), '0987654329', N'thithuy@tvqg.vn', 10500000);
INSERT INTO nhan_vien VALUES (10, 2, 3, N'Lý V?n Khánh', TO_DATE('17/10/1986', 'DD/MM/YYYY'), '0987654330', N'vankhanh@sqg.vn', 10000000);
INSERT INTO nhan_vien VALUES (11, 2, 4, N'Ngô Th? Qu?nh', TO_DATE('29/02/1984', 'DD/MM/YYYY'), '0987654331', N'thiquynh@sqg.vn', 11500000);
INSERT INTO nhan_vien VALUES (12, 2, 1, N'?? Minh Sáng', TO_DATE('11/08/1993', 'DD/MM/YYYY'), '0987654332', N'minhsang@sqg.vn', 9200000);
INSERT INTO nhan_vien VALUES (13, 2, 2, N'Tr??ng Th? Tuy?t', TO_DATE('23/05/1981', 'DD/MM/YYYY'), '0987654333', N'thituyet@sqg.vn', 12500000);
INSERT INTO nhan_vien VALUES (14, 2, 2, N'Phan V?n Uy', TO_DATE('07/12/1987', 'DD/MM/YYYY'), '0987654334', N'vanuy@sqg.vn', 10500000);
INSERT INTO nhan_vien VALUES (15, 2, 1, N'Lâm Th? Vân', TO_DATE('09/04/1989', 'DD/MM/YYYY'), '0987654335', N'thivan@sqg.vn', 11800000);
INSERT INTO nhan_vien VALUES (16, 2, 1, N'V??ng Minh Xuân', TO_DATE('18/09/1990', 'DD/MM/YYYY'), '0987654336', N'minhxuan@sqg.vn', 9500000);
INSERT INTO nhan_vien VALUES (17, 2, 5, N'Tr?nh Ng?c Y?n', TO_DATE('27/07/1983', 'DD/MM/YYYY'), '0987654337', N'ngocyen@sqg.vn', 12200000);
INSERT INTO nhan_vien VALUES (18, 2, 6, N'Chu V?n An', TO_DATE('14/02/1985', 'DD/MM/YYYY'), '0987654338', N'vanan@sqg.vn', 10800000);
INSERT INTO nhan_vien VALUES (19, 3, 5, N'H? Th? Bích', TO_DATE('16/03/1988', 'DD/MM/YYYY'), '0987654339', N'thibich@dg.vn', 9800000);
INSERT INTO nhan_vien VALUES (20, 3, 6, N'D??ng V?n C?nh', TO_DATE('24/06/1982', 'DD/MM/YYYY'), '0987654340', N'vancanh@dg.vn', 11200000);
INSERT INTO nhan_vien VALUES (21, 3, 5, N'?inh Th? Di?u', TO_DATE('01/09/1991', 'DD/MM/YYYY'), '0987654341', N'thidieu@dg.vn', 10200000);
INSERT INTO nhan_vien VALUES (22, 3, 1, N'L?u V?n Giang', TO_DATE('12/05/1980', 'DD/MM/YYYY'), '0987654342', N'vangiang@dg.vn', 12000000);
INSERT INTO nhan_vien VALUES (23, 3, 1, N'Tri?u Th? Hoa', TO_DATE('28/10/1987', 'DD/MM/YYYY'), '0987654343', N'thihoa@dg.vn', 10500000);
INSERT INTO nhan_vien VALUES (24, 3, 1, N'Võ Minh Khoa', TO_DATE('13/07/1984', 'DD/MM/YYYY'), '0987654344', N'minhkhoa@dg.vn', 11500000);
INSERT INTO nhan_vien VALUES (25, 3, 2, N'Kim Th? Lan', TO_DATE('20/01/1989', 'DD/MM/YYYY'), '0987654345', N'thilan@dg.vn', 9900000);
INSERT INTO nhan_vien VALUES (26, 3, 2, N'Nguy?n V?n Long', TO_DATE('06/12/1983', 'DD/MM/YYYY'), '0987654346', N'vanlong@dg.vn', 12500000);
INSERT INTO nhan_vien VALUES (27, 3, 4, N'Tr?n Th? My', TO_DATE('22/04/1986', 'DD/MM/YYYY'), '0987654347', N'thimy@dg.vn', 10700000);

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


-- ALTER SESSION SET CONTAINER = ORCL21PDB1;
DROP USER atbm_user CASCADE;
CREATE USER atbm_user IDENTIFIED BY atbm123;
--CREATE USER atbm_user1 IDENTIFIED BY atbm123;
--CREATE USER atbm_user2 IDENTIFIED BY atbm123;
--GRANT CREATE SESSION TO ATBM_USER2;

-- grant m?t s? quy?n cho atbm_user
GRANT CONNECT, RESOURCE TO atbm_user;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO atbm_user;
GRANT SELECT ON DBA_ROLE_PRIVS TO ATBM_USER;
GRANT SELECT ON dba_sys_privs TO atbm_user;

-- ?? user khác ch?y các proc c?n grant
GRANT EXECUTE ON atbm_user.sp_get_all_users TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_get_roles_of_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_get_sys_privs_of_user TO PUBLIC;
GRANT EXECUTE ON atbm_user.sp_get_object_privs_of_user TO PUBLIC;
