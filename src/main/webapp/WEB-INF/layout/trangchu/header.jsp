<%@ page contentType="text/html;charset=UTF-8" %>
<div class="quan_ly">
    <div class="container">
        <div class="tao_khoang_cach">
            <div class="row">
                <div class="col-5">
                    <div class="row">
                        <div class="col-4">
                            <div class="facebook_tiktok">
                                <a href="#"><i class="bi bi-facebook"></i>Fanpage</a>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="facebook_tiktok">
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Truy Cập Thông Tin Hóa Đơn !', '/view-hoa-don/hoa-don')"><i class="bi bi-tiktok"></i>Hóa Đơn</a>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="facebook_tiktok">
                                <a onclick="preventDefault(event); showNotification('Thông Báo !', 'Truy Cập Quản Lý Sản Phẩm !', '/ban-hang/quan-ly-san-pham')"
                                ><i class="bi bi-cloud-arrow-up"></i>QL Sản Phẩm</a
                                >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="khuyen_mai">
                        <div class="row">
                            <div class="col-4">
                                <a href="#"><i class="bi bi-file-richtext"></i>Khuyến Mại</a>
                            </div>
                            <div class="col-4">
                                <a href="#"><i class="bi bi-file-richtext"></i>Kiến Thức</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="login_home">
                        <div class="row">
                            <div class="col-6">
                                <a href="#dang-ky"
                                ><i class="bi bi-arrow-through-heart"></i>Đăng Ký</a
                                >
                            </div>
                            <div class="col-6">
                                <a href="#dang-nhap"
                                ><i class="bi bi-person-square"></i>Đăng Nhập</a
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="header_menu">
    <div class="container">
        <div class="row">
            <div class="col-2">
                <div class="logo">
                    <a href=""> <i class="bi bi-gpu-card"></i>HOANG TUAN PC</a>
                </div>
            </div>
            <div class="col-8">
                <div class="header_chinhsach">
                    <div class="row">
                        <div class="col-3">
                            <p><i class="bi bi-folder-symlink"></i>GIÁ ƯU ĐÃI NHẤT</p>
                        </div>
                        <div class="col-3">
                            <p><i class="bi bi-piggy-bank-fill"></i>HỖ TRỢ TRẢ GÓP</p>
                        </div>
                        <div class="col-3">
                            <p><i class="bi bi-house-up-fill"></i>BẢO HÀNH TẬN NHÀ</p>
                        </div>
                        <div class="col-3">
                            <p><i class="bi bi-bus-front-fill"></i>MIỄN PHÍ VẬN CHUYỂN</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="gio_hang">
                    <div class="icon_gio_hang">
                        <a href="/gio-hang"><i class="bi bi-cart3"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <form class="d-flex" role="search" action="/ban-hang/serchByName" method="get">
                    <input
                            class="form-control me-2"
                            type="search"
                            placeholder="Search"
                            aria-label="Search"
                            name="tenSanPham"
                            value="${param.tenSanPham}"
                    />
                    <button class="nut_search" type="submit">Search</button>
                </form>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
</div>
<div class="menu_header">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/thong-ke/trang-chu">TRANG CHỦ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/ban-hang/san-pham">SẢN PHẨM</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/thong-ke">THỐNG KÊ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#tin-tuc">TIN TỨC MỚI</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
