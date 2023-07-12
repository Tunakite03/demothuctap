<section class="content-section" style="background-color: #f5f5f7;">
    <div class="container-fluid"> {if !empty($errorsCart)} <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading">Lỗi: </h4> {foreach from=$errorsCart item=error} <p> {$error} </p>
                {/foreach}
                <hr>
            </div>
        {/if}
        <div class="row"> {if empty($data)}
                <div class="col-12 p-5">
                    <h4 class="text-center px4 py-3">Giỏ hàng của bạn đang trống !!</h4>
                    <div class="text-center py-2"> {assign var="links" value=['/shopdog','/shopcat']}
                        <a href="/cua-hang" class="btn btn-login text-center w-25 m-auto">Mua sắm ngay </a>
                    </div>
                </div>
            {else}

                <h1 class="text-center">Giỏ Hàng Của Bạn</h1>
                <div class="col-lg-9 col-12 mt-4 " id="cart_wrapper">
                    <div class="container p-2 py-4" style="background-color: #fff;">

                        <table class="table ">
                            <thead>
                                <tr>
                                    <th>Hình ảnh</th>
                                    <th style="width: 300px">Tên Sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số Lượng</th>
                                    <th>Tổng cộng</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tbl_data_cart">
                                {foreach from=$data item=product} <tr>
                                        <td><a href="/{$product.link_url}-id{$product.product_id}">
                                                <img src="{$domain}/public/assets/img/img_pet/{$product.image}" alt=""
                                                    width="100">

                                            </a>
                                        </td>
                                        <td>{$product.name}</td>
                                        <td>{number_format($product.price*$product.sale,0,'.','.')} VND</td>
                                        <td>
                                            <div class="input-group">
                                                <button type="button" class="btn btn-outline-primary minus-btn">-
                                                </button>
                                                <input type="number" value="{$product.quantity}" min="1"
                                                    style="width: 60px; padding: 0 5px;"
                                                    class="btn btn-outline-primary quantity-pro outline-none"
                                                    id="quantity_pro_{$product.id}" name="quantity[{$product.id}]" disabled
                                                    data-cart-id="{$product.id}">
                                                <button type="button" class="btn btn-outline-primary plus-btn">+
                                                </button>
                                            </div>
                                        </td>
                                        <td>{number_format($product.price*$product.sale*$product.quantity,0,'.','.')} VND
                                        </td>
                                        <td><span class="ri-delete-bin-line delete-product" style="cursor: pointer"> </span>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>


                    </div>
                </div>

                <div class="col-lg-3 col-12 mt-4" id="payment_wrapper">
                    <div class="total-info px-2 py-4" style="background-color: #fff;">
                        <h4 class="py-3 text-center">Thông tin thanh toán</h4>
                        <table class="cart-total table">
                            <tbody id="payment_body">
                                <tr class="order-subtotal">
                                    <td class="cart-total-left"><label><b>Tổng cộng:</b></label></td>
                                    <td class="cart-total-right"><span
                                            class="value-summary">{number_format($datatotal.total+$datatotal.reduce, 0, '.', '.')}
                                            VND</span></td>
                                </tr>
                                <tr>
                                    <td class="cart-total-left"><label><b>Giảm giá:</b></label></td>
                                    <td class="cart-total-right"><span
                                            class="value-summary">{number_format($datatotal.reduce, 0, '.', '.')}
                                            VND</span></td>
                                </tr>
                                <tr class="order-total">
                                    <td class="cart-total-left"><label><b>Số tiền phải thanh toán:</b></label></td>
                                    <td class="cart-total-right"><span
                                            class="value-summary">{number_format($datatotal.total, 0, '.', '.')}
                                            VND</span></td>
                                </tr>
                            </tbody>

                        </table>
                        <div class="text-end mt-4"> <a href="/thanh-toan" class="btn btn-login"
                                style="border-radius: 5px;">Tiến hành thanh toán</a> </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
    </div>
</section>