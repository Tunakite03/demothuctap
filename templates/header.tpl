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
    <title>Hệ thống dữ liệu tài chính</title>

    <script src="{$domain}/public/js/jquery.min.js?{$version}"></script>
    <script src="{$domain}/public/bootstrap/js/bootstrap.min.js?{$version}"></script>
    <link href="{$domain}/public/bootstrap/css/bootstrap.min.css?{$version}" rel="stylesheet" />
    <link href="{$domain}/public/font-awesome/css/font-awesome.min.css?{$version}" rel="stylesheet" />
    <link href="{$domain}/public/css/owl.carousel.css?{$version}" rel="stylesheet" />
    <link href="{$domain}/public/css/animate.css?{$version}" rel="stylesheet" />
    <link href="{$domain}/public/fonts/montserrat/fonts.css?{$version}" rel="stylesheet">
    <link href="{$domain}/public/css/main.css?{$version}" rel="stylesheet" />
    <link href="{$domain}/public/chart/style.css?{$version}" rel="stylesheet" />
    <script src="{$domain}/js/{$session.lang}/home.js?{$version}"></script>

</head>

<body>
    <section class="header-cate">
        <div class="{if $m == 'home' || $m == 'category' || $m == 'chart' }container-fluid{else}container{/if}">
            <div class="wrap-menu">
                <div class="menu-left">
                    <div class="menu-icon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <h2 class="title">{$title}</h2>
                    <div class="menu-left-item menu-left-item1">
                        <div class="logo">
                            <a href="/"><img src="{$domain}/public/imgs/logo.png?v=1" class="img-responsive" /></a>
                        </div>
                        <ul>
                            <!-- <li><a href="/" title="#">Trang chủ</a></li> -->
                            {if isset($lCat) && $lCat != ''}
                                {include "`$tpldirect`home/menu_left.tpl" data=$lCat}
                            {/if}
                            <li class="li-sub"><a title="Kết nối với Finpal">Kết nối với Finpal <i class="fa fa-angle-right"></i></a></li>
                            <li><a href="/gioi-thieu" title="Về chúng tôi">Về chúng tôi</a></li>
                        </ul>
                    </div>
                    <div class="menu-left-item menu-left-item2">
                        <ul>
                            <li class="back"><a class="Quay về menu chính"><i class="fa fa-angle-left"></i> Quay về menu chính</a></li>
                            <li><a title="Kết nối với Finpal">Kết nối với Finpal</a></li>
                            <li><a href="/lien-he" title="Liên hệ">Liên hệ</a></li>
                            <li><a href="/tuyen-dung" title="Tuyển dụng">Tuyển dụng</a></li>
                        </ul>
                    </div>
                </div>
                <div class="logo">
                    <a href="/"><img src="{$domain}/public/imgs/logo.png?v=1" class="img-responsive" /></a>
                </div>
                <div class="menu-right">
                    {if !isset($session.fullnameClient)}
                        <span class="gradient-btn">Đăng nhập</span>
                    {else}
                        <span class="btn-key"><a href="/thong-tin" style="color: #fff;">{$session.fullnameClient}</a></span>
                        <!-- <h4><a href="/thong-tin">{$session.fullnameClient}</a> | <a href="/logout.php/?page=client">Đăng xuất</a></h4> -->
                    {/if}
                </div>
            </div>
        </div>
        <div class="overlay-menu-left"></div>
    </section>
    <div class="form-login-menu">
        <div class="login form-content active">
            <span class="close">x</span>
            <h2>Đăng Nhập<br>Hệ Thống Dữ Liệu Tài Chính</h2>
            <div class="form">
                <div class="form-input">
                    <i class="fa fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Số điện thoại / email." class="form-control" />
                </div>
                <div class="form-input">
                    <i class="fa fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Mật khẩu" class="form-control" />
                </div>
                <div class="form-input">
                    <label class="wrap-ace"><input type="checkbox" class="ace" id="remember" /><span class="lbl"></span>Lưu lại tên
                        đăng nhập của tôi</label>
                </div>
                <p id="error_login" class="pointer btn-form-login color-red hide"></p>
                <div class="form-input">
                    <button class="gradient-btn" id="btn_login">Đăng nhập</button>
                </div>
                <p><a data-name="fogotpassword" class="pointer btn-form-login">Quên mật khẩu</a></p>
                <p><a data-name="register" class="pointer btn-form-login">Đăng ký nếu chưa có tài khoản</a></p>
            </div>
        </div>
        <div class="register form-content">
            <span class="close">x</span>
            <h2>Đăng Ký Tài Khoản<br>Hệ Thống Dữ Liệu Tài Chính</h2>
            <div class="form">
                <div class="form-input">
                    <i class="fa fa-user-plus"></i>
                    <input type="text" id="referral" name="referral" placeholder="Tài khoản" class="form-control" />
                </div>
                <div class="form-input">
                    <i class="fa fa-user"></i>
                    <input type="text" id="fullname" name="fullname" placeholder="Họ & tên" class="form-control" />
                    <span class="error"></span>
                </div>
                <div class="form-input">
                    <i class="fa fa-send"></i>
                    <input type="text" id="email" name="email" placeholder="Email" class="form-control" />
                </div>
                <div class="form-input">
                    <i class="fa fa-phone"></i>
                    <input type="text" id="mobile" name="mobile" placeholder="Số điện thoại" class="form-control" />
                </div>
                <div class="form-input">
                    <i class="fa fa-lock"></i>
                    <input type="password" id="pass" name="pass" placeholder="Mật khẩu" class="form-control" />
                </div>
                <div class="form-input">
                    <i class="fa fa-lock"></i>
                    <input type="password" id="repassword" name="repassword" placeholder="Nhập lại mật khẩu"
                        class="form-control" />
                </div>
                <p id="error_register" class="pointer btn-form-login color-red hide"></p>
                <div class="form-input">
                    <button class="gradient-btn" id="btn_register">Đăng ký</button>
                </div>
                <p><a data-name="login" class="pointer btn-form-login">Bạn đã có tài khoản đăng nhập ngay!</a></p>
            </div>
        </div>
        <div class="fogotpassword form-content">
            <span class="close">x</span>
            <h2>Lấy lại tài khoản<br>Hệ Thống Dữ Liệu Tài Chính</h2>
            <div class="form">
                <div class="form-input">
                    <i class="fa fa-user"></i>
                    <input type="text" placeholder="Email" class="form-control" />
                </div>
                <div class="form-input">
                    <button class="gradient-btn">Lấy lại mật khẩu</button>
                </div>
                <p><a data-name="register" class="pointer btn-form-login">Đăng ký nếu chưa có tài khoản</a></p>
                <p><a data-name="login" class="pointer btn-form-login">Bạn đã có tài khoản đăng nhập ngay!</a></p>
            </div>
        </div>
    </div>
    <div class="height-header-cate"></div>

<script type="text/javascript" src="{$domain}/js/js_act/page_login_register.js?{$version}"></script>
<script type="text/javascript" src="{$domain}/public/js/main.js?{$version}"></script>