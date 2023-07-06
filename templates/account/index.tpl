<section class="content-section">

    <div class="container py-5">
        <!-- ##### Login Area Start ##### -->
        <div class="vizew-login-area section-padding-80">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 d-md-block  d-none">
                        <img src="{$domain}/public/assets/img/login.png" alt="" width="100%">
                    </div>
                    <div class="col-lg-6 col-md-12 col-12 ">
                        <div class="container">
                            <ul class="nav nav-tabs " id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link fw-bold btn active" id="login-tab" data-bs-toggle="tab"
                                        data-bs-target="#login" type="button" role="tab" aria-controls="login"
                                        aria-selected="true">Login</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link fw-bold btn " id="register-tab" data-bs-toggle="tab"
                                        data-bs-target="#register" type="button" role="tab" aria-controls="register"
                                        aria-selected="false">Register</button>
                                </li>
                            </ul>
                            <div class="tab-content pt-2" id="myTabContent">
                                <div class="tab-pane fade show active" id="login" role="tabpanel"
                                    aria-labelledby="login-tab">
                                    <div class="login-content">
                                        <div class="section-heading">
                                            <h4 class="text-center py-2">Đăng nhập</h4>
                                            <span id="error_login" class="alert alert-warning d-none"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label for="inputUsername" class="form-label">User
                                                Name</label>
                                            <input type="text" class="form-control" required name="Username"
                                                id="inputUsername" placeholder="Enter username">
                                        </div>
                                        <div class="mb-3">
                                            <label for="inputPassword1" class="form-label">Password</label>
                                            <input type="password" required class="form-control" name="password"
                                                id="inputPassword1" placeholder="Password">
                                        </div>
                                        <div class="mb-3 form-check d-flex justify-content-between">
                                            <a href="<?= _WEB_ROOT ?>/account/forgotpassword" class="ml-auto">Quên
                                                mật khẩu</a>
                                        </div>

                                        <button type="button" class="btn btn-login w-100 mt-3" name="loginSubmit"
                                            id="btn_login">Login</button>


                                    </div>
                                </div>

                                <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                    <div class="register-content">

                                        <div class="section-heading">
                                            <h4 class="text-center py-2">Tạo tài khoản</h4>
                                            <span id="error_register" class="alert alert-warning d-none"></span>
                                        </div>
                                        <div>
                                            <div class="mb-3">
                                                <label for="inputName" class="form-label">Tên của bạn</label>
                                                <input required type="text" class="form-control" name="name"
                                                    id="inputName" placeholder="Enter your full name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputRegisterUsername" class="form-label">Tên tài
                                                    khoản</label>
                                                <input required type="text" class="form-control" name="username"
                                                    id="inputRegisterUsername" placeholder="Enter your full name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputEmail2" class="form-label">Email</label>
                                                <input required type="email" class="form-control" name="email"
                                                    id="inputEmail2" placeholder="Enter your email">
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputPhonenumber" class="form-label">Số điện thoại</label>
                                                <input required type="text" class="form-control" name="phonenumber"
                                                    id="inputPhonenumber" placeholder="Enter your phone">
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputPassword2" class="form-label">Mật khẩu</label>
                                                <input required type="password" class="form-control" name="password"
                                                    id="inputPassword2" placeholder="Password">

                                            </div>
                                            <div class="mb-3">
                                                <label for="repassword" class="form-label">Nhập lại mật
                                                    khẩu</label>
                                                <input required type="password" class="form-control"
                                                    name="confirmPassword" id="repassword"
                                                    placeholder="Confirm Password">

                                            </div>
                                            <button type="button" class="btn btn-login w-100 mt-3" name="registerSubmit"
                                                id="btn_register">Register</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Login Area End ##### -->
    </div>
</section>

{* <script type="text/javascript" src="{$domain}/public/assets/clients/js/ValidatorRegister.js"></script> *}