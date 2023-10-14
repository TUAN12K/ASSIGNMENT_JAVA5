<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>UPDATE_NHA_SAN_XUAT</title>
    <link rel="stylesheet" href=".././css/custom/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<header>
    <div class="container">
        <div class="tieuDe">
            <br>
            <h3 style="text-align: center">UPDATE_NHA_SAN_XUAT</h3>
            <br>
        </div>
    </div>
</header>
<section>
    <div class="container">
        <div class="row">
            <div class="col-3">

            </div>
            <div class="col-4">
                <form method="post" action="/view-san-pham/update/${sanPham.id}" enctype="multipart/form-data">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="ma" value="${sanPham.ma}" required>
                        <label>MA</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="ten" value="${sanPham.ten}" required>
                        <label>TEN</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="anh" value="${sanPham.anh}" disabled>
                        <label>TEN_ANH</label>
                    </div>
                    <div class="input-group mb-3">
                        <input type="file" class="form-control" name="images" accept="image/jpeg, image/png"
                               value="${param.images}" required>
                        <label class="input-group-text">UPLOAD IMG</label>
                    </div>
                    <br>
                    <hr>
                    <button type="submit" class="btn btn-success">UPDATE</button>
                    <br>
                    <hr>
                </form>
            </div>
            <div class="col-3">

            </div>
        </div>
    </div>
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