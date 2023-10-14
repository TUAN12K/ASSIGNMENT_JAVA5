<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SẢN PHẨM</title>
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
        <div class="dropdown mau_sac_danhMuc">
            <form action="/ban-hang/search" method="GET">
                <div class="theChon">
                    <label for="priceRange">Khoảng giá:</label>
                    <select id="priceRange" name="priceRange" class="danh_muc">
                        <option value="0-1000000" ${priceRange == "0-1000000"?"selected":""}>0 - 1 triệu</option>
                        <option value="1000000-2000000" ${priceRange == "1000000-2000000"?"selected":""}>1 triệu - 2
                            triệu
                        </option>
                        <option value="2000000-4000000" ${priceRange == "2000000-4000000"?"selected":""}>2 triệu - 4
                            triệu
                        </option>
                        <option value="4000000-6000000" ${priceRange == "4000000-6000000"?"selected":""}>4 triệu - 6
                            triệu
                        </option>
                        <option value="6000000-8000000" ${priceRange == "6000000-8000000"?"selected":""}>6 triệu - 8
                            triệu
                        </option>
                        <option value=">8000000" ${priceRange == ">8000000"?"selected":""}> Lớn Hơn 8
                            triệu
                        </option>
                        </option>
                    </select>
                    <button type="submit" class="mauSacNuts">Tìm kiếm</button>
                </div>
            </form>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${pageChiTietSanPham.getContent()}" var="chiTietSanPham">
                <div class="col-3">
                    <div class="box">
                        <a href="">
                            <div class="img-box">
                                <img src="/uploads/${chiTietSanPham.sanPham.anh}">
                            </div>
                            <div class="detail-box">
                                <h6>RAM: ${chiTietSanPham.boNho.ten}</h6>
                                <h6>PRICE: <span> <fmt:formatNumber value="${chiTietSanPham.giaBan}"
                                                                    pattern="###,###"></fmt:formatNumber> VNĐ</span>
                                </h6>
                            </div>
                            <div class="new">
                                <span> ${chiTietSanPham.sanPham.ten} -- ${chiTietSanPham.nhaSanXuat.ten} -- ${chiTietSanPham.dongSanPham.ten}</span>
                            </div>
                        </a>
                        <div class="button">
                            <div class="d-grid gap-2 d-md-block">
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Xác Nhận Thêm Sản Phẩm Vào Giỏ !', '/gio-hang/add/${chiTietSanPham.id}')">
                                    <button
                                            class="btn btn-primary muahang"
                                            type="button"
                                    >
                                        Thêm Giỏ Hàng
                                    </button>
                                </a>
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Xem Chi Tiết Sản Phẩm !', '/ban-hang/trang-chi-tiet-san-pham/${chiTietSanPham.id}')">
                                    <button class="btn btn-primary muahang" type="button">
                                        Xem Sản Phẩm
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <nav class="nav-wrapper">
        <div>
            <c:if test="${pageChiTietSanPham.getNumber() + 1 > 1}">
                <a href="?page=${pageChiTietSanPham.getNumber() + 1 - 1}&tenSanPham=${param.tenSanPham}&priceRange=${param.priceRange}">
                    Previous
                </a>
            </c:if>
            <span> ${pageChiTietSanPham.getNumber() + 1} / ${pageChiTietSanPham.getTotalPages()} </span>
            <c:if test="${pageChiTietSanPham.getNumber() + 1 < pageChiTietSanPham.getTotalPages()}">
                <a href="?page=${pageChiTietSanPham.getNumber() + 1 + 1}&tenSanPham=${param.tenSanPham}&priceRange=${param.priceRange}">
                    Next
                </a>
            </c:if>
        </div>
    </nav>
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
        okButton.onclick = function () {
            // Handle OK button action
            window.location.href = redirectUrl;
        };

        var closeButton = document.createElement("button");
        closeButton.innerHTML = "Đóng Luôn";
        closeButton.onclick = function () {
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