<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHI_TIET_SAN_PHAM</title>
    <link rel="stylesheet" href=".././css/custom/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<header>
    <div class="container">
        <div class="tieuDe">
            <br>
            <h3 style="text-align: center">CHI_TIET_SAN_PHAM</h3>
            <br>
            <hr>
        </div>
    </div>
</header>
<section>
    <div class="container">
        <form method="post" action="/view-chi-tiet-san-pham/add">
            <div class="row">
                <div class="col-4">
                    <div class="form-floating mb-3">
                        <select class="form-select" name="sanPham" required>
                            <c:forEach items="${listSanPhams}" var="sanPham">
                                <option value="${sanPham.id}" ${chiTietSanPham.sanPham.id==sanPham.id?"selected":""}>${sanPham.ten}</option>
                            </c:forEach>
                        </select>
                        <label>CHON_SAN_PHAM</label>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" name="nhaSanXuat" required>
                            <c:forEach items="${listNhaSanXuats}" var="nhaSanXuat">
                                <option value="${nhaSanXuat.id}" ${chiTietSanPham.nhaSanXuat.id==nhaSanXuat.id?"selected":""}>${nhaSanXuat.ten}</option>
                            </c:forEach>
                        </select>
                        <label>CHON_NHA_SAN_XUAT</label>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" selected name="mauSac" required>
                            <c:forEach items="${listMauSacs}" var="mauSac">
                                <option value="${mauSac.id}" ${chiTietSanPham.mauSac.id==mauSac.id?"selected":""}>${mauSac.ten}</option>
                            </c:forEach>
                        </select>
                        <label>CHON_MAU_SAC</label>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" name="dongSanPham" required>
                            <c:forEach items="${listDongSanPhams}" var="dongSanPham">
                                <option value="${dongSanPham.id}" ${chiTietSanPham.dongSanPham.id==dongSanPham.id?"selected":""}>${dongSanPham.ten}</option>
                            </c:forEach>
                        </select>
                        <label>CHON_DONG_SAN_PHAM</label>
                    </div>
                </div>
                <div class="col-4">
                    <div class="form-floating mb-3">
                        <select class="form-select" name="boNho" required>
                            <c:forEach items="${listBoNhos}" var="boNho">
                                <option value="${boNho.id}" ${chiTietSanPham.boNho.id==boNho.id?"selected":""}>${boNho.ten}</option>
                            </c:forEach>
                        </select>
                        <label>CHON_BO_NHO</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="giaNhap" required
                               value="${chiTietSanPham.giaNhap}">
                        <label>GIA_NHAP</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="giaBan" required
                               value="${chiTietSanPham.giaBan}">
                        <label>GIA_BAN</label>
                    </div>
                    <br>
                    <hr>
                    <button type="submit" class="btn btn-success">ADD</button>
                    <a href="/ban-hang/quan-ly-san-pham" type="submit" class="btn btn-success">QUẢN LÝ SẢN PHẨM</a>
                    <br>
                    <hr>
                </div>
                <div class="col-4">
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="soLuong" required
                               value="${chiTietSanPham.soLuong}">
                        <label>SO_LUONG</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="namBaoHanh" required
                               value="${chiTietSanPham.namBaoHanh}">
                        <label>NAM_BAO_HANH</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="moTa" required
                               value="${chiTietSanPham.moTa}">
                        <label>MO_TA</label>
                    </div>
                    <div class="form-floating mb-3">
                        <p>TRANG_THAI:</p>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="trangThai" value="1"
                                   checked ${chiTietSanPham.trangThai==1?"checked":""}>
                            <label class="form-check-label">CON_HANG</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="trangThai"
                                   value="2" ${chiTietSanPham.trangThai==2?"checked":""}>
                            <label class="form-check-label">HET_HANG</label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <br>
        <hr>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">ẢNH</th>
                <th scope="col">SẢN PHẨM</th>
                <th scope="col">NSX</th>
                <th scope="col">MÀU SẮC</th>
                <th scope="col">DONG_SP</th>
                <th scope="col">BỘ NHỚ</th>
                <th scope="col">NHẬP</th>
                <th scope="col">BÁN</th>
                <th scope="col">KHO</th>
                <th scope="col">BẢO HÀNH</th>
                <th scope="col">ACTION</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listChiTietSanPhams}" var="chiTietSanPham">
                <tr>
                    <td align="center">
                        <img src="/uploads/${chiTietSanPham.sanPham.anh}" width="40" height="40">
                    </td>
                    <td>${chiTietSanPham.sanPham.ten}</td>
                    <td>${chiTietSanPham.nhaSanXuat.ten}</td>
                    <td>${chiTietSanPham.mauSac.ten}</td>
                    <td>${chiTietSanPham.dongSanPham.ten}</td>
                    <td>${chiTietSanPham.boNho.ten}</td>
                    <td> <fmt:formatNumber value="${chiTietSanPham.giaNhap}" pattern="###,###"></fmt:formatNumber> VNĐ</td>
                    <td> <fmt:formatNumber value="${chiTietSanPham.giaBan}" pattern="###,###"></fmt:formatNumber> VNĐ</td>
                    <td>${chiTietSanPham.soLuong}</td>
                    <td>${chiTietSanPham.namBaoHanh}</td>
                    <td>
                        <a href="/view-chi-tiet-san-pham/detail/${chiTietSanPham.id}" class="btn btn-success">DETAIL</a>
                        <a href="/view-chi-tiet-san-pham/view-update/${chiTietSanPham.id}" class="btn btn-warning">UPDATE</a>
                        <a href="/view-chi-tiet-san-pham/delete/${chiTietSanPham.id}" class="btn btn-danger">DELETE</a>
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