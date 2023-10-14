<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>THANH TOÁN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />
</head>
<style>
    <%@include file="../css/custom/style.css"%>
</style>
<body>
<header>
    <jsp:include page="../layout/trangchu/header.jsp"/>
</header>
<section>
    <div class="container">
        <form method="get" action="/mua-hang/thanh-toan/${gioHangChiTiet.id}">
            <br>
            <div class="row">
                <div class="col-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="tenNguoiNhan" required>
                        <label>TÊN NGƯỜI NHẬN</label>
                    </div>
                </div>
                <div class="col-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="diaChi" required
                               value="${hoaDon.diaChi}">
                        <label>ĐỊA CHỈ</label>
                    </div>
                </div>
                <div class="col-4">
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="soDienThoai" required
                               value="${hoaDon.soDienThoai}">
                        <label>SỐ ĐIỆN THOẠI</label>
                    </div>
                </div>
            </div>
            <br>
            <hr>
            <br>
            <div class="row">
                <div class="col-12">
                    <div class="box">
                        <a href="">
                            <div class="img-box">
                                <img src="/uploads/${gioHangChiTiet.chiTietSanPham.sanPham.anh}">
                            </div>
                            <div class="detail-box">
                                <h6>RAM: ${gioHangChiTiet.chiTietSanPham.boNho.ten}</h6>
                                <h6>SỐ LƯỢNG: ${gioHangChiTiet.soLuong}</h6>
                                <h6>PRICE: <span> <fmt:formatNumber value="${gioHangChiTiet.donGia}"
                                                                    pattern="###,###"></fmt:formatNumber>VNĐ</span>
                                </h6>
                            </div>
                            <div class="new"><span> ${gioHangChiTiet.chiTietSanPham.sanPham.ten} </span></div>
                        </a>
                        <div class="button">
                            <div class="d-grid gap-2 d-md-block">
                                <button onclick="if (confirm('Bạn có chắc chắn muốn tiếp tục?')) { alert('Bạn đã chấp nhận xác nhận.'); } else { alert('Bạn đã hủy xác nhận.'); }"
                                        class="btn btn-primary muahang"
                                        type="submit"
                                >
                                    Thanh Toán Ngay
                                </button>
                                <a href="/gio-hang/xoa-san-pham/${gioHangChiTiet.id}">
                                    <button
                                            class="btn btn-primary muahang"
                                            type="button"
                                    >
                                        Quay Lai
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-4">

                </div>
                <div class="col-4">
                    <br>
                    <hr>
                    <br>
                    <div class="detail-box">
                        <h6>TỔNG TIỀN: <span> <fmt:formatNumber value="${tongTien}"
                                                                pattern="###,###"></fmt:formatNumber>VNĐ</span></h6>
                    </div>
                </div>
                <div class="col-4">

                </div>
            </div>
        </form>
    </div>
</section>
<footer>
    <jsp:include page="../layout/trangchu/footer.jsp"/>
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