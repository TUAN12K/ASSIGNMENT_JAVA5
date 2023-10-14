<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>QUẢN_LÝ_SẢN_PHẨM</title>
    <link rel="stylesheet" href="/css/Style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
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
    <br>
    <div class="container">
        <div class="tieuDe">
            <br>
            <h3>ASSIGNMENT_JAVA5_TUANNQPH20022</h3>
            <br>
        </div>
        <br>
        <hr>
        <br>
        <div class="row">
            <div class="col-12">
                <div class="bangNhieu" style="text-align: center">
                    <a href="/view-chi-tiet-san-pham" class="btn btn-warning">CHI TIẾT SẢN PHẨM</a>&emsp;
                    <a href="/view-hoa-don/hoa-don" class="btn btn-warning">HÓA ĐƠN</a>&emsp;
                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="col-12">
                <div class="bangit" style="text-align: center">
                    <a href="" class="btn btn-warning" onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Có Xác Định Truy Cập Tài Khoản', '/view-tai-khoan')">TÀI KHOẢN</a>&emsp;
                    <a href="/view-san-pham" class="btn btn-warning">SẢN PHẨM</a>&emsp;
                    <a href="/view-dong-san-pham" class="btn btn-warning">DÒNG SẢN PHẨM</a>&emsp;
                    <a href="/view-nha-san-xuat" class="btn btn-warning">NHÀ SẢN XUẤT</a>&emsp;
                    <a href="/view-mau-sac" class="btn btn-warning">MÀU SẮC</a>&emsp;
                    <a href="/view-bo-nho" class="btn btn-warning">BỘ NHỚ</a>&emsp;
                </div>
            </div>
        </div>
        <br>
        <hr>
        <br>
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
        okButton.innerHTML = "OK";
        okButton.onclick = function() {
            // Handle OK button action
            window.location.href = redirectUrl;
        };

        var closeButton = document.createElement("button");
        closeButton.innerHTML = "Close";
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js"
        integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i"
        crossorigin="anonymous"></script>
</body>
</html>



