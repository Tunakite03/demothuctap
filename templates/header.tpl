<!DOCTYPE html>
<html lang="vi">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="canonical" href="#">
    <link rel="shortcut icon" href="{$domain}/public/imgs/favicon.png?v=2" type="image/x-icon">
    <meta name="keywords" content="Hệ thống dữ liệu tài chính">
    <meta name="description" content="Hệ thống dữ liệu tài chính">
    <title>Shop cho thú cưng</title>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap"
        rel="stylesheet">
    {* <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/css/bootstrap.min.css"> *}
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="{$domain}/public/assets/clients/lib/animate/animate.min.css" rel="stylesheet">
    <link href="{$domain}/public/assets/clients/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="{$domain}/public/assets/clients/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="{$domain}/public/assets/clients/css/style.css" rel="stylesheet">


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300&display=swap" rel="stylesheet">

    <!-- zoom -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css" />


    <!-- OwlCarousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- OwlCarousel JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>


    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<body class="body-home">

    <!-- Navbar Start -->
    <div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s" style="box-shadow: 2px 2px 2px #ccc;">
        <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
            <div class="col-lg-5 px-5 text-start">
                <small>Giao Hàng Toàn Quốc</small>
                <small class="ms-4">Mua Hàng(7h-22h)</small>

            </div>
            <div class="col-lg-4 px-5 ">

            </div>
            <div class="col-lg-3 px-5 text-end">
                <small><i class="bi bi-telephone-fill"></i><a style="color: red;"> 0987654321</a></small>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
            <a href="/" class="navbar-brand ms-4 ms-lg-0"><img src="{$domain}/public/assets/img/logo.png" alt=""></a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="" style="margin-top: 20px;">
                <form action="/tim-kiem" method="post">
                    <div class="input-group mb-3">
                        {* <select name="table" id="table" class="form-control">
                            <option value="products">Sản phẩm</option>
                            <option value="news">Tin Tức</option>
                        </select> *}
                        <input type="text" class="form-control" placeholder="Bạn cần tìm gì?"
                            aria-label="tìm kiếm sản phẩm" name="key">
                        <button class="btn btn-danger" type="submit" name="SubmitSearch">Tìm kiếm</button>
                    </div>
                </form>
            </div>
            <div class="collapse navbar-collapse" id="navbarCollapse">

                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="/" class="nav-item nav-link active">Trang Chủ</a>
                    <a class="nav-link " class="nav-item nav-link" href="/cua-hang"  > Shop Chó </a>
                    <a href="/news" class="nav-item nav-link">Tin Tức</a>
                    <a href="/contact" class="nav-item nav-link">Liên Hệ</a>

                </div>
                {* <div class="d-none d-lg-flex ms-2">
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="/likeproduct">
                        <small>
                            <?php
                    if (isset($_SESSION['loggedID'])) {
                        echo ($_SESSION['countLike']['count']);
                    }
                    ?> <i class="bi bi-suit-heart-fill text-body"></i>
                        </small>
                    </a>
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="/cart">
                        <small>
                            <?php
                    if (isset($_SESSION['loggedID'])) {
                        echo ($_SESSION['countCart']['count']);
                    }
                    ?> <i class="fa fa-shopping-bag text-body"></i>
                        </small>
                    </a>
                    <?php
                    </div> *}

                {if !empty($session.user_id)}
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="userMenu"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="fa fa-user"></span>
                            {$session.fullname}
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="userMenu">
                            <li><a class="dropdown-item" href="/account/profile/{$session.user_id}">Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/tai-khoan/logout">Đăng xuất</a></li>
                        </ul>
                    </div>
                {else}
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="/tai-khoan">
                        <small class="fa fa-user text-body"></small>
                    </a>
                {/if}
            </div>
        </nav>
    </div>
<!-- Navbar End -->