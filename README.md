# BackEndPHP
tutorial: download composer + setting, import file sql to phpmyadmin

# Các API hiện có:
- Lấy ra danh sách đối tượng: method=get
- Lấy ra 1 đối tượng: method=get, param=id
- thêm danh sách đối tượng: method=post
  {
    "listObj"😞
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


# Các yêu cầu cần thiết:
- database: 
* dữ liệu thật

- front end admin:
* login + authentication
* module tin tức cần link đến bài viết có sẵn trên mạng
* module hóa đơn và phiếu nhập không có action sửa

- front end user:
* login + authentication
* module giới thiệu cửa hàng và sản phẩm
* module tin tức
* module thêm sản phẩm vào giỏ hàng
* module đặt hàng
* module thêm nhận xét
