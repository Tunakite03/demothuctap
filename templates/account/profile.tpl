<section class="content-section">
    <div class="container-fluid">
        <div class="row">



            <div class="col-3">
                <ul class="nav nav-tabs flex-column">
                    <li class="nav-item ">
                        <a class="nav-link active" data-toggle="tab" href="#tab_user">Thông tin tài khoản</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tab_infouser">Thông tin giao hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tab_orders">Đơn hàng của bạn</a>
                    </li>
                </ul>

            </div>

            <div class="col-9 tab-content" style=" padding:0D 20px; justify-content:center">

                <div id="tab_user" class="tab-pane fade show active">
                    <div class="text-center mb-5">
                        <h3 class="title_sp ">
                            <span class="bg bg-white">
                                Thông tin tài khoản
                            </span>
                        </h3>
                    </div>
                    <div class="container rounded bg-white mt-5 mb-5">
                        <div class="row">
                            <div class="col-md-3 border-right">
                                <div class="d-flex flex-column align-items-center text-center p-50 py-50">
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

                                <div class=" mb-3">
                                    <label for="firstName">Họ và Tên</label>
                                    <input type="text" class="form-control" id="fullName" name="fullname" placeholder=""
                                        value="{$data_user.fullname}">
                                    <div id="fullnameError" class="text-danger fw-bold">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="...@gmail.com"
                                        disabled value="{$data_user.email}">
                                    <div id="emailError" class="text-danger fw-bold">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="phone">Số Điện Thoại</label>
                                    <input type="tel" class="form-control" id="phonenumber"
                                        value="{$data_user.phonenumber}" name="phonenumber" placeholder="086..."
                                        required>
                                    <div id="phoneError" class="text-danger fw-bold">
                                    </div>
                                </div>
                                <div class="text-center wrap-btn-more">
                                    <a type="button" id="updateuser" class="button_order p-2">Cập nhật thông
                                        tin</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="tab_infouser">
                    <div class="container w-75 mt-5">
                        <h4 class="mb-3">Đỉa chỉ nhận hàng</h4>
                        <div class="mb-3">
                            <label for="fullName">Họ và Tên</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" placeholder=""
                                id="nameError" value="{if isset($dataInfoUser)}{$dataInfoUser.fullname}{/if}"
                                class="text-danger fw-bold">
                        </div>
                        <div class="mb-3">
                            <label for="phone">Số Điện Thoại</label>
                            <input type="tel" class="form-control" id="phone"
                                value="{if isset($dataInfoUser)}{$dataInfoUser.phone}{/if}" placeholder="039..."
                                required>
                            <div id="phoneError" class="text-danger fw-bold">
                            </div>
                        </div>

                        <div class="row justify-content-between gap-3">
                            <div class="col-12 mb-3 p-0">
                                <label for="province">Tỉnh/Thành Phố</label>
                                <select class="custom-select d-block w-100 form-control" id="province" name="province"
                                    required>
                                    {if isset($dataInfoUser)}
                                        <option value="{$dataInfoUser.province}" data-name="{$dataInfoUser.province}">
                                            {$dataInfoUser.province}</option>
                                    {/if}
                                </select>
                            </div>
                            <div class="col-12 mb-3 p-0">
                                <label for="district">Quận/Huyện</label>
                                <select class="custom-select d-block w-100 form-control" id="district" name="district"
                                    required>
                                    {if isset($dataInfoUser)}
                                        <option value="{$dataInfoUser.district}" data-name="{$dataInfoUser.district}">
                                            {$dataInfoUser.district}</option>
                                    {/if}
                                </select>
                            </div>
                            <div class="col-md-12 mb-3 p-0">
                                <label for="ward">Xã/phường</label>
                                <select class="custom-select d-block w-100 form-control" id="ward" name="ward" required>
                                    {if isset($dataInfoUser)}
                                        <option value="{$dataInfoUser.ward}" data-name="{$dataInfoUser.ward}">
                                            {$dataInfoUser.ward}
                                        </option>
                                    {/if}
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="street">Địa chỉ</label>
                            <input type="text" class="form-control" id="street" name="street"
                                value="{if isset($dataInfoUser)}{$dataInfoUser.street}{else}{/if}"
                                placeholder="Đường..." required>
                            <div id="addressError" class="text-danger fw-bold">
                            </div>
                        </div>

                        <div class="text-center wrap-btn-more">
                            <a type="button" id="updateInfoUser" class="button_order p-2">Cập
                                nhật thông tin giao
                                hàng</a>
                        </div>

                    </div>

                </div>


                <div class="tab-pane fade" id="tab_orders">
                    <div class="row">
                        {if empty($dataOrderItem)}
                            <div class="col-12 p-5">
                                <h4 class="text-center px4 py-3">Bạn chưa có đơn hàng nào!!!</h4>
                                <div class="text-center py-2">
                                    <a href="/cua-hang" class="btn btn-login text-center w-25 m-auto">Mua sắm ngay </a>
                                </div>
                            </div>
                        {else}
                            <div class=" col-12 mt-4 " id="cart_wrapper">
                                <div class="container p-2 py-4" style="background-color: #fff;">
                                    {foreach from=$dataOrderItem item=product}
                                        <div class="d-flex p-2" style="border: 1px solid #ccc;  ">
                                            <a href="/{$product.link_url}-id{$product.product_id}">
                                                <img src="{$domain}/public/assets/img/img_pet/{$product.image}" alt=""
                                                    width="100">
                                            </a>
                                            <div class="wrap-content-product flex-column">
                                                <div style="width: 300px">
                                                    {$product.name}
                                                </div> <br>
                                                <span>
                                                    Giá: {number_format($product.price,0,'.','.')} VND
                                                </span> <br>
                                                <span>
                                                    Số lượng: {$product.quantity}
                                                </span> <br>
                                            </div>
                                            <span>
                                                Tổng tiền: {number_format($product.price*$product.quantity,0,'.','.')}
                                                VND
                                            </span>
                                            <span>
                                                Trạng thái
                                                {$product.status}
                                            </span>
                                        </div>
                                    {/foreach}


                                </div>
                            </div>


                        {/if}
                    </div>
                </div>

            </div>
        </div>

</section>