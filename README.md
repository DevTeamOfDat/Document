# BackEndPHP
tutorial: download composer + setting, import file sql to phpmyadmin

# Các lệnh cần chạy
composer install -> php artisan serve

# Lưu ý:
trong db đã có 2 accounts: admin (tk: admin@gmail.com, password: vannam212) và user (tk: user@gmail.com, vannamdeptrai)

# Các API hiện có:
- Lấy ra danh sách đối tượng: method=get
- Lấy ra 1 đối tượng: method=get, param=id
- thêm danh sách đối tượng: method=post
  {
    "listObj":[
      {
        "abc":"xyz"
      },
      {
       "abc":"xyz"
      }
    ]
  }
- thêm 1 đối tượng: method=post
  {
    "abc":"xyz"
  }
- Sửa 1 đối tượng: method=put, param=id
- xóa danh sách đối tượng: method=delete
  {
    "listId":[1,3]
  }
- xóa 1 đối tượng: method=delete
  {
    "id":1
  }

# Các loại response hiện có:
- data: đối với những response là object
- error: đối với những response là thông báo lỗi về validate, exception, thao tác thất bại, không tìm thấy
- success: đối với những response là thông báo thao tác thành công

# Ví dụ về response hiện có:
- data: {
    "data":[
      {
        "abc":"xyz"
      },
      {
       "abc":"xyz"
      }
    ]
  }
- error: {
    "error":[
      "error1",
      "error2"
    ]
  }
- success: {
    "success":[
      "success1"
    ]
  }

# Các yêu cầu cần thiết:
- API báo cáo thống kê
- database: dữ liệu thật

- front end admin:
* login + authentication
* module tin tức cần link đến bài viết có sẵn trên mạng
* module hóa đơn và phiếu nhập không có action sửa
