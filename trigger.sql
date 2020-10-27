use webbangiayphp;

-- phiếu nhập
-- cập nhật số lượng trong bảng sản phẩm sau khi thêm mới chi tiết phiếu nhập
-- cập nhật tổng tiền trong bảng phiếu nhập sau khi thêm chi tiết phiếu nhập
-- cập nhật giá bán trong bảng sản phẩm sau khi thêm chi tiết phiếu nhập
DELIMITER $$
create trigger after_coupon_detail_insert
after insert on webbangiayphp.chi_tiet_phieu_nhaps
for each row
begin
	declare muc1 double(15,2) default 500000;
    declare muc2 double(15,2) default 2000000;
    declare muc3 double(15,2) default 10000000;
    declare muc4 double(15,2) default 20000000;
    declare muc5 double(15,2) default 50000000;
    declare muc6 double(15,2) default 100000000;
	declare masp bigint(20);
    declare slpn int(11) default 0;
    declare slsp int(11) default 0;
    declare gia_nhap double(15,2);
    declare gia_ban double(15,2);
    declare tong_tien double(15,2);
    
	set masp = NEW.ma_san_pham;
    set slpn = NEW.so_luong;
    set gia_nhap = NEW.gia_nhap;
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = NEW.ma_san_pham);
    set tong_tien = (select tong_tien from webbangiayphp.phieu_nhaps where phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap);
	update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp+slpn) 
	where webbangiayphp.san_phams.ma_san_pham = masp;
    update webbangiayphp.phieu_nhaps set webbangiayphp.phieu_nhaps.tong_tien = (tong_tien + slpn*gia_nhap) 
	where webbangiayphp.phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap;
	case gia_nhap 
		when gia_nhap<=muc1 then set gia_ban = (gia_nhap*1.2);
		when gia_nhap>muc1 and gia_nhap<=muc2 then set gia_ban = (gia_nhap*1.15);
		when gia_nhap>muc2 and gia_nhap<=muc3 then set gia_ban = (gia_nhap*1.1);
		when gia_nhap>muc3 and gia_nhap<=muc4 then set gia_ban = (gia_nhap*1.08);
		when gia_nhap>muc4 and gia_nhap<=muc5 then set gia_ban = (gia_nhap*1.04);
		when gia_nhap>muc5 and gia_nhap<=muc6 then set gia_ban = (gia_nhap*1.02);
		else set gia_ban = (gia_nhap*1.01);
	end case;
    update webbangiayphp.san_phams set webbangiayphp.san_phams.gia_ban = gia_ban where san_phams.ma_san_pham = masp;
end $$

-- cập nhật số lượng trong bảng sản phẩm sau khi xóa (update isActive) chi tiết phiếu nhập và isActive = false
-- cập nhật tổng tiền trong bảng phiếu nhập sau khi xóa (update isActive) chi tiết phiếu nhập
DELIMITER $$
create trigger after_coupon_detail_delete
after update on webbangiayphp.chi_tiet_phieu_nhaps
for each row
begin
	declare masp bigint(20);
    declare slpn int(11) default 0;
    declare slsp int(11) default 0;
    declare isActive tinyint(1);
    declare gia_nhap double(15,2);
    declare tong_tien double(15,2);
    
    set gia_nhap = NEW.gia_nhap;
    set tong_tien = (select tong_tien from webbangiayphp.phieu_nhaps where phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap);
	set masp = NEW.ma_san_pham;
    set slpn = NEW.so_luong;
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set isActive = NEW.isActive;
    if isActive = 0 then
		update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp-slpn) 
		where webbangiayphp.san_phams.ma_san_pham = masp;
        update webbangiayphp.phieu_nhaps set webbangiayphp.phieu_nhaps.tong_tien = (tong_tien - slpn*gia_nhap) 
		where webbangiayphp.phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap;
    end if;
end $$

-- cập nhật số lượng trong bảng sản phẩm sau khi xóa (update isActive) phiếu nhập sang false
DELIMITER $$
create trigger after_coupon_delete
after update on webbangiayphp.phieu_nhaps
for each row
begin
	declare isActive tinyint(1); 
    declare mapn int(11);
    set mapn = NEW.ma_phieu_nhap;
    set isActive = NEW.isActive;
    update webbangiayphp.chi_tiet_phieu_nhaps set webbangiayphp.chi_tiet_phieu_nhaps.isActive = 0
    where webbangiayphp.chi_tiet_phieu_nhaps.ma_phieu_nhap = mapn;
end $$


-- hóa đơn
-- cập nhật số lượng trong bảng sản phẩm sau khi thêm mới chi tiết hóa đơn và số lượng sản phẩm >= số lượng sản phẩm trong hóa đơn
-- cập nhật tổng tiền trong bảng hóa đơn sau khi thêm chi tiết hóa đơn
-- cập nhật thành tiền trong bảng hóa đơn sau khi thêm chi tiết hóa đơn
DELIMITER $$
create trigger after_bill_detail_insert
after insert on webbangiayphp.chi_tiet_hoa_dons
for each row
begin
	declare masp bigint(20);
    declare slhd int(11) default 0;
    declare slsp int(11) default 0;
    declare gia_ban double(15,2);
    declare gia_ban_sp double(15,2);
    declare tong_tien double(15,2);
    declare ma_voucher int(11);
    declare muc_voucher int(11);
    declare muc_km int(11) default 0;
    declare ngay_lap date;
    
	set masp = NEW.ma_san_pham;
    set ngay_lap = (select ngay_lap from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    set gia_ban_sp = (select gia_ban from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set slhd = NEW.so_luong;
    
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set muc_km = (select muc_khuyen_mai from webbangiayphp.khuyen_mai_san_phams where khuyen_mai_san_phams.ma_san_pham = masp 
    and khuyen_mai_san_phams.ma_ngay_khuyen_mai = 
    (select ma_ngay_khuyen_mai from webbangiayphp.ngay_khuyen_mais where ngay_khuyen_mais.ngay_gio = ngay_lap));
    if muc_km != 0 then
		set gia_ban = gia_ban_sp*(1-muc_km/100);
    end if;
    set tong_tien = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    set ma_voucher = (select ma_voucher from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    if ma_voucher is not null then
		set muc_voucher = (select muc_voucher from webbangiayphp.vouchers where vouchers.ma_voucher = ma_voucher);
    end if;
    if slsp >= slhd then
		update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp-slhd) 
		where webbangiayphp.san_phams.ma_san_pham = masp;
        update webbangiayphp.hoa_dons set webbangiayphp.hoa_dons.tong_tien = (tong_tien + gia_ban*slhd) 
		where webbangiayphp.hoa_dons.ma_hoa_don = NEW.ma_hoa_don;
    end if;
    set tong_tien = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    if ma_voucher is not null then
		update webbangiayphp.hoa_dons set webbangiayphp.hoa_dons.thanh_tien = (tong_tien*(1-muc_voucher/100)) 
		where webbangiayphp.hoa_dons.ma_hoa_don = NEW.ma_hoa_don;
        
        update webbangiayphp.vouchers set webbangiayphp.vouchers.isActive = 0 
        where webbangiayphp.vouchers.ma_voucher = ma_voucher;
    end if;
end $$

-- cập nhật số lượng trong bảng sản phẩm sau khi xóa (update isActive) chi tiết hóa đơn và isActive = false
-- cập nhật tổng tiền trong bảng hóa đơn sau khi xóa (update isActive) chi tiết hóa đơn
DELIMITER $$
create trigger after_bill_detail_delete
after update on webbangiayphp.chi_tiet_hoa_dons
for each row
begin
	declare masp bigint(20);
    declare slhd int(11) default 0;
    declare slsp int(11) default 0;
    declare isActive tinyint(1);
    declare gia_ban double(15,2);
    declare tong_tien double(15,2);
    
	set masp = NEW.ma_san_pham;
    set slhd = NEW.so_luong;
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set isActive = NEW.isActive;
    set gia_ban = NEW.gia_ban;
    set tong_tien = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    if isActive = 0 then
		update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp+slpn) 
		where webbangiayphp.san_phams.ma_san_pham = masp;
        update webbangiayphp.hoa_dons set webbangiayphp.hoa_dons.tong_tien = (tong_tien - gia_ban*slhd) 
		where webbangiayphp.hoa_dons.ma_hoa_don = NEW.ma_hoa_don;
    end if;
end $$

-- cập nhật số lượng trong bảng sản phẩm sau khi xóa (update isActive) hóa đơn sang false
DELIMITER $$
create trigger after_bill_delete
after update on webbangiayphp.hoa_dons
for each row
begin
	declare isActive tinyint(1); 
    declare mahd int(11);
    set mahd = NEW.ma_hoa_don;
    set isActive = NEW.isActive;
    update webbangiayphp.chi_tiet_hoa_dons set webbangiayphp.chi_tiet_hoa_dons.isActive = 0
    where webbangiayphp.chi_tiet_hoa_dons.ma_hoa_don = mahd;
end $$


-- tặng voucher sau khi khách hàng tạo tài khoản
DELIMITER $$
create trigger after_account_create
after insert on webbangiayphp.tai_khoans
for each row
begin
    declare makh bigint(20);
    declare loaitk varchar(255);
    set makh = NEW.ma_tai_khoan;
    set loaitk = NEW.loai_tai_khoan;
    if loaitk = 'KH' then
		insert into webbangiayphp.vouchers (ma_khach_hang, muc_voucher) values (makh, 50);
    end if;
end $$

-- tặng voucher sau khi khách hàng mua >= 10 đôi giày
DELIMITER $$
create trigger after_bill_insert
after insert on webbangiayphp.hoa_dons
for each row
begin
	declare isActive tinyint(1); 
    declare mahd bigint(20);
    declare makh int(11);
    declare so_luong int(11) default 0;
    declare sl int(11);
    declare muc_voucher int(11) default 0;
    
    declare list_mahd cursor for (select ma_hoa_don from webbangiayphp.hoa_dons where webbangiayphp.hoa_dons.ma_khach_hang = makh and hoa_dons.isActive = 1);
    set makh = NEW.ma_khach_hang;
    open list_mahd;
		fetch list_mahd into mahd;
        set sl = (select sum(so_luong) from webbangiayphp.chi_tiet_hoa_dons where chi_tiet_hoa_dons.ma_hoa_don = hoa_dons.ma_hoa_don);
        set so_luong = so_luong + sl;
    close list_mahd;
    case so_luong
		when so_luong = 5 then set muc_voucher = so_luong;
		when so_luong = 10 then set muc_voucher = so_luong;
        when so_luong = 15 then set muc_voucher = so_luong;
        when so_luong % 5 = 0 and so_luong >= 20 then set muc_voucher = 20;
    end case;
    if muc_voucher > 0 then
		insert into vouchers (ma_khach_hang, muc_voucher) values (makh, muc_voucher);
    end if;
end $$
