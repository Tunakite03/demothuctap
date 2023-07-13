<section class="content-section">
    <div class="container py-5">
        {if empty($infoCart)}
            <h5 class="text-center">Bạn chưa thể thanh toán lúc này!!</h5>
            <p class="text-center">Bạn chưa có sản phẩm nào trong giỏ hàng. Vui lòng thêm sản phẩm trước khi thanh toán bạn
                nhé.</p>
            <div class="text-center wrap-btn-more">
                <a id="button-1" class="button_more" href="/cua-hang">Shop Now!<img id="arrow-hover"
                        src="https://github.com/atloomer/atloomer.github.io/blob/master/img/iconmonstr-paper-plane-1-120.png?raw=true" /></a>
            </div>
        {else}
            <div class="py-5 text-center">
                <h2 style="color: orangered;">THÔNG TIN VẬN CHUYỂN</h2>
            </div>
            <div class="row">
                <div class="col-md-6 order-md-2 mb-4">
                    <!-- Hiện thị giỏ hàng -->
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Giỏ Hàng của bạn</span>
                        <span class="badge badge-secondary badge-pill">{count($infoCart)}</span>
                    </h4>
                    <ul class="list-group mb-3">
                        {foreach from=$infoCart item=value key=key}

                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0">{$value.name}</h6>
                                    <small class="text-muted">Số lượng: {$value.quantity}
                                    </small>
                                </div>
                                <span class="text-muted">{number_format($value.price*$value.sale*$value.quantity, 0, ".", ".")}
                                    VND</span>
                            </li>
                        {/foreach}

                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total </span>
                            <strong>
                                {number_format($datatotal.total, 0, ".", ".")} VND
                            </strong>
                        </li>
                    </ul>
                    <label for="payment_method">Phương thức thanh toán</label>
                    <select name="" id="payment_method" class="form-control mb-2">
                        <option value="1" selected>Thanh toán khi nhận hàng</option>
                        <option value="2">Chuyển khoản trực tiếp</option>
                    </select>

                    <button class="btn btn-secondary float-end px-4" type="button" name="checkoutSubmit"
                        id="checkoutSubmit">Đặt
                        hàng</button>

                </div>
                <div class="col-md-6 order-md-1">
                    <h4 class="mb-3">Đỉa chỉ nhận hàng</h4>
                    <div class="mb-3">
                        <label for="fullName">Họ và Tên</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="" id="nameError"
                            value="{if isset($dataInfoUser)}{$dataInfoUser.fullname}{/if}" class="text-danger fw-bold">
                    </div>
                    <div class="mb-3">
                        <label for="phone">Số Điện Thoại</label>
                        <input type="tel" class="form-control" id="phone"
                            value="{if isset($dataInfoUser)}{$dataInfoUser.phone}{/if}" placeholder="039..." required>
                        <div id="phoneError" class="text-danger fw-bold">
                        </div>
                    </div>

                    <div class="row justify-content-between gap-3">
                        <div class="col-12 mb-3 p-0">
                            <label for="province">Tỉnh/Thành Phố</label>
                            <select class="custom-select d-block w-100 form-control" id="province" name="province" required>
                                {if isset($dataInfoUser)}
                                    <option value="{$dataInfoUser.province}" data-name="{$dataInfoUser.province}">
                                        {$dataInfoUser.province}</option>
                                {/if}
                            </select>
                        </div>
                        <div class="col-12 mb-3 p-0">
                            <label for="district">Quận/Huyện</label>
                            <select class="custom-select d-block w-100 form-control" id="district" name="district" required>
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
                                    <option value="{$dataInfoUser.ward}" data-name="{$dataInfoUser.ward}">{$dataInfoUser.ward}
                                    </option>
                                {/if}
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="street">Địa chỉ</label>
                        <input type="text" class="form-control" id="street" name="street"
                            value="{if isset($dataInfoUser)}{$dataInfoUser.street}{else}{/if}" placeholder="Đường..."
                            required>
                        <div id="addressError" class="text-danger fw-bold">
                        </div>
                    </div>
                    <hr class="mb-4">
                    <button class="btn btn-secondary float-end" type="button" name="updateInfoUser" id="updateInfoUser">Cập
                        nhật thông tin giao
                        hàng</button>

                </div>
            </div>
        {/if}

    </div>

</section>