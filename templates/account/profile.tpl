<section class="content-section">
    <div class="text-center mt-5 mb-5">
        <h3 class="title_sp ">
            <span class="bg bg-white text-danger">
                <img src="https://banner2.cleanpng.com/20180626/fhs/kisspng-avatar-user-computer-icons-software-developer-5b327cc98b5780.5684824215300354015708.jpg"
                    height="40px" width="40px" alt="">
                Thông tin tài khoản
            </span>
        </h3>
    </div>
    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img name="avatar" class="rounded-circle mt-5" width="150px" height="150px"
                        src=" https://banner2.cleanpng.com/20180626/fhs/kisspng-avatar-user-computer-icons-software-developer-5b327cc98b5780.5684824215300354015708.jpg">
                    <span class="font-weight-bold">
                        {$data_user.username}
                    </span>
                    <span class="text-black-50">
                        {$data_user.email}
                    </span>

                    <!-- click model -->

                </div>
            </div>
            <!-- model chỉnh sửa hồ sơ  -->
            <div class="modal fade" id="edit_profile" tabindex="-1" aria-labelledby="edit_profileLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable" style="max-width: 60% !important;">

                </div>
            </div>

            <!--  -->
            <div class="col-md-5 border-right">
                {* <form class="needs-validation" action="" method="post" onsubmit="return validateForm()"> *}
                    <div class=" mb-3">
                        <label for="firstName">Họ và Tên</label>
                        <input type="text" class="form-control" id="fullName" name="fullname" placeholder=""
                            value="{$data_user.fullname}">
                        <div id="fullnameError" class="text-danger fw-bold">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="...@gmail.com" disabled
                            value="{$data_user.email}">
                        <div id="emailError" class="text-danger fw-bold">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="phone">Số Điện Thoại</label>
                        <input type="tel" class="form-control" id="phonenumber" value="{$data_user.phonenumber}" name="phonenumber"
                            placeholder="086..." required>
                        <div id="phoneError" class="text-danger fw-bold">
                        </div>
                    </div>

                    {* <div class="row justify-content-between ">
                        <div class="col-md-5 mb-3 p-0">
                            <label for="province">Tỉnh/Thành Phố</label>
                            <select class="custom-select d-block w-100 form-control" id="province" name="province"
                                required>
                            </select>
                            <input type="hidden" id="province-is" name="province-is">
                        </div>
                        <div class="col-md-4 mb-3 p-0">
                            <label for="district">Quận/Huyện</label>
                            <select class="custom-select d-block w-100  form-control" id="district" name="district"
                                required>
                            </select>
                            <input type="hidden" id="district-is" name="district-is">
                        </div>
                        <div class="col-md-4 mb-3 p-0">
                            <label for="ward">Xã/phường</label>
                            <select class="custom-select d-block w-100  form-control" id="ward" name="ward" required>
                            </select>
                            <input type="hidden" id="ward-is" name="ward-is">
                        </div>
                    </div> *}
                    {* <div class="mb-3">
                        <label for="address">Địa chỉ</label>
                        <input type="text" class="form-control" id="address" name="address"
                            value="<?= !empty($infomationUser['street']) ? $infomationUser['street'] : "" ?>"
                            placeholder="Đường..." required>
                        <div id="addressError" class="text-danger fw-bold">
                        </div>
                    </div> *}
                    <hr class="mb-4">
                    <button class="btn btn-secondary" type="button" name="UpdateInforSubmit" id="updateuser">Cập Nhật Thông
                        Tin</button>
          {* </form> *}
            </div>
            <div class="col-md-4">
                <div class="p-3 py-5">
                    <div class="col-md-12">
                        <div class="kul4+s">
                            <div class="rhmIbk">
                                <div class="stardust-dropdown stardust-dropdown--open">
                                    <div class="stardust-dropdown__item-header"><a class="+1U02e" href="">
                                            <div class="bfikuD"><img
                                                    src="https://cf.shopee.vn/file/ba61750a46794d8847c3f463c5e71cc4">
                                            </div>
                                            <div class="DlL0zX"><span class="adF7Xs">Tài khoản của tôi</span></div>
                                        </a></div>

                                </div>
                                <div class="stardust-dropdown">
                                    <div class="stardust-dropdown__item-header"><a class="+1U02e"
                                            href="<?= _WEB_ROOT ?>/account/myorder">
                                            <div class="bfikuD"><img
                                                    src="https://cf.shopee.vn/file/f0049e9df4e536bc3e7f140d071e9078">
                                            </div>
                                            <div class="DlL0zX"><span class="adF7Xs">Đơn Mua</span></div>
                                        </a></div>
                                    <div class="stardust-dropdown__item-body">
                                        <div class="Yu7gVR"></div>
                                    </div>
                                </div>
                                <a class="+1U02e" href="/doi-mat-khau">
                                    <div class="bfikuD"><i class="bi bi-key"></i></div>
                                    <div class="DlL0zX"><span class="adF7Xs">Đổi Mật Khẩu</span></div>
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{literal}
    <script>
        function validateForm() {
            let name = document.getElementById("firstName").value.trim();
            let email = document.getElementById("email").value.trim();
            let phone = document.getElementById("phone").value.trim();
            let errors = [];
    
            if (name === "") {
                errors.push("Vui lòng nhập tên");
                document.getElementById("nameError").textContent = "Vui lòng nhập tên";
            } else if (!/^[a-zA-Z ]+$/.test(name)) {
                errors.push("Tên chỉ chứa chữ, không chứa số và dấu");
                document.getElementById("nameError").textContent = "Tên chỉ chứa chữ, không chứa số và dấu";
            } else {
                document.getElementById("nameError").textContent = "";
            }
            if (phone.length !== 10 || phone.charAt(0) !== '0') {
                errors.push("Số điện thoại gồm 10 số");
                document.getElementById("phoneError").textContent = "Số điện thoại gồm 10 số";
            } else {
                document.getElementById("phoneError").textContent = "";
            }
    
            if (email === "") {
                errors.push("Vui lòng nhập email");
                document.getElementById("emailError").textContent = "Vui lòng nhập email";
            } else if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$/.test(email)) {
                errors.push("Email không hợp lệ");
                document.getElementById("emailError").textContent = "Email không hợp lệ";
            } else {
                document.getElementById("emailError").textContent = "";
            }
    
            if (errors.length > 0) {
                return false;
            } else {
                return true;
            }
        }
    </script>
    {/literal}
    
