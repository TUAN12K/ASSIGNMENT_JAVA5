<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GIỎ HÀNG</title>
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
        <div class="row">
            <c:forEach items="${listGioHangChiTiets}" var="gioHangChiTiet">
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
                            <div class="new"><span> ${gioHangChiTiet.chiTietSanPham.sanPham.ten} - ${gioHangChiTiet.chiTietSanPham.dongSanPham.ten} - ${gioHangChiTiet.chiTietSanPham.nhaSanXuat.ten} - ${gioHangChiTiet.chiTietSanPham.boNho.ten} - ${gioHangChiTiet.chiTietSanPham.mauSac.ten}</span></div>
                        </a>
                        <div class="button">
                            <div class="d-grid gap-2 d-md-block">
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Xác Nhận Mua Hàng !', '/mua-hang/detail/${gioHangChiTiet.id}')">
                                    <button
                                            class="btn btn-primary muahang"
                                            type="button"
                                    >
                                        Mua Hàng
                                    </button>
                                </a>
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Xác Nhận Thêm 1 Sản Phẩm !', '/gio-hang/add/${gioHangChiTiet.chiTietSanPham.id}')">
                                    <button
                                            class="btn btn-primary muahang"
                                            type="button"
                                    >
                                        Thêm Một
                                    </button>
                                </a>
                                <a href="/ban-hang/trang-chi-tiet-san-pham/${gioHangChiTiet.chiTietSanPham.id}">
                                    <button class="btn btn-primary muahang" type="button">
                                        Chi Tiết
                                    </button>
                                </a>
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Xác Nhận Bớt 1 Sản Phẩm !', '/gio-hang/bot-san-pham/${gioHangChiTiet.chiTietSanPham.id}')">
                                    <button
                                            class="btn btn-primary muahang"
                                            type="button"
                                    >
                                        Bớt Một
                                    </button>
                                </a>
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Xác Nhận Xóa Sản Phẩm Này Khỏi Giỏ!', '/gio-hang/xoa-san-pham/${gioHangChiTiet.id}')">
                                    <button
                                            class="btn btn-primary muahang"
                                            type="button"
                                    >
                                        Xóa Hết
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
                                                            pattern="###,###"></fmt:formatNumber> VNĐ</span></h6>
                </div>
            </div>
            <div class="col-4">

            </div>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="../layout/trangchu/footer.jsp"/>
</footer>
<script>
    function showNotification(title, message, redirectUrl) {
        var overlay = document.createElement("div");
        overlay.className = "overlay";

        var notification = document.createElement("div");
        notification.className = "notification";

        var titleLabel = document.createElement("h3");
        titleLabel.innerHTML = title;

        var messageLabel = document.createElement("p");
        messageLabel.innerHTML = message;

        var okButton = document.createElement("button");
        okButton.innerHTML = "Xác Nhận";
        okButton.onclick = function() {
            // Handle OK button action
            window.location.href = redirectUrl;
        };

        var closeButton = document.createElement("button");
        closeButton.innerHTML = "Đóng Luôn";
        closeButton.onclick = function() {
            document.body.removeChild(overlay);
        };

        notification.appendChild(titleLabel);
        notification.appendChild(messageLabel);
        notification.appendChild(okButton);
        notification.appendChild(closeButton);

        overlay.appendChild(notification);
        document.body.appendChild(overlay);
    }

    function preventDefault(event) {
        event.preventDefault();
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