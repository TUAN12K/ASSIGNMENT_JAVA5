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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <form action="/thong-ke/thong-ke-search" method="GET">
                <div class="theChon">
                    <label for="priceRange">Thống Kê:</label>
                    <select id="priceRange" name="giaTriThongKe" class="danh_muc">
                        <option value="TATCA" selected>TẤT CẢ</option>
                        <option value="NGAY" ${giaTriThongKe == "NGAY"?"selected":""}>NGÀY</option>
                        <option value="TUAN" ${giaTriThongKe == "TUAN"?"selected":""}>TUẦN</option>
                        <option value="THANG" ${giaTriThongKe == "THANG"?"selected":""}>THÁNG</option>
                    </select>
                    <button type="submit" class="mauSacNuts">XEM</button>
                </div>
            </form>
        </div>
        <br>
        <hr>
        <br>
        <div class="row">
            <div style="text-align: center">
                <h3>SẢN PHẨM BÁN CHẠY NHẤT</h3>
            </div>
            <br>
            <hr>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">SỐ THỨ TỰ</th>
                    <th scope="col">SỐ LƯỢNG</th>
                    <th scope="col">SẢN PHẨM</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listss}" var="chiTiet" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${chiTiet.soLuong}</td>
                        <td>${chiTiet.chiTietSanPham.sanPham.ten} -- ${chiTiet.chiTietSanPham.nhaSanXuat.ten}
                            -- ${chiTiet.chiTietSanPham.dongSanPham.ten} -- ${chiTiet.chiTietSanPham.boNho.ten}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <br>
    <hr>
    <br>
    <div class="container">
        <div style="text-align: center">
            <h3>BIỂU ĐỒ THỐNG KÊ</h3>
        </div>
        <br>
        <hr>
        <%--        <canvas id="myChart"></canvas>--%>
        <div class="span-2c">
            <h3 class="tlt">Biều Đồ</h3>
            <canvas id="bar" height="300" width="400" style="width: 400px; height: 300px;"></canvas>
            <script>
                var barChartData = {
                    labels: [<c:forEach var="item" items="${listss}">'${item.chiTietSanPham.sanPham.ten}', </c:forEach>],
                    datasets: [
                        {
                            fillColor: "#FC8213",
                            data: [<c:forEach var="item" items="${listss}">${item.soLuong}, </c:forEach>]
                        }
                    ]
                };
                new Chart(document.getElementById("bar").getContext("2d"), {type: "bar", data: barChartData});
            </script>
        </div>
    </div>
    <br>
    <hr>
    <br>
    <div class="container">
        <div style="text-align: center">
            <h3>SẢN PHẨM TỒN KHO</h3>
        </div>
        <br>
        <hr>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">ANH_SP</th>
                <th scope="col">TEN_SP</th>
                <th scope="col">TEN_NSX</th>
                <th scope="col">TEN_MS</th>
                <th scope="col">TEN_DSP</th>
                <th scope="col">TEN_BN</th>
                <th scope="col">GIA_BAN</th>
                <th scope="col">SO_LUONG</th>
                <th scope="col">NGAY_TAO</th>
                <th scope="col">ACTION</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listChiTietSanPhams}" var="chiTietSanPham" varStatus="i">
                <tr>
                    <td>${i.index + 1}</td>
                    <td align="center">
                        <img src="/uploads/${chiTietSanPham.sanPham.anh}" width="40" height="40">
                    </td>
                    <td>${chiTietSanPham.sanPham.ten}</td>
                    <td>${chiTietSanPham.nhaSanXuat.ten}</td>
                    <td>${chiTietSanPham.mauSac.ten}</td>
                    <td>${chiTietSanPham.dongSanPham.ten}</td>
                    <td>${chiTietSanPham.boNho.ten}</td>
                    <td>
                        <fmt:formatNumber value="${chiTietSanPham.giaBan}" pattern="###,###"></fmt:formatNumber> VNĐ
                    </td>
                    <td>${chiTietSanPham.soLuong}</td>
                    <td>
                        <fmt:formatDate value="${chiTietSanPham.ngayTao}" pattern="dd/MM/yyyy"/>
                    </td>
                    <td>
                        <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Bạn Có Xác Nhận Giảm Giá Cho Sản Phầm Này !', '/view-chi-tiet-san-pham/giam-gia/${chiTietSanPham.id}')" type="button" class="btn btn-warning">Giảm Giá</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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