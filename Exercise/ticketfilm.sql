create database TicketFilm;
use TicketFilm;

create table tblPhong(
PhongID int primary key,
Ten_Phong varchar(20),
Trang_Thai tinyint
);

create table tblGhe(
GheID int primary key,
PhongID int,
So_ghe varchar(10),
foreign key(PhongID) references tblPhong(PhongID)
);

create table tblPhim(
PhimID int primary key,
Ten_phim varchar(30),
Loai_phim varchar(25),
Thoi_gian int
);

create table tblVe(
PhimID int,
GheID int,
Ngay_chieu datetime,
Trang_thai varchar(20),
foreign key (PhimID) references tblPhim(PhimID),
foreign key (GheID) references tblGhe(GheID)
);

INSERT INTO tblPhong value
(1,'Phòng chiếu 1',1),
(2,'Phòng chiếu 2',1),
(3,'Phòng chiếu 3',0);

INSERT INTO tblGhe value
(1,1,'A3'),
(2,1,'B5'),
(3,2,'A7'),
(4,2,'D1'),
(5,3,'T2');

INSERT INTO tblPhim value
(1,'Em bé Hà Nội','Tâm Lý',90),
(2,'Nhiệm vụ bất khả thi','Hành động',100),
(3,'Dị nhân','Viễn tưởng',90),
(4,'Cuốn thoe chiều gió','Tình cảm',120);

INSERT INTO tblVe value
(1,1,'2008-10-20','Đã bán'),
(1,3,'2008-11-20','Đã bán'),
(1,4,'2008-12-23','Đã bán'),
(2,1,'2009-02-14','Đã bán'),
(3,1,'2009-02-14','Đã bán'),
(2,5,'2009-03-08','Chưa bán'),
(2,3,'2009-03-08','Chưa bán');


-- Câu 2 : Hiển thị danh sách các phim (chú ý: danh sách phải được sắp xếp theo trường Thoi_gian)
select * from tblphim order by Thoi_gian;

-- Câu 3 : Hiển thị Ten_phim có thời gian chiếu dài nhất
select tblphim.Ten_phim,max(Thoi_gian) from tblphim;
 
-- Câu 4 : Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
select tblphim.Ten_phim,min(Thoi_gian) from tblphim;

-- Câu 5 : Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
select *
from tblghe
where So_ghe like 'A%';

-- Câu 6 : Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)			
alter table tblPhong
change column Trang_thai Trang_thai varchar(25);

-- Câu 7 : Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật sau:			
-- 			Nếu Trang_thai=0 thì gán Trang_thai=’Đang sửa’
-- 			Nếu Trang_thai=1 thì gán Trang_thai=’Đang sử dụng’
-- 			Nếu Trang_thai=null thì gán Trang_thai=’Unknown’
-- 			Sau đó hiển thị bảng tblPhong 
update tblPhong set Trang_thai =(
select case Trang_thai 
	   when Trang_thai = '0' then 'Đang Sửa'
	   when Trang_thai = '1' then 'Đang sử dụng'
       else 'Unknown'
       end
)
where PhongID > 0;

-- Câu 8 : Hiển thị danh sách tên phim mà  có độ dài >15 và < 25 ký tự 			
select  * from tblphim having length(Ten_phim) between 15 and 25;

-- Câu 9 : Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong  trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’
select (concat(tblPhong.Ten_phong,tblPhong.Trang_thai)) as `Trạng thái phòng chiếu` from tblphong;

-- Câu 10 : Tạo bảng mới có tên tblRank với các cột sau: STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian
create table tblRank(
select Ten_phim,Thoi_gian from tblPhim order by Ten_phim
);

-- Câu 11 : Trong bảng tblPhim :
-- 			Thêm trường Mo_ta kiểu nvarchar(max)						
-- 			Cập nhật trường Mo_ta: thêm chuỗi “Đây là bộ phim thể loại  ” + nội dung trường LoaiPhim										
-- 			Hiển thị bảng tblPhim sau khi cập nhật				
-- 			Cập nhật trường Mo_ta: thay chuỗi “bộ phim” thành chuỗi “film”
-- 			Hiển thị bảng tblPhim sau khi cập nhật	
alter table tblphim
add column Mo_ta nvarchar(255) null after Thoi_gian;
update tblPhim set Mo_ta =(concat('Đây là bộ phim thể loại ',tblPhim.Loai_phim)) where PhimID > 0 ;
select * from tblPhim;
update tblPhim set Mo_ta =(concat('Đây là phim thể loại ',tblPhim.Loai_phim)) where PhimID > 0 ;
select * from tblPhim;
-- Câu 12 : Xóa tất cả các khóa ngoại trong các bảng trên.						


-- Câu 13 : Xóa dữ liệu ở bảng tblGhe


-- Câu 14 : Hiển thị ngày giờ hiện tại và ngày giờ hiện tại cộng thêm 5000 phút
