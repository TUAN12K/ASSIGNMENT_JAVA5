<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHI TIẾT</title>
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
            <div class="col-3"></div>
            <div class="col-6">
                <div class="boxs">
                    <a href="">
                        <div class="img-boxs">
                            <img src="/uploads/${chiTietSanPham.sanPham.anh}">
                        </div>
                        <div class="detail-boxs"><h6>Tên: ${chiTietSanPham.sanPham.ten}</h6></div>
                        <div class="detail-boxs"><h6>Dòng: ${chiTietSanPham.dongSanPham.ten}</h6></div>
                        <div class="detail-boxs"><h6>Bộ Nhớ: ${chiTietSanPham.boNho.ten}</h6></div>
                        <div class="detail-boxs"><h6>Sản Xuất: ${chiTietSanPham.nhaSanXuat.ten}</h6></div>
                        <div class="detail-boxs"><h6>Màu Sắc: ${chiTietSanPham.mauSac.ten}</h6></div>
                        <div class="detail-boxs"><h6>Bảo Hành: ${chiTietSanPham.namBaoHanh}</h6></div>
                        <div class="detail-boxs"><h6>Mô Tả: ${chiTietSanPham.moTa}</h6></div>
                        <div class="detail-boxs"><h6>Giá Bán: <fmt:formatNumber value="${chiTietSanPham.giaBan}" pattern="###,###"></fmt:formatNumber> VNĐ</h6></div>
                        <div class="detail-boxs"><h6>Trạng
                            Thái: ${chiTietSanPham.trangThai==1?"CÒN HÀNG":"HẾT HÀNG"}</h6></div>

                        <div class="news"><span> ${chiTietSanPham.sanPham.ten}</span></div>
                    </a>
                    <div class="button">
                        <div class="d-grid gap-2 d-md-block">
                            <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Xác Nhận Quay Lại !', '/ban-hang/san-pham')">
                                <button class="btn btn-primary muahang" type="button">
                                    Quay Lại
                                </button>
                            </a>
<%--                            <a href="">--%>
<%--                                <button class="btn btn-primary muahang" type="button">--%>
<%--                                    Mua Hàng--%>
<%--                                </button>--%>
<%--                            </a>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3"></div>
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