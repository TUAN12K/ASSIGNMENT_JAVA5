<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HÓA ĐƠN CHI TIẾT</title>
    <link rel="stylesheet" href=".././css/custom/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<style>
    <%@include file="../../css/custom/style.css"%>
</style>
<body>
<header>
    <div class="container">
        <div class="tieuDe">
            <br>
            <h3 style="text-align: center">HÓA ĐƠN CHI TIẾT</h3>
            <br>
            <hr>
        </div>
    </div>
</header>
<section>
    <div class="container">
        <br>
        <a href="/ban-hang/quan-ly-san-pham" type="submit" class="btn btn-success">QUẢN LÝ SẢN PHẨM</a>
        <hr>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">SẢN PHẨM</th>
                <th scope="col">TÊN KHÁCH</th>
                <th scope="col">TÊN SP</th>
                <th scope="col">SỐ LƯỢNG</th>
                <th scope="col">GIÁ</th>
                <th scope="col">SHIP</th>
                <th scope="col">NGƯỜI NHẬN</th>
                <th scope="col">ĐỊA CHỈ</th>
                <th scope="col">ĐIỆN THOẠI</th>
                <th scope="col">ACTION</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${hoaDonChiTietPage.getContent()}" var="hoaDonChiTiet">
                <tr>
                    <td align="center">
                        <img src="/uploads/${hoaDonChiTiet.chiTietSanPham.sanPham.anh}" width="40" height="40">
                    </td>
                    <td>${hoaDonChiTiet.hoaDon.taiKhoan.hoTen}</td>
                    <td>${hoaDonChiTiet.chiTietSanPham.sanPham.ten} -- ${hoaDonChiTiet.chiTietSanPham.nhaSanXuat.ten} -- ${hoaDonChiTiet.chiTietSanPham.boNho.ten}</td>
                    <td>${hoaDonChiTiet.soLuong}</td>
                    <td><fmt:formatNumber value="${hoaDonChiTiet.donGia}" pattern="###,###"></fmt:formatNumber> VNĐ</td>
                    <td><fmt:formatDate value="${hoaDonChiTiet.hoaDon.ngayShip}" pattern="dd/MM/yyyy" /></td>
                    <td>${hoaDonChiTiet.hoaDon.tenNguoiNhan}</td>
                    <td>${hoaDonChiTiet.hoaDon.diaChi}</td>
                    <td>${hoaDonChiTiet.hoaDon.soDienThoai}</td>
                    <td>
                            <%--                        <a href="/view-chi-tiet-san-pham/detail/${chiTietSanPham.id}" class="btn btn-success">DETAIL</a>--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <c:if test="${hoaDonChiTietPage.getNumber() + 1 > 1}">
            <a href="?page=${hoaDonChiTietPage.getNumber() + 1 - 1}">
                Previous
            </a>
        </c:if>
        <span> ${hoaDonChiTietPage.getNumber() + 1} / ${hoaDonChiTietPage.getTotalPages()} </span>
        <c:if test="${hoaDonChiTietPage.getNumber() + 1 < hoaDonChiTietPage.getTotalPages()}">
            <a href="?page=${hoaDonChiTietPage.getNumber() + 1 + 1}">
                Next
            </a>
        </c:if>
    </div>
    </nav>
</section>
<footer>

</footer>
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