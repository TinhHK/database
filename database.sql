CREATE TABLE LoaiHang (
    MaLoai int primary key,
    TenLoai nvarchar (255) not null,
    NgayTao datetime
);

CREATE TABLE MatHang (
    MaMH varchar (15) primary  key,
    TenMH nvarchar (255) not null,
    NgayTao datetime null,
    SoLuong int null,
    GiaMua decimal(13,2),
    GiaBan decimal(13,2),
    Loai int,
    NhaSX varchar (150),
    CONSTRAINT MH_LH foreign key (loai) REFERENCES LoaiHang (MaLoai)
);

CREATE TABLE HinhAnh (
    MaHA int primary key,
    NgayTao datetime,
    Ten varchar(100),
    Ext varchar(10),
    MaMH varchar(15),
    CONSTRAINT HA_MH foreign key (MaMH) references MatHang(MaMH)
);

CREATE TABLE DonHang (
    SoDH int auto_increment primary key,
    NgayDat datetime,
    LoaiThanhToan int,
    DCGiaoHang text,
    KhachHang int not null,
    HinhThucVanChuyen int,
    SoLuong int
    
);

CREATE TABLE TTDonHang (
    soDonHang int not null,
    STT int not null,
    NgayTao datetime,
    TrangThai int,
    NVPhuTrach int
);

CREATE TABLE ChiTietDonHang (
    MaMH varchar(15),
    SoDH int,
    primary key (MaMH, SoDH)
);

CREATE TABLE HoaDon (
    SoHD int auto_increment primary key,
    NgayTao datetime,
    PhiVanChuyen decimal(13,2),
    SoDH int 
);

CREATE TABLE KhachHang (
    MaKH int auto_increment primary key,
    HoTen nvarchar(255),
    Ho nvarchar(255) not null,
    Ten nvarchar(255) not null,
    NgaySinh datetime,
    Email nvarchar(255) not null,
    DienThoai varchar(15),
    LoaiKH int
);

CREATE TABLE TaiKhoanMXH (
    SoTK varchar(255),
    MatKhau varchar(255),
    LoaiTK int,
    MaKH int not null,
    NgayTao datetime,
    primary key (SoTK, MatKhau)
    
);

CREATE TABLE NhanVien (
    MaNV int auto_increment primary key,
    HoTen nvarchar(255),
    Ho nvarchar(255) not null,
    Ten nvarchar(255) not null,
    NgayTao datetime,
    DienThoai varchar(15),
    DiaChi text,
    ChucVu int,
    PhongBan int
);

CREATE TABLE PhongBan (
    MaPB int auto_increment primary key,
    TenPB nvarchar(255),
    NgayTao datetime
);

CREATE TABLE NhaSX (
    MaNSX varchar(10) primary key,
    Ten text,
    Email nvarchar(255),
    NgayTao datetime,
    DiaChi text,
    DienThoai varchar(15)
);

CREATE TABLE PhieuNhap (
    SoPhieu int auto_increment primary key,
    TongSL int,
    NgayNhap datetime,
    NhaSX varchar(10)
);

-- Tao Khoa ngoai
alter table donhang add constraint FK_DH_KH foreign key (KhachHang) references khachhang (MaKH);
alter table ttdonhang add constraint FK_TTDH_HD foreign key (SoDonHang) references DonHang (SoDH);
alter table ttdonhang add constraint FK_TTDH_NV foreign key (NVPhuTrach) references NhanVien (MaNV);
alter table chitietdonhang add constraint FK_CTTDH_MH foreign key (MaMH) references mathang (MaMH);
alter table chitietdonhang add constraint FK_CTTDH_DH foreign key (SoDH) references donhang (SoDH);
alter table taikhoanmxh add constraint FK_TKMXH_HK foreign key (MaKH) references khachhang (MaKH);
alter table nhanvien add constraint FK_NV_PB foreign key (PhongBan) references phongban (MaPB);
alter table phieunhap add constraint FK_PN_NSX foreign key (NhaSX) references nhasx (MaNSX);