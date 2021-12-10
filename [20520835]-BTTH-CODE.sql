-- Họ và tên: Phạm Nguyễn Xuân Trường
-- MSSV: 20520835
-- Bài tập tuần thứ 1 ngày 02/10/2021

/* 
Phan I
	1. Tạo quan hệ và khai báo tất cả các ràng buộc khóa chính, khóa ngoại.
*/
CREATE DATABASE QLHV
GO
USE QLHV
GO

--DROP DATABASE GV
CREATE TABLE HOCVIEN(
	MAHV CHAR(5),
	HO VARCHAR(40),
	TEN VARCHAR(10),
	NGSINH SMALLDATETIME,
	GIOITINH VARCHAR(3),
	CHECK (GIOITINH = 'Nu' OR GIOITINH = 'Nam'), /*GIOITINH phải có 1 trong 2 giá trị là Nam hoặc Nu*/
	NOISINH VARCHAR(40),
	MALOP CHAR(3),
	PRIMARY KEY (MAHV)
)

CREATE TABLE LOP(
	MALOP CHAR(3),
	TENLOP VARCHAR(40),
	TRGLOP CHAR(5),
	SISO TINYINT,
	MAGVCN CHAR(4),
	PRIMARY KEY (MALOP)
)

CREATE TABLE KHOA(
	MAKHOA VARCHAR(4),
	TENKHOA VARCHAR(40),
	NGTLAP SMALLDATETIME,
	TRGKHOA CHAR(4),
	PRIMARY KEY (MAKHOA)
)

CREATE TABLE MONHOC(
	MAMH VARCHAR(10),
	TENMH VARCHAR(40),
	TCLT TINYINT,
	TCTH TINYINT,
	MAKHOA VARCHAR(4),
	PRIMARY KEY (MAMH)
)

CREATE TABLE DIEUKIEN(
	MAMH VARCHAR(10),
	MAMH_TRUOC VARCHAR(10),
	PRIMARY KEY(MAMH,MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN(
	MAGV CHAR(4),
	HOTEN VARCHAR(40),
	HOCVI VARCHAR(10),
	HOCHAM VARCHAR(10),
	GIOITINH VARCHAR(3),
	CHECK (GIOITINH = 'Nu' OR GIOITINH = 'Nam'), /*GIOITINH phải có 1 trong 2 giá trị là Nam hoặc Nu*/
	NGSINH SMALLDATETIME,
	NGVL SMALLDATETIME,
	HESO NUMERIC(4,2),
	MUCLUONG MONEY,
	MAKHOA VARCHAR(4),
	PRIMARY KEY (MAGV)
)

CREATE TABLE GIANGDAY(
	MALOP CHAR(3),
	MAMH VARCHAR(10),
	MAGV CHAR(4),
	HOCKY TINYINT,
	NAM SMALLINT,
	TUNGAY SMALLDATETIME,
	DENNGAY SMALLDATETIME,
	PRIMARY KEY (MALOP,MAMH)
)

CREATE TABLE KETQUATHI(
	MAHV CHAR(5),
	MAMH VARCHAR(10),
	LANTHI TINYINT,
	NGTHI SMALLDATETIME,
	DIEM NUMERIC(4,2),
	KQUA VARCHAR(10),
	PRIMARY KEY(MAHV,MAMH,LANTHI)
)
GO

 -- Nhập dữ liệu
 -- Định dạng ngày thắng năm
SET DATEFORMAT dmy
GO

INSERT INTO KHOA(MAKHOA,TENKHOA,NGTLAP,TRGKHOA) VALUES
 ( 'KHMT','Khoa hoc may tinh','7/6/2005','GV01'),
 ( 'HTTT','He thong thong tin','7/6/2005','GV02'),
 ( 'CNPM','Cong nghe phan mem','7/6/2005','GV04'),
 ( 'MTT','Mang va truyen thon','20/10/2005','GV03'),
 ( 'KTMT','Ky thuat may tinh','20/12/2005',NULL)


INSERT INTO LOP(MALOP,TENLOP,TRGLOP,SISO,MAGVCN) VALUES
 ( 'K11','Lop 1 khoa 1','K1108',11,'GV07'),
 ( 'K12','Lop 2 khoa 1','K1205',12,'GV09'),
 ( 'K13','Lop 3 khoa 1','K1305',12,'GV14')

INSERT INTO MONHOC(MAMH,TENMH,TCLT,TCTH,MAKHOA) VALUES
 ( 'THDC','Tin hoc dai cuong',4,1,'KHMT'),
 ( 'CTRR','Cau truc roi rac',5,0,'KHMT'),
 ( 'CSDL','Co so du lieu',3,1,'HTTT'),
 ( 'CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT'),
 ( 'PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT'),
 ('DHMT','Do hoa may tinh',3,1,'KHMT'),
 ('KTMT','Kien truc may tinh',3,0,'KTMT'),
 ('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT'),
 ('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT'),
 ('HDH','He dieu hanh',4,0,'KTMT'),
 ('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM'),
 ('LTCFW','Lap trinh C for win',3,1,'CNPM'),
 ('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')
 
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('CSDL', 'CTRR')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('CSDL', 'CTDLGT')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('CTDLGT', 'THDC')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('PTTKTT', 'THDC')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('PTTKTT', 'CTDLGT')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('DHMT', 'THDC')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('LTHDT', 'THDC')
INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES ('PTTKHTTT', 'CSDL')
GO
INSERT INTO GIAOVIEN(MAGV,HOTEN,HOCVI,HOCHAM,GIOITINH,NGSINH,NGVL,HESO,MUCLUONG,MAKHOA) VALUES
( 'GV01','Ho Thanh Son','PTS','GS','Nam','02/05/1950','11/01/2004',5,'2250000','KHMT'),
( 'GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/04/2004',4.5,'2025000','HTTT'),
( 'GV03','Do Nghiem Phung','TS','GS','Nu','01/08/1950','23/09/2004',4,'1800000','CNPM'),
( 'GV04','Tran Nam Son','TS','PGS','Nam','22/02/1961','12/01/2005',4.5,'2025000','KTMT'),
( 'GV05','Mai Thanh Danh','ThS','GV','Nam','12/03/1958','12/01/2005',3,'1350000','HTTT'),
( 'GV06','Tran Doan Hung','TS','GV','Nam','11/03/1953','12/01/2005',4.5,'2025000','KHMT'),
( 'GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','01/03/2005',4,'1800000','KHMT'),
( 'GV08','Le Thi Tran','KS',Null,'Nu','26/03/1974','01/03/2005',1.69,'760500','KHMT'),
( 'GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','01/03/2005',4,'1800000','HTTT'),
( 'GV10','Le Tran Anh Loan','KS',Null,'Nu','17/07/1972','01/03/2005',1.86,'837000','CNPM'),
( 'GV11','Ho Thanh Tung','CN','GV','Nam','12/01/1980','15/05/2005',2.67,'1201500','MTT'),
( 'GV12','Tran Van Anh','CN','Null','Nu','29/03/1981','15/05/2005',1.69,'760500','CNPM'),
( 'GV13','Nguyen Linh Dan','CN',NulL,'Nu','23/05/1980','15/05/2005',1.69,'760500','KTMT'),
( 'GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/05/2005',3,'1350000','MTT'),
( 'GV15','Le Ha Thanh','ThS','GV','Nam','04/05/1978','15/05/2005',3,'1350000','KHMT')

INSERT INTO KETQUATHI(MAHV,MAMH,LANTHI,NGTHI,DIEM,KQUA) VALUES
( 'K1101','CSDL',1,'20/07/2006',10,'Dat'),
( 'K1101','CTDLGT',1,'28/12/2006',9,'Dat'),
( 'K1101','THDC',1,'20/05/2006',9,'Dat'),
( 'K1101','CTRR',1,'13/05/2006',9.5,'Dat'),
( 'K1102','CSDL',1,'20/07/2006',4,'Khong Dat'),
( 'K1102','CSDL',2,'27/07/2006',4.25,'Khong Dat'),
( 'K1102','CSDL',3,'10/08/2006',4.5,'Khong Dat'),
( 'K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat'),
( 'K1102','CTDLGT',2,'05/01/2007',4,'Khong Dat'),
( 'K1102','CTDLGT',3,'15/01/2007',6,'Dat'),
( 'K1102','THDC',1,'20/05/2006',5,'Dat'),
( 'K1102','CTRR',1,'13/05/2006',7,'Dat'),
( 'K1103','CSDL',1,'20/07/2006',3.5,'Khong Dat'),
( 'K1103','CSDL',2,'27/07/2006',8.25,'Dat'),
( 'K1103','CTDLGT',1,'28/12/2006',7,'Dat'),
( 'K1103','THDC',1,'20/05/2006',8,'Dat'),
( 'K1103','CTRR',1,'13/05/2006',6.5,'Dat'),
( 'K1104','CSDL',1,'20/07/2006',3.75,'Khong Dat'),
( 'K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat'),
( 'K1104','THDC',1,'20/05/2006',4,'Khong Dat'),
( 'K1104','CTRR',1,'13/05/2006',4,'Khong Dat'),
( 'K1104','CTRR',2,'20/05/2006',3.5,'Khong Dat'),
( 'K1104','CTRR',3,'30/06/2006',4,'Khong Dat'),
( 'K1201','CSDL',1,'20/07/2006',6,'Dat'),
( 'K1201','CTDLGT',1,'28/12/2006',5,'Dat'),
( 'K1201','THDC',1,'20/05/2006',8.5,'Dat'),
( 'K1201','CTRR',1,'13/05/2006',9,'Dat'),
( 'K1202','CSDL',1,'20/07/2006',8,'Dat'),
( 'K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat'),
( 'K1202','CTDLGT',2,'05/01/2007',5,'Dat'),
( 'K1202','THDC',1,'20/05/2006',4,'Khong Dat'),
( 'K1202','THDC',2,'27/05/2006',4,'Khong Dat'),
( 'K1202','CTRR',1,'13/05/2006',3,'Khong Dat'),
( 'K1202','CTRR',2,'20/05/2006',4,'Khong Dat'),
( 'K1202','CTRR',3,'30/06/2006',6.25,'Dat'),
( 'K1203','CSDL',1,'20/07/2006',9.25,'Dat'),
( 'K1203','CTDLGT',1,'28/12/2006',9.5,'Dat'),
( 'K1203','THDC',1,'20/05/2006',10,'Dat'),
( 'K1203','CTRR',1,'13/05/2006',10,'Dat'),
( 'K1204','CSDL',1,'20/07/2006',8.5,'Dat'),
( 'K1204','CTDLGT',1,'28/12/2006',6.75,'Dat'),
( 'K1204','THDC',1,'20/05/2006',4,'Khong Dat'),
( 'K1204','CTRR',1,'13/05/2006',6,'Dat'),
( 'K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat'),
( 'K1301','CTDLGT',1,'25/07/2006',8,'Dat'),
( 'K1301','THDC',1,'20/05/2006',7.75,'Dat'),
( 'K1301','CTRR',1,'13/05/2006',8,'Dat'),
( 'K1302','CSDL',1,'20/12/2006',6.75,'Dat'),
( 'K1302','CTDLGT',1,'25/07/2006',5,'Dat'),
( 'K1302','THDC',1,'20/05/2006',8,'Dat'),
( 'K1302','CTRR',1,'13/05/2006',8.5,'Dat'),
( 'K1303','CSDL',1,'20/12/2006',4,'Khong Dat'),
( 'K1303','CTDLGT',1,'25/07/2006',4.5,'Khong Dat'),
( 'K1303','CTDLGT',2,'07/08/2006',4,'Khong Dat'),
( 'K1303','CTDLGT',3,'15/08/2006',4.25,'Khong Dat'),
( 'K1303','THDC',1,'20/05/2006',4.5,'Khong Dat'),
( 'K1303','CTRR',1,'13/05/2006',3.25,'Khong Dat'),
( 'K1303','CTRR',2,'20/05/2006',5,'Dat'),
( 'K1304','CSDL',1,'20/12/2006',7.75,'Dat'),
( 'K1304','CTDLGT',1,'25/07/2006',9.75,'Dat'),
( 'K1304','THDC',1,'20/05/2006',5.5,'Dat'),
( 'K1304','CTRR',1,'13/05/2006',5,'Dat'),
( 'K1305','CSDL',1,'20/12/2006',9.25,'Dat'),
( 'K1305','CTDLGT',1,'25/07/2006',10,'Dat'),
( 'K1305','THDC',1,'20/05/2006',8,'Dat'),
( 'K1305','CTRR',1,'13/05/2006',10,'Dat')

INSERT INTO GIANGDAY(MALOP,MAMH,MAGV,HOCKY,NAM,TUNGAY,DENNGAY) VALUES
( 'K11','THDC','GV07',1,2006,'02/01/2006','12/05/2006'),
( 'K12','THDC','GV06',1,2006,'02/01/2006','12/05/2006'),
( 'K13','THDC','GV15',1,2006,'02/01/2006','12/05/2006'),
( 'K11','CTRR','GV02',1,2006,'09/01/2006','17/05/2006'),
( 'K12','CTRR','GV02',1,2006,'09/01/2006','17/05/2006'),
( 'K13','CTRR','GV08',1,2006,'09/01/2006','17/05/2006'),
( 'K11','CSDL','GV05',2,2006,'01/06/2006','15/07/2006'),
( 'K12','CSDL','GV09',2,2006,'01/06/2006','15/07/2006'),
( 'K13','CTDLGT','GV15',2,2006,'01/06/2006','15/07/2006'),
( 'K13','CSDL','GV05',3,2006,'01/08/2006','15/12/2006'),
( 'K13','DHMT','GV07',3,2006,'01/08/2006','15/12/2006'),
( 'K11','CTDLGT','GV15',3,2006,'01/08/2006','15/12/2006'),
( 'K12','CTDLGT','GV15',3,2006,'01/08/2006','15/12/2006'),
( 'K11','HDH','GV04',1,2007,'02/01/2007','18/02/2007'),
( 'K12','HDH','GV04',1,2007,'02/01/2007','20/03/2007'),
( 'K11','DHMT','GV07',1,2007,'18/02/2007','20/03/2007')

INSERT INTO HOCVIEN(MAHV,HO,TEN,NGSINH,GIOITINH,NOISINH,MALOP) VALUES
( 'K1101','Nguyen Van','A','27/01/1986','Nam','TpHCM','K11' ),
( 'K1102','Tran Ngoc','Han','14/03/1986','Nu','Kien Giang','K11' ),
( 'K1103','Ha Duy','Lap','18/04/1986','Nam','Nghe An','K11' ),
( 'K1104','Tran Ngoc','Linh','30/03/1986','Nu','Tay Ninh','K11' ),
( 'K1105','Tran Minh','Long','27/02/1986','Nam','TpHCM','K11' ),
( 'K1106','Le Nhat','Minh','24/01/1986','Nam','TpHCM','K11' ),
( 'K1107','Nguyen Nhu','Nhut','27/01/1986','Nam','Ha Noi','K11' ),
( 'K1108','Nguyen Manh','Tam','27/02/1986','Nam','Kien Giang','K11' ),
( 'K1109','Phan Thi Thanh','Tam','27/01/1986','Nu','Vinh Long','K11' ),
( 'K1110','Le Hoai','Thuong','05/02/1986','Nu','Can Tho','K11' ),
( 'K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11' ),
( 'K1201','Nguyen Van','B','11/02/1986','Nam','TpHCM','K12' ),
( 'K1202','Nguyen Thi Kim','Duyen','18/01/1986','Nu','TpHCM','K12' ),
( 'K1203','Tran Thi Kim','Duyen','17/09/1986','Nu','TpHCM','K12' ),
( 'K1204','Truong My','Hanh','19/05/1986','Nu','Dong Nai','K12' ),
( 'K1205','Nguyen Thanh','Nam','17/04/1986','Nam','TpHCM','K12' ),
( 'K1206','Nguyen Thi Truc','Thanh','04/03/1986','Nu','Kien Giang','K12' ),
( 'K1207','Tran Thi Bich','Thuy','08/02/1986','Nu','Nghe An','K12' ),
( 'K1208','Huynh Thi Kim','Trieu','08/04/1986','Nu','Tay Ninh','K12' ),
( 'K1209','Pham Thanh','Trieu','23/02/1986','Nam','TpHCM','K12' ),
( 'K1210','Ngo Thanh','Tuan','14/02/1986','Nam','TpHCM','K12' ),
( 'K1211','Do Thi','Xuan','09/03/1986','Nu','Ha Noi','K12' ),
( 'K1212','Le Thi Phi','Yen','12/03/1986','Nu','TpHCM','K12' ),
( 'K1301','Nguyen Thi Kim','Cuc','09/06/1986','Nu','Kien Giang','K13' ),
( 'K1302','Truong Thi My','Hien','18/03/1986','Nu','Nghe An','K13' ),
( 'K1303','Le Duc','Hien','21/03/1986','Nam','Tay Ninh','K13' ),
( 'K1304','Le Quang','Hien','18/04/1986','Nam','TpHCM','K13' ),
( 'K1305','Le Thi','Huong','27/03/1986','Nu','TpHCM','K13' ),
( 'K1306','Nguyen Thai','Huu','30/03/1986','Nam','Ha Noi','K13' ),
( 'K1307','Tran Minh','Man','28/05/1986','Nam','TpHCM','K13' ),
( 'K1308','Nguyen Hieu','Nghia','08/04/1986','Nam','Kien Giang','K13' ),
( 'K1309','Nguyen Trung','Nghia','18/01/1987','Nam','Nghe An','K13' ),
( 'K1310','Tran Thi Hong','Tham','22/04/1986','Nu','Tay Ninh','K13' ),
( 'K1311','Tran Minh','Thuc','04/04/1986','Nam','TpHCM','K13' ),
( 'K1312','Nguyen Thi Kim','Yen','07/09/1986','Nu','TpHCM','K13' )
GO

 -- Thêm khóa ngoại vào các thuộc tính
ALTER TABLE KHOA
ADD	CONSTRAINT fk_trkhoa
	FOREIGN KEY (TRGKHOA)
	REFERENCES GIAOVIEN(MAGV);
GO

ALTER TABLE MONHOC
ADD CONSTRAINT fk_monhoc_thuoc_khoa
	FOREIGN KEY (MAKHOA)
	REFERENCES KHOA(MAKHOA);
GO

ALTER TABLE GIAOVIEN
ADD CONSTRAINT fk_giaovien_thuoc_khoa
	FOREIGN KEY (MAKHOA)
	REFERENCES KHOA(MAKHOA);
GO

ALTER TABLE LOP
ADD CONSTRAINT fk_mgvcn
	FOREIGN KEY (MAGVCN)
	REFERENCES GIAOVIEN(MAGV),

	CONSTRAINT fk_trglop
	FOREIGN KEY (TRGLOP)
	REFERENCES HOCVIEN(MAHV);
GO

ALTER TABLE HOCVIEN
ADD CONSTRAINT fk_hv_hoclop
	FOREIGN KEY (MALOP)
	REFERENCES LOP(MALOP)
GO

ALTER TABLE DIEUKIEN
ADD CONSTRAINT fk_xetmonhoc
	FOREIGN KEY (MAMH)
	REFERENCES MONHOC(MAMH)
GO

ALTER TABLE KETQUATHI
ADD CONSTRAINT fk_hocvienthi
	FOREIGN KEY (MAHV)
	REFERENCES HOCVIEN(MAHV),
	CONSTRAINT fk_monthi
	FOREIGN KEY (MAMH)
	REFERENCES MONHOC(MAMH)
GO

ALTER TABLE GIANGDAY
ADD CONSTRAINT fk_gv_daylop
	FOREIGN KEY (MAGV)
	REFERENCES GIAOVIEN(MAGV),
	CONSTRAINT fk_day_tai_lop
	FOREIGN KEY (MALOP)
	REFERENCES LOP(MALOP),
	CONSTRAINT fk_day_mon
	FOREIGN KEY (MAMH)
	REFERENCES MONHOC(MAMH)
GO
 -- Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
ALTER TABLE HOCVIEN
	ADD GHICHU VARCHAR(40),
		DIEMTB NUMERIC(4,2),
		XEPLOAI VARCHAR(10)
GO
--Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp.
ALTER TABLE HOCVIEN
ADD CHECK (MAHV LIKE '___[0-9][0-9]')

-- Tạo ràng buộc điểm trong khoảng [0,10]
ALTER TABLE HOCVIEN
ADD CHECK (DIEMTB >=0 AND DIEMTB <=10)
ALTER TABLE KETQUATHI
ADD CHECK (DIEM >=0 AND DIEM <=10)

GO

-----------------------------------------------------LAB 2 ---------------------------------------------------
--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
-- 1. Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
UPDATE GIAOVIEN
SET HESO=HESO*1.2
FROM KHOA
WHERE MAGV = KHOA.TRGKHOA AND KHOA.TRGKHOA IS NOT NULL
GO

-- 2. Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các
--môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau
--cùng).

UPDATE HOCVIEN
SET DIEMTB = KQ.DIEMTB
FROM (	SELECT MAHV, DIEMTB = AVG(KQT.DIEM)
		FROM ( SELECT KQT.*
				FROM KETQUATHI KQT INNER JOIN (	SELECT MAHV, MAMH, LANTHI = MAX(LANTHI)
												FROM KETQUATHI
												GROUP BY MAHV, MAMH) KQT1
				ON KQT.MAHV = KQT1.MAHV AND KQT.LANTHI = KQT1.LANTHI AND KQT.MAMH = KQT1.MAMH) AS KQT
		GROUP BY MAHV) KQ
WHERE KQ.MAHV = HOCVIEN.MAHV
GO


-- 3. Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất
--kỳ thi lần thứ 3 dưới 5 điểm.
UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
FROM KETQUATHI
WHERE KETQUATHI.LANTHI = 3 AND KETQUATHI.DIEM < 5 AND HOCVIEN.MAHV = KETQUATHI.MAHV
GO

-- 4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
--o Nếu DIEMTB >= 9 thì XEPLOAI =”XS”
--o Nếu 8 <= DIEMTB < 9 thì XEPLOAI = “G”
--o Nếu 6.5 <= DIEMTB < 8 thì XEPLOAI = “K”
--o Nếu 5 <= DIEMTB < 6.5 thì XEPLOAI = “TB”
--o Nếu DIEMTB < 5 thì XEPLOAI = ”Y”

UPDATE HOCVIEN SET XEPLOAI = 'XS' WHERE DIEMTB >= 9
UPDATE HOCVIEN SET XEPLOAI = 'G' WHERE DIEMTB >= 8 AND DIEMTB < 9
UPDATE HOCVIEN SET XEPLOAI = 'K' WHERE DIEMTB >= 6.5 AND DIEMTB < 8
UPDATE HOCVIEN SET XEPLOAI = 'TB' WHERE DIEMTB >=5 AND DIEMTB < 6.5
UPDATE HOCVIEN SET XEPLOAI = 'Y' WHERE DIEMTB <5 AND DIEMTB IS NOT NULL
GO


--III. Ngôn ngữ truy vấn dữ liệu:
--1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT MAHV, HO + ' ' + TEN AS HOTEN, NGSINH, HV.MALOP
FROM HOCVIEN HV INNER JOIN LOP
ON HV.MAHV = LOP.TRGLOP
GO

--2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”,
--sắp xếp theo tên, họ học viên.
SELECT KQT.MAHV, HO + ' ' + TEN AS HOTEN, LANTHI, DIEM
FROM KETQUATHI KQT INNER JOIN HOCVIEN HV
ON KQT.MAHV = HV.MAHV
WHERE LEFT(KQT.MAHV, 3) = 'K12' AND MAMH = 'CTRR'
ORDER BY TEN, HO
GO

-- 3.	In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT KQT.MAHV, HO + ' ' + TEN AS HOTEN, MAMH
FROM KETQUATHI KQT INNER JOIN HOCVIEN HV 
ON KQT.MAHV = HV.MAHV
GROUP BY KQT.MAHV, HO, TEN, MAMH, KQUA
HAVING MAX(LANTHI) = 1 AND KQUA ='DAT'
ORDER BY KQT.MAHV
GO

-- 4.	In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT KQT.MAHV, HO + ' ' + TEN AS HOTEN
FROM KETQUATHI KQT INNER JOIN HOCVIEN HV 
ON KQT.MAHV = HV.MAHV
WHERE LEFT(KQT.MAHV, 3) = 'K11' AND MAMH = 'CTRR' AND LANTHI = 1 AND KQUA = 'Khong Dat'
GO



-----------------------------------------------------LAB 3 ---------------------------------------------------
--5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả
--các lần thi).

SELECT DISTINCT HV.MAHV, HO + ' ' + TEN AS HOTEN
FROM HOCVIEN HV JOIN KETQUATHI ON HV.MAHV = KETQUATHI.MAHV
WHERE	LEFT(MALOP,1) = 'K'
		AND HV.MAHV NOT IN (	SELECT DISTINCT MAHV
								FROM KETQUATHI KQ
								WHERE KQUA = 'Dat' AND MAMH = 'CTRR' )
GO

-- 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm
--2006.
SELECT DISTINCT TENMH
FROM MONHOC JOIN GIANGDAY ON GIANGDAY.MAMH = MONHOC.MAMH
			JOIN GIAOVIEN ON GIANGDAY.MAGV = GIAOVIEN.MAGV
WHERE HOTEN = 'Tran Tam Thanh' AND GIANGDAY.HOCKY = 1 AND NAM = 2006
GO

-- Làm thêm:
--a Các lớp mà GV Trần Tâm Thanh dạy trong HK1 năm 2006

SELECT DISTINCT LOP.MALOP
FROM GIAOVIEN	JOIN GIANGDAY ON GIANGDAY.MAGV = GIAOVIEN.MAGV
				JOIN LOP ON GIANGDAY.MALOP = LOP.MALOP
WHERE HOTEN = 'Tran Tam Thanh' AND GIANGDAY.HOCKY = 1 AND NAM = 2006
GO

--b Thông tin lớp trưởng của cá lớp mà GV Trần Tâm Thanh đã dạy trong hk1 năm 2006

SELECT DISTINCT *
FROM HOCVIEN
WHERE MAHV IN 
(	SELECT TRGLOP
	FROM LOP
	WHERE MALOP IN 
	(	SELECT MALOP
		FROM GIANGDAY
		WHERE NAM = 2006 AND HOCKY = 1 AND MAGV IN 
		(	SELECT MAGV 
			FROM GIAOVIEN
			WHERE HOTEN = 'Tran Tam Thanh')))
GO

--c Các lớp mà GV Trần Tâm Thanh đã dạy môn "Cấu Trúc Rời Rạc" trong hk1 năm 2006

SELECT DISTINCT MALOP
FROM LOP
WHERE MALOP IN
(	SELECT MALOP
		FROM GIANGDAY
		WHERE NAM = 2006 AND HOCKY = 1 AND MAGV IN 
		(	SELECT MAGV 
			FROM GIAOVIEN
			WHERE HOTEN = 'Tran Tam Thanh')
		AND MAMH IN
		(	SELECT MAMH
			FROM MONHOC
			WHERE TENMH = 'Cau Truc Roi Rac'))
GO
--7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy
--trong học kỳ 1 năm 2006.
SELECT DISTINCT MONHOC.MAMH,TENMH
FROM MONHOC JOIN GIANGDAY ON GIANGDAY.MAMH = MONHOC.MAMH
			JOIN LOP ON LOP.MAGVCN = GIANGDAY.MAGV
WHERE NAM = 2006 AND HOCKY = 1 AND LEFT(LOP.MALOP,3) = 'K11'
GO

--8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So
--Du Lieu”.
--CACH 1
SELECT DISTINCT HO + ' ' + TEN AS HOTEN
FROM HOCVIEN JOIN LOP		ON LOP.TRGLOP = HOCVIEN.MAHV
			 JOIN GIANGDAY	ON GIANGDAY.MALOP = LOP.MALOP
			 JOIN MONHOC	ON GIANGDAY.MAMH = MONHOC.MAMH
			 JOIN GIAOVIEN	ON GIANGDAY.MAGV = GIAOVIEN.MAGV
WHERE GIAOVIEN.HOTEN = 'Nguyen To Lan' AND MONHOC.TENMH = 'Co So Du Lieu'
GO
-- CACH 2

SELECT DISTINCT HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT DISTINCT TRGLOP
	FROM LOP
	WHERE MALOP IN 
	(	SELECT DISTINCT MALOP
		FROM GIANGDAY
		WHERE MAGV IN
		(	SELECT DISTINCT MAGV
			FROM GIAOVIEN
			WHERE HOTEN = 'Nguyen To Lan'
			AND MAMH IN
			(	SELECT DISTINCT MAMH
				FROM MONHOC
				WHERE TENMH = 'Co So Du Lieu'))))
GO
--9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So
--Du Lieu”.
SELECT MAMH,TENMH
FROM MONHOC
WHERE MAMH IN
(	SELECT DISTINCT DIEUKIEN.MAMH_TRUOC
	FROM MONHOC JOIN DIEUKIEN ON MONHOC.MAMH= DIEUKIEN.MAMH
	WHERE MONHOC.TENMH = 'Co So Du Lieu')
GO

--10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học,
--tên môn học) nào.
SELECT MAMH,TENMH
FROM MONHOC
WHERE MAMH IN
(	SELECT DISTINCT DIEUKIEN.MAMH
	FROM DIEUKIEN JOIN MONHOC ON DIEUKIEN.MAMH_TRUOC = MONHOC.MAMH
	WHERE TENMH = 'Cau Truc Roi Rac')
GO

--11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1
--năm 2006.
SELECT HOTEN
FROM GIAOVIEN
WHERE MAGV IN 
(	SELECT DISTINCT MAGV
	FROM GIANGDAY
	WHERE MALOP = 'K11' AND NAM = 2006 AND HOCKY = 1
	UNION
	SELECT DISTINCT MAGV
	FROM GIANGDAY
	WHERE MALOP = 'K12' AND NAM = 2006 AND HOCKY = 1
)
GO

--12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng
--chưa thi lại môn này.

SELECT DISTINCT MAHV, HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
	(	SELECT MAHV 
		FROM KETQUATHI KQT
		WHERE KQT.KQUA = 'Khong Dat' AND LANTHI = 1 AND MAMH = 'CSDL'
		EXCEPT 
		SELECT MAHV
		FROM KETQUATHI
		WHERE LANTHI >= 2 AND MAMH = 'CSDL'
	)
GO

--13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT DISTINCT MAGV, HOTEN
FROM GIAOVIEN
WHERE MAGV IN
(	SELECT DISTINCT MAGV FROM GIAOVIEN
	EXCEPT 
	SELECT DISTINCT MAGV 
	FROM GIANGDAY
)
GO

--14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào
--thuộc khoa giáo viên đó phụ trách.

SELECT MAGV, HOTEN FROM GIAOVIEN 
WHERE MAGV NOT IN (
	SELECT GIANGDAY.MAGV
	FROM GIANGDAY JOIN GIAOVIEN 
	ON GIANGDAY.MAGV = GIAOVIEN.MAGV JOIN MONHOC
	ON GIANGDAY.MAMH = MONHOC.MAMH
	WHERE GIAOVIEN.MAKHOA = MONHOC.MAKHOA
)
GO


--15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat”
--hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT MAHV
	FROM KETQUATHI
	WHERE MAMH = 'CTRR' AND LANTHI >= 3 AND KQUA = 'Khong Dat'
	UNION
	SELECT MAHV
	FROM KETQUATHI
	WHERE MAMH = 'CTRR' AND DIEM = 5
)
GO

--16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm
--học.
SELECT HOTEN
FROM GIAOVIEN
WHERE MAGV IN
(	SELECT MAGV
	FROM GIANGDAY
	WHERE MAMH = 'CTRR'
	GROUP BY MAGV,NAM,HOCKY
	HAVING COUNT(MALOP) >=2)
GO

--17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).

SELECT HV.MAHV, HO + ' ' + TEN AS HOTEN, DIEM 
FROM HOCVIEN HV JOIN (
	SELECT MAHV, DIEM 
	FROM KETQUATHI A
	WHERE NOT EXISTS (
		SELECT * 
		FROM KETQUATHI B 
		WHERE A.MAHV = B.MAHV AND A.MAMH = B.MAMH AND A.LANTHI < B.LANTHI
	) AND MAMH = 'CSDL'
) DIEM_CSDL
ON HV.MAHV = DIEM_CSDL.MAHV
GO


--18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần
--thi).
SELECT HV.MAHV, HO + ' ' + TEN AS HOTEN, DIEM 
FROM HOCVIEN HV JOIN 
(	SELECT MAHV, DIEM 
	FROM KETQUATHI A
	WHERE NOT EXISTS (
		SELECT * 
		FROM KETQUATHI B 
		WHERE A.MAHV = B.MAHV AND A.MAMH = B.MAMH AND A.LANTHI < B.LANTHI) AND 
	MAMH IN
	(	SELECT MAMH 
		FROM MONHOC
		WHERE TENMH = 'Co So Du Lieu')
) DIEM_CSDL
ON HV.MAHV = DIEM_CSDL.MAHV
GO

--19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
-- BẢNG: KHOA
-- Tìm NGLTAP bé nhất trong bảng KHOA

SELECT MAKHOA,TENKHOA
FROM KHOA
WHERE NGTLAP <= ALL
(	SELECT NGTLAP
	FROM KHOA
)

GO
--20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
-- BẢNG: GIAOVIEN
-- Tìm đếm sô lượng gv có học hàm GS hoặc PGS

SELECT COUNT(MAGV) AS SOLUONG
FROM GIAOVIEN
WHERE HOCHAM = 'GS' OR HOCHAM = 'PGS'
GO

-- có bao nhiêu GV chưa là PGS,GS
SELECT COUNT(MAGV) AS SOLUONG
FROM GIAOVIEN
WHERE NOT(HOCHAM = 'GS' OR HOCHAM = 'PGS') OR HOCHAM IS NULL
GO

--có bao nhiêu GV chưa có học hàm
SELECT COUNT(MAGV) AS SOLUONG
FROM GIAOVIEN
WHERE HOCHAM IS NULL
GO

--21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi
--khoa.
-- BẢNG: GIAOVIEN
-- Group theo HOCVI và đếm MAGV

SELECT HOCVI,COUNT(MAGV)
FROM GIAOVIEN
GROUP BY HOCVI
GO

-- có thêm thuộc tính mã khoa

SELECT MAKHOA,HOCVI,COUNT(MAGV)
FROM GIAOVIEN
GROUP BY MAKHOA,HOCVI
GO

-- coi TS, PTS là như nhau

SELECT MAKHOA,HOCVI,SOLUONG
FROM
(	SELECT 	MAKHOA,'TS, PTS' AS HOCVI,COUNT(MAGV) AS SOLUONG
	FROM GIAOVIEN
	WHERE GIAOVIEN.HOCVI = 'TS' OR GIAOVIEN.HOCVI = 'PTS'
	GROUP BY MAKHOA
	UNION
	SELECT MAKHOA,HOCVI, COUNT(MAGV) AS SOLUONG
	FROM GIAOVIEN
	WHERE HOCVI NOT IN ('TS','PTS')
	GROUP BY MAKHOA,HOCVI
) AS A
GO

-- cập nhật PTS thành TS, TS thành TSKH
UPDATE GIAOVIEN
SET HOCVI = 'TSKH' WHERE HOCVI = 'TS'
GO
UPDATE GIAOVIEN
SET HOCVI = 'TS' WHERE HOCVI = 'PTS'
GO

--'CN' : 15, 'KS' : 15, 'Ths' : 22, 'TS' : 30, 'TSKH' : 30
-- 'PGS' : 40, 'GS': 60
-- Tính chỉ tiêu tuyển sinh?
-- VỀ NHÀ
-- BẢNG: GIAOVIEN
-- Tạo bảng #CHITIEU có cột HOCVI_HOCHAM,CHITIEU sau đó insert dữ liệu
-- Xét 2 bảng GIAOVIEN,#CHITIEU tính chỉ tiêu bằng tổng CHITIEU khi có học vị, học hàm tương ứng của từng giáo viên
CREATE TABLE #CHITIEU(
	HOCVI_HOCHAM VARCHAR(10),
	CHITIEU INT
)
GO

INSERT INTO #CHITIEU(HOCVI_HOCHAM,CHITIEU) VALUES
('CN',15),('KS',15),('Ths',22),('TS',30),('TSKH',30),('PGS',40),('GS',60)
GO

SELECT SUM(CHITIEU) AS CHITIEU
FROM GIAOVIEN,#CHITIEU
WHERE GIAOVIEN.HOCVI = HOCVI_HOCHAM OR GIAOVIEN.HOCHAM = HOCVI_HOCHAM
GO


--22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
-- BẢNG: KETQUATHI
-- GROUP theo MAMH, KETQUA đếm số lượng Dat và Khong Dat

SELECT MAMH,KQUA,COUNT(KQUA)
FROM KETQUATHI
GROUP BY MAMH,KQUA
ORDER BY MAMH
GO

-- Làm thêm:	1. Thống kê sv Dat, Khong Dat theo từng lớp
--				2. Mỗi môn học (tên môn), thống kê sv Dat, Khong Dat theo từng lớp
--1.
-- BẢNG: LOP,KETQUATHI,HOCVIEN
-- Kết 3 bảng HOCVIEN,LOP,KETQUATHI theo MALOP,MAHV sau đó group theo MALOP và KQUA 
-- do không không yêu cầu là lần thi nào nên sẽ đếm tất cả các lần thi

SELECT LOP.MALOP, KQUA, COUNT(KQUA) AS SOLUONG
FROM	HOCVIEN HV 
		JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV 
		JOIN LOP ON LOP.MALOP = HV.MALOP
GROUP BY LOP.MALOP,KQUA
ORDER BY MALOP ASC
GO

--2.
-- BẢNG: MONHOC,LOP,HOCVIEN,KETQUATHI
-- lấy 4 bảng trên lọc theo đk MONHOC.MAMH = KQT.MAMH AND HV.MALOP = LOP.MALOP AND HV.MAHV = KQT.MAHV
-- sau đó group theo tenmh,malop,ketqua
-- do không không yêu cầu là lần thi nào nên sẽ đếm tất cả các lần thi

SELECT LOP.MALOP,TENMH,KQUA,COUNT(KQUA) AS SOLUONG
FROM MONHOC, LOP, HOCVIEN HV, KETQUATHI KQT
WHERE MONHOC.MAMH = KQT.MAMH AND HV.MALOP = LOP.MALOP AND HV.MAHV = KQT.MAHV
GROUP BY TENMH,LOP.MALOP,KQUA	
ORDER BY LOP.MALOP ASC
GO

--23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho
--lớp đó ít nhất một môn học.
-- BẢNG: GIAOVIEN, LOP, GIANGDAY
-- chọn magv trong tập hợp magvcn = GIANGDAY.MAGV có GIANGDAY.MALOP = LOP.MALOP 

SELECT MAGV,HOTEN
FROM GIAOVIEN
WHERE MAGV IN 
(	SELECT MAGVCN
	FROM LOP,GIANGDAY
	WHERE LOP.MALOP = GIANGDAY.MALOP AND MAGVCN = MAGV)
GO

--24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
--BẢNG: HOCVIEN, LOP
--Tìm lớp có sĩ số lớn nhất => lấy họ tên của hv có masv=trglop

SELECT HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT TRGLOP
	FROM LOP
	WHERE SISO = 
	(	SELECT TOP 1 SISO
		FROM LOP
		ORDER BY SISO DESC
	)
)
GO

--25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả
--các lần thi).
--BẢNG: HOCVIEN, LOP,  KETQUATHI
--Tìm masv ko đạt bất cứ lần thi nào bằng các lấy tập hợp sinh viên không đạt(masv,tenmh) - tập hợp sinh viên đạt(masv,tenmh)
-- Thống kê sô môn chưa đạt của từng sv chọn ra sv có số môn không đạt > 3 ==> B(masv)
-- Lấy TRGLOP nếu TRGLOP có trong B


SELECT HO + ' ' + TEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT TRGLOP
	FROM LOP
	WHERE TRGLOP IN 
	(	SELECT MAHV		
		FROM(	SELECT MAHV,COUNT(MAMH) AS SOMON
				FROM (
					SELECT MAHV,MAMH
					FROM KETQUATHI
					WHERE KQUA = 'Khong Dat'
					GROUP BY MAHV,MAMH
					EXCEPT
					SELECT MAHV,MAMH
					FROM KETQUATHI
					WHERE KQUA = 'Dat'
					GROUP BY MAHV,MAMH) AS A
				GROUP BY MAHV) AS B
		WHERE SOMON  > 3
	)
)
GO

-- 26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
-- BẢNG: HOCVIEN, KETQUATHI
-- Từ bảng kết quả thi đếm số lượng mamh có DIEM trong là 9 hoặc 10 theo mahv
-- Chọn những mahv nào có số môn cao đạt 9,10 cao nhất trong kết quả vừa có được
SELECT MAHV, HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT TOP 1 WITH TIES MAHV
	FROM
	(	SELECT MAHV,COUNT(MAMH) AS SOMON
		FROM KETQUATHI
		WHERE DIEM = 9 OR DIEM = 10
		GROUP BY MAHV
	) AS A
	ORDER BY SOMON DESC
)
GO

--27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.

--BẢNG: LOP, HOCVIEN, KETQUATHI
--Kết 3 bảng hocvien, lop, ketquathi theo hv.malop = lop.malop, kqt.mahv = hv.mahv
--Chọn ra dòng có DIEM thuộc (9,10)  sau đó group theo malop,mahv được bảng A
--Từ bảng A tham chiếu tới bảng HOCVIEN để lấy thông tin họ tên

SELECT A.MALOP, A.MAHV, HO + ' ' + TEN AS HOTEN, SOMON
FROM HOCVIEN, (SELECT LOP.MALOP, HV.MAHV, COUNT(MAMH) AS SOMON
					FROM HOCVIEN HV
						JOIN LOP ON LOP.MALOP = HV.MALOP
						JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV
					WHERE DIEM IN (9,10)
					GROUP BY LOP.MALOP, HV.MAHV) AS A
WHERE HOCVIEN.MAHV = A.MAHV
ORDER BY A.MALOP ASC
GO

--28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao
--nhiêu lớp.
--BẢNG: GIANGDAY
--Dùng bảng giangday group theo magv, hocky, nam đếm mamh, malop
SELECT MAGV,HOCKY,NAM,COUNT(MAMH) AS SOMON, COUNT(MALOP) SOLOP
FROM GIANGDAY 
GROUP BY MAGV,HOCKY,NAM
GO

--29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
-- BẢNG: GIANGDAY, GIAOVIEN
-- Giảng dạy là có số (malop + mamh) nhiều nhất trong từng học kỳ của từng năm, tìm
-- Tìm magv giảng dạy nhiều nhất theo từng học kỳ cửa từng năm
SELECT B.MAGV,HOTEN,NAM,HOCKY,SOLUONG
FROM GIAOVIEN JOIN
(	SELECT MAGV,NAM,HOCKY,SOLUONG
	FROM ( SELECT MAGV,NAM,HOCKY,COUNT(MALOP+MAMH) AS SOLUONG
			FROM GIANGDAY
			GROUP BY MAGV,HOCKY,NAM
			) AS A
	WHERE SOLUONG >= ALL ( SELECT COUNT(MALOP+MAMH) AS SOLUONG
								FROM GIANGDAY
								WHERE GIANGDAY.NAM = A.NAM AND GIANGDAY.HOCKY = A.HOCKY
								GROUP BY MAGV,HOCKY,NAM
								) 
	) AS B
	ON GIAOVIEN.MAGV = B.MAGV
GO

--30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1)
--nhất.
--BẢNG: MONHOC,KETQUATHI
--Tìm dòng có lần thi = 1 và kết quả = Không Đạt, đếm MAHV rồi lấy MAMH có số MAHV cao nhất theo từng môn

SELECT MAMH,TENMH
FROM MONHOC
WHERE MAMH IN
(	SELECT MAMH
	FROM KETQUATHI KQT
	WHERE LANTHI = 1 AND KQUA = 'Khong Dat'
	GROUP BY MAMH
	HAVING COUNT(MAHV) >= ALL (SELECT COUNT(MAHV)
								FROM KETQUATHI
								WHERE LANTHI = 1 AND KQUA = 'Khong Dat'
								GROUP BY MAMH)
)
GO

--31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
--BẢNG: HOCVIEN,KETQUATHI
--Lấy tập hợp sinh viên Dat - tập hơp sinh viên Khong Dat

SELECT MAHV, HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT MAHV
	FROM KETQUATHI
	WHERE KETQUATHI.LANTHI = 1 AND KETQUATHI.KQUA = 'Dat'
	EXCEPT
	SELECT MAHV
	FROM KETQUATHI
	WHERE KETQUATHI.LANTHI = 1 AND KETQUATHI.KQUA = 'Khong Dat')
GO

--32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
--BẢNG: HOCVIEN,KETQUATHI
-- Lấy các dòng trong KETQUATHI có lần thi cao nhất theo mahv và mamh
-- Từ tập hợp trên chọn ra tập hợp mahv có kết quả Đạt - tập hợp mahv có kết quả Không Đạt
SELECT DISTINCT HOCVIEN.MAHV, HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT MAHV
	FROM (SELECT MAHV,KQUA
				FROM KETQUATHI KQT
				WHERE LANTHI >= ALL (	SELECT LANTHI
										FROM KETQUATHI
										WHERE KETQUATHI.MAHV = KQT.MAHV AND KETQUATHI.MAMH = KQT.MAMH)) A
	WHERE A.KQUA = 'Dat'
	EXCEPT
	SELECT MAHV
	FROM (SELECT MAHV,KQUA
				FROM KETQUATHI KQT
				WHERE LANTHI >= ALL (	SELECT LANTHI
										FROM KETQUATHI
										WHERE KETQUATHI.MAHV = KQT.MAHV AND KETQUATHI.MAMH = KQT.MAMH)) A
	WHERE A.KQUA = 'Khong Dat'
)
GO


--33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
-- Tương tự 31
SELECT MAHV, HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT MAHV
	FROM KETQUATHI
	WHERE KETQUATHI.LANTHI = 1 AND KETQUATHI.KQUA = 'Dat'
	EXCEPT
	SELECT MAHV
	FROM KETQUATHI
	WHERE KETQUATHI.LANTHI = 1 AND KETQUATHI.KQUA = 'Khong Dat')
GO

--34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
--Tương tự 32

SELECT DISTINCT HOCVIEN.MAHV, HO + ' ' + TEN AS HOTEN
FROM HOCVIEN
WHERE MAHV IN
(	SELECT MAHV
	FROM (SELECT MAHV,KQUA
				FROM KETQUATHI KQT
				WHERE LANTHI >= ALL (	SELECT LANTHI
										FROM KETQUATHI
										WHERE KETQUATHI.MAHV = KQT.MAHV AND KETQUATHI.MAMH = KQT.MAMH)) A
	WHERE A.KQUA = 'Dat'
	EXCEPT
	SELECT MAHV
	FROM (SELECT MAHV,KQUA
				FROM KETQUATHI KQT
				WHERE LANTHI >= ALL (	SELECT LANTHI
										FROM KETQUATHI
										WHERE KETQUATHI.MAHV = KQT.MAHV AND KETQUATHI.MAMH = KQT.MAMH)) A
	WHERE A.KQUA = 'Khong Dat'
)
GO

--35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần
--thi sau cùng).
--BẢNG: HOCVIEN, KETQUATHI
--Từ KETQUATHI chon ra tập hợp có lần thi lớn nhất theo mahv và mamh
--Từ tập hợp có được chọn ra mahv có điểm cao nhất trong từng môn học(mamh)
SELECT HOCVIEN.MAHV, HO + ' ' + TEN AS HOTEN,A.MAMH
FROM HOCVIEN, (SELECT MAHV,MAMH,DIEM,LANTHI
				FROM KETQUATHI KQT
				WHERE LANTHI >= ALL (	SELECT LANTHI
										FROM KETQUATHI
										WHERE KETQUATHI.MAHV = KQT.MAHV AND KETQUATHI.MAMH = KQT.MAMH)) A
WHERE HOCVIEN.MAHV = A.MAHV AND DIEM >= ALL (	SELECT DIEM
												FROM KETQUATHI
												WHERE A.MAMH = KETQUATHI.MAMH)
GO

-------------------------------------------LAB 5------------------------------------------------------------------
--Phần I
--5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10 và “Khong dat” nếu điểm nhỏ hơn 5.
--BẢNG: KETQUATHI
--RB: KQUA

ALTER TABLE KETQUATHI
ADD CONSTRAINT CK_KQUA CHECK (KQUA = IIF(DIEM BETWEEN 5 AND 10, 'Dat', 'Khong Dat'))
GO

--6. Học viên thi một môn tối đa 3 lần.
--BẢNG: KETQUATHI
--RB: LANTHI
ALTER TABLE KETQUATHI
ADD CONSTRAINT CK_LANTHI CHECK (LANTHI <= 3)
GO

--7. Học kỳ chỉ có 1 giá trị từ 1 tới 3
--BẢNG: GIANGDAY
--RB: HOCKY
ALTER TABLE GIANGDAY
ADD CONSTRAINT CK_HOCKY CHECK (HOCKY BETWEEN 1 AND 3)
GO

--8. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”TSKH”.
--BẢNG: GIAOVIEN
--RB: HOCVI
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CK_HOCVI CHECK (HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'TSKH'))
GO

--9. Lớp trưởng của một lớp phải là học viên của lớp đó.
--BẢNG: LOP,HOCVIEN
--TRIGGER: TRGLOP  thuộc lớp
CREATE TRIGGER insert_loptruong
ON LOP
FOR INSERT
AS
BEGIN 
	DECLARE @TRGLOP CHAR(5), @MALOP CHAR(3)
	DECLARE @MAHV CHAR(5)

	SELECT @TRGLOP = TRGLOP, @MALOP = MALOP
	FROM inserted

	SELECT @MAHV = MAHV
	FROM HOCVIEN
	WHERE MAHV = @TRGLOP AND MALOP = @MALOP

	IF( @MAHV <> @TRGLOP)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Lớp trưởng phải là thành viên của lớp đó'
			ROLLBACK TRANSACTION 
		END
	ELSE 
		PRINT N'Thành công'
END
GO

CREATE TRIGGER update_loptruong
ON LOP
FOR UPDATE
AS
IF (UPDATE(TRGLOP) OR UPDATE(MALOP))
BEGIN 
	DECLARE @TRGLOP CHAR(5), @MALOP CHAR(3)
	DECLARE @MAHV CHAR(5)

	SELECT @TRGLOP = TRGLOP, @MALOP = MALOP
	FROM inserted

	SELECT @MAHV = MAHV
	FROM HOCVIEN
	WHERE MAHV = @TRGLOP AND MALOP = @MALOP

	IF( @MAHV <> @TRGLOP)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Lớp trưởng phải là thành viên của lớp đó'
			ROLLBACK TRANSACTION 
		END
	ELSE 
		PRINT N'Thành công'
END
GO

--10. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “TSKH”.
--BẢNG: KHOA,GIAOVIEN
--TRIGGER: TRGKHOA = MAKHOA && HOCVI IN (TS,TSKH)
CREATE TRIGGER insert_trg_giaovien_khoa
ON KHOA
FOR INSERT
AS
BEGIN 
	DECLARE @TRGKHOA CHAR(4), @MAKHOA VARCHAR(4)
	DECLARE @MAGV CHAR(4), @MAKHOA_GV VARCHAR(4)

	SELECT @TRGKHOA = TRGKHOA, @MAKHOA = MAKHOA
	FROM inserted

	SELECT @MAKHOA_GV = MAKHOA
	FROM GIAOVIEN
	WHERE MAGV = @TRGKHOA AND HOCVI IN ('TS','TSKH')

	IF( @MAKHOA <> @MAKHOA_GV)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “TSKH”.'
			ROLLBACK TRANSACTION 
		END
	ELSE 
		PRINT N'Thành công'
END
GO

CREATE TRIGGER update_trg_giaovien_khoa
ON KHOA
FOR UPDATE
AS
IF(UPDATE(TRGKHOA) OR UPDATE(MAKHOA))
BEGIN 
	DECLARE @TRGKHOA CHAR(4), @MAKHOA VARCHAR(4)
	DECLARE @MAGV CHAR(4), @MAKHOA_GV VARCHAR(4)

	SELECT @TRGKHOA = TRGKHOA, @MAKHOA = MAKHOA
	FROM inserted

	SELECT @MAKHOA_GV = MAKHOA
	FROM GIAOVIEN
	WHERE MAGV = @TRGKHOA AND HOCVI IN ('TS','TSKH')

	IF( @MAKHOA <> @MAKHOA_GV)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “TSKH”.'
			ROLLBACK TRANSACTION 
		END
	ELSE 
		PRINT N'Thành công'
END
GO

--11. Học viên ít nhất là 18 tuổi.
--BẢNG: HOCVIEN
--RB: NGSING
ALTER TABLE HOCVIEN
ADD CONSTRAINT CK_TUOI CHECK( YEAR(GETDATE())- YEAR(NGSINH) >= 18)
GO

--12. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc
--(DENNGAY).
--BẢNG: GIANGDAY
--RB: TUNGAY,DENNGAY
ALTER TABLE GIANGDAY
ADD CONSTRAINT CK_NGAYDAY CHECK(TUNGAY < DENNGAY)
GO

--13. Giáo viên khi vào làm ít nhất là 22 tuổi.
--BẢNG: GIAOVIEN
--RB: NGSINH
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CK_TUOI_GV CHECK( YEAR(GETDATE())- YEAR(NGSINH) >= 22)
GO

--14. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không
--quá 3.
--BẢNG: MONHOC
--RB: |TCLT-TCTH| <= 3
UPDATE MONHOC
SET TCLT = 3,TCTH = 2 WHERE MAMH = 'CTRR'
UPDATE MONHOC
SET TCLT = 3, TCTH = 1 WHERE MAMH = 'HDH'
GO

ALTER TABLE MONHOC
ADD CONSTRAINT CK_LT_TH CHECK (ABS(TCLT-TCTH) <=3)
GO

--15. Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
--BẢNG: KETQUATHI,GIANGDAY, HOCVIEN
--TRIGGER: KETQUATHI.NGTHI > GIANGDAY.DENNGAY khi cùng MAMH
CREATE TRIGGER insert_dk_dethi
ON KETQUATHI
FOR INSERT 
AS
BEGIN
	DECLARE @MAHV CHAR(5)
	DECLARE @MAMH VARCHAR(10), @NGTHI SMALLDATETIME
	DECLARE @MALOP CHAR(3), @DENNGAY SMALLDATETIME

	SELECT @MAHV = MAHV, @MAMH = MAMH, @NGTHI = NGTHI
	FROM inserted

	SELECT @MALOP = MALOP
	FROM HOCVIEN
	WHERE MAHV = @MAHV

	SELECT @DENNGAY = DENNGAY
	FROM GIANGDAY
	WHERE MAMH = @MAMH AND MALOP = @MALOP

	IF(@DENNGAY > @NGTHI)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Học viên chỉ được thi môn học khi lớp của học viên đã học xong môn này.'
			ROLLBACK TRANSACTION 
		END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update_dk_dethi
ON KETQUATHI
FOR INSERT 
AS 
IF (UPDATE(MAHV) OR UPDATE(MAMH) OR UPDATE(MAHV))
BEGIN
	DECLARE @MAHV CHAR(5)
	DECLARE @MAMH VARCHAR(10), @NGTHI SMALLDATETIME
	DECLARE @MALOP CHAR(3), @DENNGAY SMALLDATETIME

	SELECT @MAHV = MAHV, @MAMH = MAMH, @NGTHI = NGTHI
	FROM inserted

	SELECT @MALOP = MALOP
	FROM HOCVIEN
	WHERE @MAHV = MAHV

	SELECT @DENNGAY = DENNGAY
	FROM GIANGDAY
	WHERE @MAMH = MAMH AND @MALOP = MALOP

	IF(@DENNGAY > @NGTHI)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Học viên chỉ được thi môn học khi lớp của học viên đã học xong môn này.'
			ROLLBACK TRANSACTION 
		END
	ELSE PRINT N'Thành công!'
END
GO

--16. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
--BẢNG: GIANGDAY
--TRIGGER: COUNT(MAMH)G(MALOP,NAM,HOCKY) <= 3

CREATE TRIGGER insert_somon_toida_1lop
ON GIANGDAY
FOR INSERT
AS
BEGIN
	DECLARE @SOMON SMALLINT
	DECLARE @NAM SMALLINT, @HOCKY TINYINT, @MALOP CHAR(3)

	SELECT @NAM = NAM, @HOCKY = HOCKY, @MALOP = MALOP
	FROM inserted

	SELECT @SOMON = COUNT(MAMH)
	FROM GIANGDAY
	WHERE NAM = @NAM AND HOCKY = @HOCKY AND @MALOP = MALOP

	IF(@SOMON > 3)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.'
			ROLLBACK TRANSACTION
		END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update_somon_toida_1lop
ON GIANGDAY
FOR INSERT
AS
IF (UPDATE(MAMH) OR UPDATE(MALOP) OR UPDATE(NAM) OR UPDATE(HOCKY))
BEGIN
	DECLARE @SOMON SMALLINT
	DECLARE @NAM SMALLINT, @HOCKY TINYINT, @MALOP CHAR(3)

	SELECT @NAM = NAM, @HOCKY = HOCKY, @MALOP = MALOP
	FROM inserted

	SELECT @SOMON = COUNT(MAMH)
	FROM GIANGDAY
	WHERE NAM = @NAM AND HOCKY = @HOCKY AND @MALOP = MALOP

	IF(@SOMON > 3)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.'
			ROLLBACK TRANSACTION
		END
	ELSE PRINT N'Thành công!'
END
GO

--17. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
--BẢNG: LOP,HOCVIEN
--TRIGGER: SISO == COUNT(MAHV)WHERE(HOCVIEN.MALOP = LOP.MALOP)

CREATE TRIGGER insert_ktra_siso
ON LOP
FOR INSERT
AS
BEGIN
	DECLARE @SISO TINYINT, @MALOP CHAR(3)
	DECLARE @SOHV TINYINT

	SELECT @SISO = SISO, @MALOP = MALOP
	FROM inserted

	SELECT @SOHV = COUNT(MAHV)
	FROM HOCVIEN
	WHERE MALOP = @MALOP

	IF(@SISO <> @SOHV)
		BEGIN
		PRINT N'Đã xảy ra lỗi. Sĩ số lớp phải bằng số học viên của lớp.'
		ROLLBACK TRANSACTION
		END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update__ktra_siso
ON LOP
FOR INSERT
AS
IF(UPDATE(MALOP) OR UPDATE(SISO))
BEGIN
	DECLARE @SISO TINYINT, @MALOP CHAR(3)
	DECLARE @SOHV TINYINT

	SELECT @SISO = SISO, @MALOP = MALOP
	FROM inserted

	SELECT @SOHV = COUNT(MAHV)
	FROM HOCVIEN
	WHERE MALOP = @MALOP

	IF(@SISO <> @SOHV)
		BEGIN
		PRINT N'Đã xảy ra lỗi. Sĩ số lớp phải bằng số học viên của lớp.'
		ROLLBACK TRANSACTION
		END
	ELSE PRINT N'Thành công!'
END
GO

--18. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng
--một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và
--(“B”,”A”).
--BẢNG: DIEUKIEN
--TRIGGER: ko tồn tại cặp (A,A), có (A,B) thì không có (B,A)

CREATE TRIGGER insert_dieukien_montienquyet
ON DIEUKIEN
FOR INSERT 
AS
BEGIN
	DECLARE @MAMH VARCHAR(10), @MAMH_TRUOC VARCHAR(10)
	DECLARE @SOCAPTRUNG TINYINT

	SELECT @MAMH = MAMH, @MAMH_TRUOC = @MAMH_TRUOC
	FROM inserted

	SELECT @SOCAPTRUNG = COUNT(MAMH)
	FROM DIEUKIEN
	WHERE MAMH = @MAMH_TRUOC AND MAMH_TRUOC = @MAMH

	IF (@MAMH = @MAMH_TRUOC OR @SOCAPTRUNG > 0)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Cặp (MAMH,MAMH_TRUOC) không thuộc trường hợp (A,A) hay trường hợp (B,A) nếu (A,B) đã có.'
		ROLLBACK TRANSACTION 
	END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update_dieukien_montienquyet
ON DIEUKIEN
FOR INSERT 
AS
IF (UPDATE(MAMH) OR UPDATE(MAMH_TRUOC))
BEGIN
	DECLARE @MAMH VARCHAR(10), @MAMH_TRUOC VARCHAR(10)
	DECLARE @SOCAPTRUNG TINYINT

	SELECT @MAMH = MAMH, @MAMH_TRUOC = @MAMH_TRUOC
	FROM inserted

	SELECT @SOCAPTRUNG = COUNT(MAMH)
	FROM DIEUKIEN
	WHERE MAMH = @MAMH_TRUOC AND MAMH_TRUOC = @MAMH

	IF (@MAMH = @MAMH_TRUOC OR @SOCAPTRUNG > 0)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Cặp (MAMH,MAMH_TRUOC) không thuộc trường hợp (A,A) hay trường hợp (B,A) nếu (A,B) đã có.'
		ROLLBACK TRANSACTION 
	END
	ELSE PRINT N'Thành công!'
END
GO

--19. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
--BẢNG: GIAOVIEN
--TRIGGER: Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
CREATE TRIGGER insert_ktra_mucluong
ON GIAOVIEN
FOR INSERT
AS 
BEGIN
	DECLARE @HOCVI VARCHAR(10), @HOCHAM VARCHAR (10), @HESO TINYINT
	DECLARE @MUCLUONG1 MONEY, @MUCLUONG2 MONEY

	SELECT @HOCVI = HOCVI, @HOCHAM = HOCHAM, @HESO = HESO, @MUCLUONG1 = MUCLUONG
	FROM inserted

	SELECT @MUCLUONG2 = MUCLUONG
	FROM GIAOVIEN
	WHERE HOCVI = @HOCVI AND HOCHAM = @HOCHAM AND HESO = @HESO

	IF(@MUCLUONG2 IS NOT NULL AND @MUCLUONG1 <> @MUCLUONG2)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.'
		ROLLBACK TRANSACTION
	END
END
GO

CREATE TRIGGER update_ktra_mucluong
ON GIAOVIEN
FOR INSERT
AS 
IF(UPDATE(HOCVI) OR UPDATE(HOCHAM) OR UPDATE(HESO))
BEGIN
	DECLARE @HOCVI VARCHAR(10), @HOCHAM VARCHAR (10), @HESO TINYINT
	DECLARE @MUCLUONG1 MONEY, @MUCLUONG2 MONEY

	SELECT @HOCVI = HOCVI, @HOCHAM = HOCHAM, @HESO = HESO, @MUCLUONG1 = MUCLUONG
	FROM inserted

	SELECT @MUCLUONG2 = MUCLUONG
	FROM GIAOVIEN
	WHERE HOCVI = @HOCVI AND HOCHAM = @HOCHAM AND HESO = @HESO

	IF(@MUCLUONG2 IS NOT NULL AND @MUCLUONG1 <> @MUCLUONG2)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.'
		ROLLBACK TRANSACTION
	END
END
GO

--20. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
--BẢNG: KETQUATHI
--TRIGGER: @LANTHI > 1, DIEM < 5 WHERE LANTHI = @LANTHI-1
CREATE TRIGGER insert_ktra_dk_diem_dethilai
ON KETQUATHI
FOR INSERT 
AS
BEGIN
	DECLARE @LANTHI TINYINT, @DIEM TINYINT, @MAHV CHAR(5), @MAMH VARCHAR(10)
	
	SELECT @LANTHI = LANTHI, @MAHV = MAHV, @MAMH = MAMH
	FROM inserted

	IF (@LANTHI > 1)
	BEGIN
		SELECT @DIEM = DIEM
		FROM KETQUATHI
		WHERE LANTHI = @LANTHI -1 AND MAHV = @MAHV AND MAMH = @MAMH

		IF(@DIEM >=5 and @DIEM IS NOT NULL)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Học viên muốn thi lại phải có điểm của lần thi trước đó < 5.'
			ROLLBACK TRANSACTION
		END
	END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update_ktra_dk_diem_dethilai
ON KETQUATHI
FOR UPDATE
AS
IF(UPDATE(MAHV) OR UPDATE(MAMH) OR UPDATE(LANTHI))
BEGIN
	DECLARE @LANTHI TINYINT, @DIEM1 TINYINT, @MAHV CHAR(5), @MAMH VARCHAR(10)
	DECLARE @DIEM2 TINYINT

	SELECT @LANTHI = LANTHI, @MAHV = MAHV, @MAMH = MAMH, @DIEM2=DIEM
	FROM inserted

	IF (@LANTHI > 1)
	BEGIN
		SELECT @DIEM1 = DIEM
		FROM KETQUATHI
		WHERE LANTHI = @LANTHI -1 AND MAHV = @MAHV AND MAMH = @MAMH

		IF(@DIEM1 >=5 and @DIEM1 IS NOT NULL)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Học viên muốn thi lại phải có điểm của lần thi trước đó < 5.'
			ROLLBACK TRANSACTION
		END
	END
	ELSE IF (@DIEM2 >=5)
	BEGIN
		SELECT @DIEM2 = DIEM
		FROM KETQUATHI
		WHERE LANTHI = @LANTHI + 1 AND MAHV = @MAHV AND MAMH = @MAMH

		IF(@DIEM2 IS NOT NULL)
		BEGIN
			PRINT N'Đã xảy ra lỗi. Học viên này có thi lại lần tiếp theo nên không thể cập nhật.'
			ROLLBACK TRANSACTION
		END
	END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER delete_ktra_dk_diem_dethilai
ON KETQUATHI
FOR DELETE
AS
BEGIN
	DECLARE @LANTHI TINYINT, @DIEM TINYINT, @MAHV CHAR(5), @MAMH VARCHAR(10)

	SELECT @LANTHI = LANTHI, @MAHV = MAHV, @MAMH = MAMH
	FROM deleted

	SELECT @DIEM = DIEM
	FROM KETQUATHI
	WHERE LANTHI = @LANTHI+1 AND MAHV = @MAHV AND MAMH = @MAMH

	IF(@DIEM IS NOT NULL)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Học viên có thi lần tiếp theo nên không thể xóa'
		ROLLBACK TRANSACTION
	END
	ELSE PRINT N'Thành công!'
END
GO

--21. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn
--học).
--BẢNG: KETQUATHI
--TRIGGER: phải có lần thi trước đó, ngthi1 < ngthi2
CREATE TRIGGER insert_ktra_ngthi
ON KETQUATHI
FOR INSERT
AS 
BEGIN
	DECLARE @MAHV CHAR(5), @MAMH VARCHAR(10), @LANTHI TINYINT, @NGTHI2 SMALLDATETIME, @NGTHI1 SMALLDATETIME

	SELECT @MAHV = MAHV, @MAMH = MAMH, @NGTHI2 = NGTHI, @LANTHI = LANTHI - 1
	FROM inserted

	SELECT @NGTHI1 = NGTHI
	FROM KETQUATHI
	WHERE MAHV = @MAHV AND MAMH = @MAMH AND LANTHI = @LANTHI

	IF (@NGTHI1 >= @NGTHI2 AND @LANTHI > 0)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước.'
		ROLLBACK TRANSACTION
	END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update_ktra_ngthi
ON KETQUATHI
FOR INSERT
AS
IF (UPDATE(MAHV) OR UPDATE(MAMH) OR UPDATE(LANTHI) OR UPDATE(NGTHI))
BEGIN
	DECLARE @MAHV CHAR(5), @MAMH VARCHAR(10), @LANTHI TINYINT, @NGTHI2 SMALLDATETIME, @NGTHI1 SMALLDATETIME

	SELECT @MAHV = MAHV, @MAMH = MAMH, @NGTHI2 = NGTHI, @LANTHI = LANTHI - 1
	FROM inserted

	SELECT @NGTHI1 = NGTHI
	FROM KETQUATHI
	WHERE MAHV = @MAHV AND MAMH = @MAMH AND LANTHI = @LANTHI

	IF (@NGTHI1 >= @NGTHI2 AND @LANTHI > 0)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước.'
		ROLLBACK TRANSACTION
	END
	ELSE PRINT N'Thành công!'
END
GO
	
--22. Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
-- TƯƠNG TỰ CÂU 15

--23. Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau
--khi học xong những môn học phải học trước mới được học những môn liền sau).
--BẢNG: GAINGDAY, DIEUKIEN
--TRIGGER: DENNGAY (MAMH_TRUOC) < TUNGAY (MAMH) khi cùng MAHV

CREATE TRIGGER insert_ktra_thutu_giangday
ON GIANGDAY
FOR INSERT
AS
BEGIN
	DECLARE @MALOP CHAR(3), @MAMH VARCHAR (10), @MAMH_TRUOC VARCHAR(10)
	DECLARE @DENNGAY_MHTRUOC SMALLDATETIME, @TUNGAY_MHSAU SMALLDATETIME

	SELECT @MALOP = MALOP, @MAMH = MAMH, @TUNGAY_MHSAU = TUNGAY
	FROM inserted

	SELECT @MAMH_TRUOC = MAMH_TRUOC
	FROM DIEUKIEN
	WHERE MAMH = @MAMH_TRUOC

	SELECT @DENNGAY_MHTRUOC = DENNGAY
	FROM GIANGDAY
	WHERE MALOP = @MALOP AND MAMH = @MAMH_TRUOC

	IF (@DENNGAY_MHTRUOC IS NOT NULL AND @DENNGAY_MHTRUOC >= @TUNGAY_MHSAU)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Cần môn học tiên quyết hoặc thời gian không hợp lệ'
		ROLLBACK TRANSACTION
	END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER delete__ktra_thutu_giangday
ON GIANGDAY
FOR DELETE
AS 
BEGIN
	DECLARE @MALOP CHAR(3), @MAMH VARCHAR (10), @MAMH_TRUOC VARCHAR(10)
	DECLARE @DENNGAY_MHTRUOC SMALLDATETIME, @TUNGAY_MHSAU SMALLDATETIME

	SELECT @MALOP = MALOP, @MAMH_TRUOC = MAMH, @DENNGAY_MHTRUOC = DENNGAY
	FROM deleted

	SELECT @MAMH = MAMH
	FROM DIEUKIEN
	WHERE MAMH_TRUOC = @MAMH_TRUOC

	SELECT @TUNGAY_MHSAU = TUNGAY
	FROM GIANGDAY
	WHERE MALOP = @MALOP AND MAMH = @MAMH

	IF (@TUNGAY_MHSAU IS NOT NULL AND @DENNGAY_MHTRUOC >= @TUNGAY_MHSAU)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Đây là môn học tiên quyết của môn học khác.'
		ROLLBACK TRANSACTION
	END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update_ktra_thutu_giangday
ON GIANGDAY
FOR UPDATE
AS
IF(UPDATE(MALOP) OR UPDATE(MAMH) OR UPDATE(TUNGAY) OR UPDATE(DENNGAY))
BEGIN
	DECLARE @MALOP CHAR(3)
	DECLARE @MAMH VARCHAR (10), @MAMH_TRUOC VARCHAR(10), @MAMH_SAU VARCHAR(10)
	DECLARE @DENNGAY_MHTRUOC SMALLDATETIME, @TUNGAY_MHSAU SMALLDATETIME, @TUNGAY SMALLDATETIME, @DENNGAY SMALLDATETIME

	SELECT @MALOP = MALOP, @MAMH = MAMH, @TUNGAY = TUNGAY, @DENNGAY = DENNGAY
	FROM inserted

	SELECT @MAMH_TRUOC = MAMH_TRUOC
	FROM DIEUKIEN
	WHERE MAMH = @MAMH

	SELECT @DENNGAY_MHTRUOC = DENNGAY
	FROM GIANGDAY
	WHERE MALOP = @MALOP AND MAMH = @MAMH_TRUOC

	SELECT @MAMH_SAU = MAMH
	FROM DIEUKIEN
	WHERE MAMH_TRUOC = @MAMH

	SELECT @TUNGAY_MHSAU = TUNGAY
	FROM GIANGDAY
	WHERE MALOP = @MALOP AND MAMH = @MAMH_SAU

	IF (@DENNGAY_MHTRUOC IS NOT NULL AND @DENNGAY_MHTRUOC > = @TUNGAY)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Cần môn học tiên quyết hoặc thời gian không hợp lệ'
		ROLLBACK TRANSACTION
	END
	ELSE IF (@TUNGAY_MHSAU IS NOT NULL AND @DENNGAY >= @TUNGAY_MHSAU)
	BEGIN
		PRINT N'Đã xảy ra lỗi. Đây là môn học tiên quyết của môn học khác.'
		ROLLBACK TRANSACTION
	END
	ELSE PRINT N'Thành công!'
END
GO

--24. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
--BẢNG: GIANGDAY
--TRIGGER: giaovien.makhoa = monhoc.makhoa
CREATE TRIGGER insert_ktra_giangdaymon
ON GIANGDAY
FOR INSERT
AS
BEGIN
	DECLARE @MAGV CHAR(4), @MAKHOA_GV VARCHAR(4)
	DECLARE @MAMH VARCHAR(10), @MAKHOA_MH VARCHAR(4)

	SELECT @MAGV = MAGV, @MAMH = MAMH
	FROM inserted

	SELECT @MAKHOA_MH = MAKHOA
	FROM MONHOC
	WHERE MAMH = @MAMH

	SELECT @MAKHOA_GV = MAKHOA
	FROM GIAOVIEN
	WHERE MAGV = @MAGV

	IF (@MAKHOA_GV <> @MAKHOA_MH)
	BEGIN 
		PRINT N'Đã xảy ra lỗi. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.'
	END
	ELSE PRINT N'Thành công!'
END
GO

CREATE TRIGGER update_ktra_giangdaymon
ON GIANGDAY
FOR INSERT
AS
IF (UPDATE(MAGV) OR UPDATE(MAMH))
BEGIN
	DECLARE @MAGV CHAR(4), @MAKHOA_GV VARCHAR(4)
	DECLARE @MAMH VARCHAR(10), @MAKHOA_MH VARCHAR(4)

	SELECT @MAGV = MAGV, @MAMH = MAMH
	FROM inserted

	SELECT @MAKHOA_MH = MAKHOA
	FROM MONHOC
	WHERE MAMH = @MAMH

	SELECT @MAKHOA_GV = MAKHOA
	FROM GIAOVIEN
	WHERE MAGV = @MAGV

	IF (@MAKHOA_GV <> @MAKHOA_MH)
	BEGIN 
		PRINT N'Đã xảy ra lỗi. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.'
	END
	ELSE PRINT N'Thành công!'
END
GO