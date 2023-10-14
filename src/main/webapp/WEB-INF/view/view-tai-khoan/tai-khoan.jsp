<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>QUAN_LY_TAI_KHOAN</title>
    <link rel="stylesheet" href=".././css/custom/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<header>
    <div class="container">
        <div class="tieuDe">
            <br>
            <h3 style="text-align: center">QUAN_LY_TAI_KHOAN</h3>
            <br>
            <hr>
        </div>
    </div>
</header>
<section>
    <div class="container">
        <div class="row">
            <div class="col-3">

            </div>
            <div class="col-6">
                <form method="post" action="/view-tai-khoan/add">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="ma" value="${taiKhoan.ma}" required>
                        <label>MA</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="hoTen" value="${taiKhoan.hoTen}" required>
                        <label>HO_VA_TEN</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="ngaySinh" value="${taiKhoan.ngaySinh}" required>
                        <label>TEN</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" name="email" value="${taiKhoan.email}" required>
                        <label>EMAIL</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="soDienThoai" value="${taiKhoan.soDienThoai}" required>
                        <label>SO_DIEN_THOAI</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="diaChi" value="${taiKhoan.diaChi}" required>
                        <label>DIA_CHI</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="taiKhoan" value="${taiKhoan.taiKhoan}" required>
                        <label>TAI_KHOAN</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="matKhau" value="${taiKhoan.matKhau}" required>
                        <label>MAT_KHAU</label>
                    </div>
                    <div class="form-floating mb-3">
                        <p>TRANG_THAI:</p>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="vaiTro" value="KHACH_HANG" checked>
                            <label class="form-check-label">KHACH_HANG</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="vaiTro" value="NHAN_VIEN">
                            <label class="form-check-label">NHAN_VIEN</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="vaiTro" value="QUAN_LY">
                            <label class="form-check-label">QUAN_LY</label>
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <p>TRANG_THAI:</p>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="trangThai" value="1" checked>
                            <label class="form-check-label">TOT</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="trangThai" value="2">
                            <label class="form-check-label">TRUNG_BINH</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="trangThai" value="3">
                            <label class="form-check-label">KEM</label>
                        </div>
                    </div>
                    <br>
                    <hr>
                    <button type="submit" class="btn btn-success">ADD</button>
                    <a href="/ban-hang/quan-ly-san-pham" type="submit" class="btn btn-success">QUẢN LÝ SẢN PHẨM</a>
                    <br>
                    <hr>
                </form>
            </div>
            <div class="col-3">

            </div>
        </div>
        <br>
        <hr>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">MA</th>
                <th scope="col">HO_TEN</th>
                <th scope="col">NGAY_SINH</th>
                <th scope="col">EMAIL</th>
                <th scope="col">SO_DIEN_THOAI</th>
                <th scope="col">DIA_CHI</th>
                <th scope="col">TAI_KHOAN</th>
                <th scope="col">MAT_KHAU</th>
                <th scope="col">VAI_TRO</th>
                <th scope="col">TRANG_THAI</th>
                <th scope="col">ACTION</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listTaiKhoans}" var="taiKhoan">
                <tr>
                    <td>${taiKhoan.ma}</td>
                    <td>${taiKhoan.hoTen}</td>
                    <td>${taiKhoan.ngaySinh}</td>
                    <td>${taiKhoan.email}</td>
                    <td>${taiKhoan.soDienThoai}</td>
                    <td>${taiKhoan.diaChi}</td>
                    <td>${taiKhoan.taiKhoan}</td>
                    <td>${taiKhoan.matKhau}</td>
                    <td>${taiKhoan.vaiTro}</td>
                    <td>${taiKhoan.trangThai==1?"TOT":taiKhoan.trangThai==2?"TRUNG_BINH":"KEM"}</td>
                    <td>
                        <a href="/view-tai-khoan/detail/${taiKhoan.id}" class="btn btn-success">DETAIL</a>
                        <a href="/view-tai-khoan/view-update/${taiKhoan.id}" class="btn btn-warning">UPDATE</a>
                        <a href="/view-tai-khoan/delete/${taiKhoan.id}" class="btn btn-danger">DELETE</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>
<footer>

</footer>
<script>
    var message = "${message}";
    if (message) {
        alert(message);
    }






</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
</body>
</html>