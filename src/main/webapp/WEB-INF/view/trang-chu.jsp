<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TRANG CHỦ</title>
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
        <div class="gioiThieuSP">
            <div class="row">
                <div class="col-7">
                    <div class="banner">
                        <div id="carouselExample" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="carousel-item active ">
                                    <img
                                            src="/uploads/lk2.png"
                                            class="d-block"
                                            alt="..."
                                    />
                                </div>
                                <div class="carousel-item">
                                    <img
                                            src="/uploads/lk3.jpg"
                                            class="d-block"
                                            alt="..."
                                    />
                                </div>
                                <div class="carousel-item">
                                    <img
                                            src="/uploads/lk6.jpg"
                                            class="d-block"
                                            alt="..."
                                    />
                                </div>
                            </div>
                            <button
                                    class="carousel-control-prev vitri"
                                    type="button"
                                    data-bs-target="#carouselExample"
                                    data-bs-slide="prev"
                            >
              <span
                      class="carousel-control-prev-icon"
                      aria-hidden="true"
              ></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button
                                    class="carousel-control-next vitri2"
                                    type="button"
                                    data-bs-target="#carouselExample"
                                    data-bs-slide="next"
                            >
              <span
                      class="carousel-control-next-icon"
                      aria-hidden="true"
              ></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-5">
                    <div class="sanpham_gioi_thieu">
                        <img src="/uploads/lk1.png" alt=""/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="tieu_de_san_pham">
                <a class="mau_sac"> Sản Phẩm Giảm Giá</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="row">
                <c:forEach items="${listChiTietSanPhams}" var="chiTietSanPham">
                    <div class="col-3">
                        <div class="box">
                            <a href="">
                                <div class="img-box">
                                    <img src="/uploads/${chiTietSanPham.sanPham.anh}">
                                </div>
                                <div class="detail-box">
                                    <h6>PRICE: <span> <del><fmt:formatNumber value="${chiTietSanPham.giaBanDau}" pattern="###,###"></fmt:formatNumber></del> - <fmt:formatNumber value="${chiTietSanPham.giaBan}" pattern="###,###"></fmt:formatNumber> VNĐ</span></h6>
                                </div>
                                <div class="new"><span> ${chiTietSanPham.sanPham.ten} -- ${chiTietSanPham.nhaSanXuat.ten} -- ${chiTietSanPham.dongSanPham.ten}</span></div>
                            </a>
                            <div class="button">
                                <div class="d-grid gap-2 d-md-block">
                                    <a href="/gio-hang/add/${chiTietSanPham.id}">
                                        <button
                                                class="btn btn-primary muahang"
                                                type="button"
                                        >
                                            Thêm Vào Giỏ
                                        </button>
                                    </a>
                                    <a href="/ban-hang/trang-chi-tiet-san-pham/${chiTietSanPham.id}">
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
    </div>
    <div class="container">
        <div class="row">
            <div class="tieu_de_san_pham">
                <a class="mau_sac"> Sản Phẩm Bán Chạy Nhất</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${listss}" var="hoaDonChiTiet">
                <div class="col-3">
                    <div class="box">
                        <a href="">
                            <div class="img-box">
                                <img src="/uploads/${hoaDonChiTiet.chiTietSanPham.sanPham.anh}">
                            </div>
                            <div class="detail-box">
                                <h6>RAM: ${hoaDonChiTiet.chiTietSanPham.boNho.ten}</h6>
                                <h6>PRICE: <span> <fmt:formatNumber value="${hoaDonChiTiet.chiTietSanPham.giaBan}" pattern="###,###"></fmt:formatNumber> VNĐ</span></h6>
                            </div>
                            <div class="new"><span> ${hoaDonChiTiet.chiTietSanPham.sanPham.ten} -- ${hoaDonChiTiet.chiTietSanPham.nhaSanXuat.ten} -- ${hoaDonChiTiet.chiTietSanPham.dongSanPham.ten}</span></div>
                        </a>
                        <div class="button">
                            <div class="d-grid gap-2 d-md-block">
                                <a href="/gio-hang/add/${hoaDonChiTiet.chiTietSanPham.id}">
                                    <button
                                            class="btn btn-primary muahang"
                                            type="button"
                                    >
                                        Thêm Giỏ Hàng
                                    </button>
                                </a>
                                <a href="/ban-hang/trang-chi-tiet-san-pham/${hoaDonChiTiet.chiTietSanPham.id}">
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
    <br/>
    <br/>
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