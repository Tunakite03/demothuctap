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
            {else} <h1 class="text-center">Giỏ Hàng Của Bạn</h1>
                <div class="col-lg-9 col-12 mt-4 ">
                    <div class="container p-2 py-4" style="background-color: #fff;">
                        <form action="/cart/updateCart" method="post">
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
                                <tbody> {foreach from=$data item=product} <tr>
                                            <td>
                                                <img src="{$domain}/public/assets/img/img_pet/{$product.image}" alt=""
                                                    width="100">
                                            </td>
                                            <td>{$product.name}</td>
                                            <td>{number_format($product.price,0,'.','.')} VND</td>
                                            <td>
                                                <div class="input-group"> <button type="button"
                                                        class="btn btn-outline-primary minus-btn">-</button> <input
                                                        type="number" value="{$product.quantity}" min="1"
                                                        style="width: 60px; padding: 0 5px;"
                                                        class="btn btn-outline-primary quantity-pro"
                                                        name="quantity[{$product.id}]"> <button type="button"
                                                        class="btn btn-outline-primary plus-btn">+</button> </div>
                                            </td>
                                            <td>{number_format($product.price*$product.sale*$product.quantity,0,'.','.')} VND
                                            </td>
                                            <td><a class="ri-delete-bin-line delete-product" style="cursor: pointer"
                                                    href="/cart/deleteItem/{$product.id}"> </a></td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                            <div class="text-end mt-4"> <button class="btn btn-outline-success" style="border-radius: 5px;"
                                    type="submit" name='updateCart'>Cập nhật giỏ hàng</button> </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-12 mt-4">
                    <div class="total-info px-2 py-4" style="background-color: #fff;">
                        <h4 class="py-3 text-center">Thông tin thanh toán</h4>
                        <table class="cart-total table">
                            <tbody>
                                <tr class="order-subtotal ">
                                    <td class="cart-total-left"><label>Tổng phụ:</label></td>
                                    <td class="cart-total-right"><span
                                            class="value-summary">{number_format($totalMoney.totalMoney,0,'.','.')}
                                            VND</span></td>
                                </tr>
                                <tr class="order-total">
                                    <td class="cart-total-left"><label>Tổng cộng:</label></td>
                                    <td class="cart-total-right"><span
                                            class="value-summary">{number_format($totalMoney.totalMoney,0,'.','.')}
                                            VND</span></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="text-end mt-4"> <a href="/checkout" class="btn btn-login"
                                style="border-radius: 5px;">Tiến hành thanh toán</a> </div>
                    </div>
            </div> {/if}
        </div>
    </div>
    </div>
</section>

<script>
    // Add an event listener to the delete button {literal} document.querySelectorAll('.delete-product').forEach(function(button) { button.addEventListener('click', function(event) { event.preventDefault(); // Show the SweetAlert confirmation dialog Swal.fire({ title: 'Bạn có chắc chắn muốn xóa sản phẩm này?', text: "Hành động này không thể hoàn tác!", icon: 'warning', showCancelButton: true,
        confirmButtonColor: '#3085d6', cancelButtonColor: '#d33', confirmButtonText: 'Đồng ý', cancelButtonText: 'Hủy bỏ'
        }).then((result) => { // If the user clicked "OK", redirect to the delete URL if (result.isConfirmed) { window.location.href = button.href; } }); }); });
                {/literal}
</script>
<script>
    $('.plus-btn').on('click', function() {
        var quantityInput = $(this).siblings('.quantity-pro');
        var currentValue =
            parseInt(quantityInput.val());
        quantityInput.val(currentValue + 1);
    });
    $('.minus-btn').on('click', function() {
        var quantityInput = $(this).siblings('.quantity-pro');
        var currentValue =
            parseInt(quantityInput.val());
        if (currentValue > 1) { quantityInput.val(currentValue - 1); }
    });
    $('.quantity-pro').on('input', function(event) {
        var value = $(this).val();
        if (value === '0' || value === '-' ||
            value === '+') { $(this).val(''); }
    });
    $('.quantity-pro').on('input', function(event) {
        var value = $(this).val();
        value = value.replace(/[+]/g, '');
        $(this).val(value);
    });
</script>