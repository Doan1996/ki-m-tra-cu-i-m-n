create database if not exists quan_ly_phong_kham;
use quan_ly_phong_kham;

create table bang_beng_nhan (
benhnhan_id varchar(10) primary key not null,
ho_ten varchar(100) not null,
email varchar(100) not null unique,
so_dien_thoai varchar(15) not null,
dia_chi varchar(200)
);

create table bang_dich_vu (
dichvu_id varchar(10) primary key not null,
ten_dich_vu varchar(150) not null unique,
gia_dich_vu decimal(12,2) not null ,
trang_thai varchar(50) not null default'Hoạt động',
thoi_gian_uoc_tinh int not null,
check (gia_dich_vu > 0)
);
create table bang_phieu_kham(
phieukham_id int primary key not null auto_increment,
benhnhan_id varchar(10) not null,
foreign key (benhnhan_id) 
references bang_beng_nhan(benhnhan_id),
dichvu_id varchar(10) not null,
foreign key (dichvu_id)
references bang_dich_vu(dichvu_id),
ngay_kham date not null,
ngay_tai_kham date,
tong_tien decimal(12,2)
);
create table bang_hoa_don(
hoadon_id int primary key not null auto_increment,
phieukham_id int not null,
foreign key (phieukham_id )
references bang_phieu_kham(phieukham_id),
phuong_thuc_tt varchar(50),
ngay_tt date not null,
so_tien_tt  decimal(12,2) not null,
check (so_tien_tt > 0)
);

-- chèn dữ liệu vào bảng
insert into bang_beng_nhan
values
('BN001' , 'Nguyen Anh Tu' , 'tu.nguyen@example.com' , '0912345678' , 'Hanoi,VietNam'),
('BN002' , 'Tran Thi Mai' , 'mai.tran@example.com' , '0923456789' , 'Ho Chi Minh'),
('BN003' , 'Le Minh Hoang' , ' hoang.le@example.com' , '0934567890' , 'Dannang,VietNam'),
('BN004' , 'Pham Hoang Nam' , ' nam.pham@example.com' , '0945678901' , 'Hue,VietNam'),
('BN005' , 'Vu Minh Thu' , ' thu.vu@example.com' , '0956789012' , 'HaiPhong,VietNam'),
('BN006' , 'Nguyen Thi Lan' , ' lan.nguyen@example.com' , '0967890123' , 'QuangNinh,VietNam'),
('BN007' , 'Bui Minh Tuan' , ' tuan.bui@example.com' , '0978901234' , 'BacGiang,VietNam'),
('BN008' , 'Pham Quang Hieu' , ' hieu.pham@example.com' , '0989012345' , 'QuangNam,VietNam');
select * from bang_beng_nhan;

insert into bang_dich_vu
values
('DV001' , 'Khám tổng quát' , 200.0 , 'Hoạt động' , 30),
('DV002' , 'Chụp X-Quang' , 150.0 , 'Tạm Ngưng' , 15),
('DV003' , 'Xét Nghiệm Máu' , 300.0 , 'Hoạt động' , 20),
('DV004' , 'Siêu âm 4D' , 400.0 , 'Hoạt động' , 45),
('DV005' , 'Khám chuyên khoa' , 200.0 , 'Hoạt động' , 30),
('DV006' , 'Nội soi dạ dày' , 500.0, 'Hoạt động' , 60),
('DV007' , 'Khám mắt' , 150.0 , 'Hoạt động' , 20),
('DV008' , 'Khám tai mũi họng' , 200.0 , 'Tạm ngưng' , 25);

select * from bang_dich_vu;

insert into bang_phieu_kham
values
(1 , 'BN001' , 'DV001' , '2026-09-01' , '2026-09-10' , 200.0),
(2 , 'BN002' , 'DV002' , '2026-09-02' , '2026-09-11' , 150.0),
(3, 'BN003' ,  'DV003' , '2026-09-03' , '2026-09-12' , 300.0),
(4 , 'BN004' , 'DV004' , '2026-09-04' , '2026-09-13' , 400.0),
(5 , 'BN005' , 'DV005' , '2026-09-05' , '2026-09-14' , 250.0),
(6 , 'BN006' , 'DV006' , '2026-09-06' , '2026-09-15' , 500.0),
(7 , 'BN007' , 'DV007' , '2026-09-07' , '2026-09-16' , 150.0),
(8 , 'BN008' , 'DV008' , '2026-09-08' , '2026-09-16' , 200.0);

select * from bang_phieu_kham;

insert into bang_hoa_don
values
(1 , 1 , 'Cash' , '2026-09-01', 200.0),
(2 , 2 , 'Credit Card' , '2026-09-02', 150.0),
(3 , 3 , 'Bank Tranfer' , '2026-09-03', 300.0),
(4,  4 , 'Cash' , '2026-09-04', 400.0),
(5 , 5 , 'Credit Card' , '2026-09-05', 250.0),
(6 , 6 , 'Banhk Transfer' , '2026-09-06', 500.0),
(7 , 7 , 'Cash' , '2026-09-07', 150.0),
(8 , 8 , 'Credit Card' , '2026-09-08', 200.0);


update bang_phieu_kham as bpk
join bang_dich_vu as bdv
on bpk.dichvu_id = bdv.dichvu_id
set bpk.tong_tien = bdv.gia_dich_vu + 50.0
where bdv.trang_thai = 'Hoạt động' and bpk.ngay_kham < curdate();

select * from bang_phieu_kham;

delete from bang_hoa_don
where phuong_thuc_tt = 'Cash'
and so_tien_tt < 200.0;


-- phan 2: truy vấn dữ liệu
-- câu 1
select 
benhnhan_id,
ho_ten,
email,
so_dien_thoai,
dia_chi
from bang_beng_nhan
order by ho_ten asc;
-- câu 2
select
dichvu_id,
ten_dich_vu,
gia_dich_vu,
thoi_gian_uoc_tinh
from bang_dich_vu
order by gia_dich_vu desc;
-- câu 3
select 
bbn.benhnhan_id,
bbn.ho_ten,
bpk.phieukham_id,
bpk.ngay_kham,
bpk.ngay_tai_kham
from bang_beng_nhan as bbn
join bang_phieu_kham as bpk
on bbn.benhnhan_id = bpk.benhnhan_id;
-- câu 4
select
bbn.benhnhan_id,
bbn.ho_ten,
bhd.phuong_thuc_tt,
bhd.so_tien_tt
from bang_beng_nhan as bbn
join bang_phieu_kham as bpk
on bbn.benhnhan_id = bpk.benhnhan_id
join bang_hoa_don as bhd
on bhd.phieukham_id = bpk.phieukham_id
order by bhd.so_tien_tt desc;

-- câu 5
select * from 
bang_beng_nhan
order by ho_ten asc
limit 3 offset 1;

-- câu 6

select 
bbn.benhnhan_id,
bbn.ho_ten,
count(distinct bpk.phieukham_id) as so_phieu_kham
from bang_beng_nhan as bbn
join bang_phieu_kham as bpk
 on bbn.benhnhan_id = bpk.benhnhan_id
left join bang_hoa_don as bhd
on bpk.phieukham_id = bhd.phieukham_id
group by bbn.benhnhan_id, bbn.ho_ten
having count(distinct  bpk.phieukham_id) >= 2
and sum(bhd.so_tien_tt) > 500.0;

-- câu 7
select 
bdv.dichvu_id,
bdv.ten_dich_vu,
bdv.gia_dich_vu,
coalesce(sum(bhd.so_tien_tt),0) as tong_tien_thanh_toan
from bang_dich_vu as bdv
join bang_phieu_kham as bpk
on bdv.dichvu_id = bpk.dichvu_id
left join bang_hoa_don as bhd
on bpk.phieukham_id = bhd.phieukham_id
group by bdv.dichvu_id,bdv.ten_dich_vu,bdv.gia_dich_vu
having coalesce(sum(bhd.so_tien_tt),0) < 1000.0
and count(distinct bpk.benhnhan_id) >= 3;

-- câu 8 
-- câu 9
-- câu 10

-- phần 3 : tạo view
-- câu 1
create view view_thong_tin_va_dich_vu as
select
bdv.dichvu_id,
bdv.ten_dich_vu,
bbn.benhnhan_id,
bbn.ho_ten
from bang_phieu_kham as bpk
join bang_dich_vu as bdv
on bpk.dichvu_id = bdv.dichvu_id
join bang_beng_nhan as bbn
on bpk.benhnhan_id = bbn.benhnhan_id
where bpk.ngay_kham < '2026-09-08';

select * from view_thong_tin_va_dich_vu;
-- câu 2

create view view_dich_vu_lon_hon_200 as
select
bbn.benhnhan_id,
bbn.ho_ten,
bdv.dichvu_id,
bdv.gia_dich_vu
from bang_phieu_kham as bpk
join bang_beng_nhan as bbn
on bpk.benhnhan_id = bbn.benhnhan_id
join bang_dich_vu as bdv
on bpk.dichvu_id = bdv.dichvu_id
where bdv.gia_dich_vu > 200.0;

select * from  view_dich_vu_lon_hon_200;

-- phần 4 : tạo trigger
-- câu 1

delimiter $$
 create trigger check_insert_phieu_kham
 before insert on bang_phieu_kham
 for each row
 begin
 if new.ngay_tai_kham < new.ngay_kham then
 signal sqlstate '45000'
 set message_text = 'Ngày tái khám không thể trước ngày khám bệnh được';
 end if;
 end
$$ delimiter ;