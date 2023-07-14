<section class="content-section">
    <div class="w-75 row m-auto">
        <div class="col-6 my-3">
            <div class="detail_content">
                <div class="title-header">
                    <h5>Thông tin nhận hàng</h5>
                    <div class="flex-column">
                        <div class="p-1"><strong>Tên</strong>: {$dataInfoUser.fullname}</div>
                        <div class="p-1"><strong>Sdt</strong>: {$dataInfoUser.phone}</div>
                        <div class="p-1"><strong>Địa chỉ</strong>: {$dataOrderItem.address}</div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-6 my-3">
            <div class="detail_content">
                <div class="title-header">
                    <h5>Trạng thái đơn hàng</h5>
                    <div class="flex-column">
                        <div class="p-1"><strong>Ngày đặt:</strong> {$dataOrderItem.date}</div>
                        <div class="p-1" id="status-order"><strong>Tình trạng: </strong> {$dataOrderItem.status_name}
                        </div>
                        <div class="p-1"><strong>Phương thức thanh toán:</strong>
                            {if $dataOrderItem.payment_method == 1}
                                Thanh toán trực tiếp
                            {else}
                                Thanh toán qua ngân hàng
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 py-3 border-top border-1">
            <div class="order-detail">
                <div class="d-flex p-2 justify-content-around p-2">
                    <a href="/{$dataOrderItem.link_url}-id{$dataOrderItem.product_id}">
                        <img src="{$domain}/public/assets/img/img_pet/{$dataOrderItem.image}" alt="" width="100"
                            class="border border-1">
                    </a>
                    <div class="wrap-content-product flex-column">
                        <div style="width: 300px">
                            <strong>{$dataOrderItem.name}</strong>
                        </div> <br>
                        <span>
                            <strong>
                                Giá:
                            </strong>
                            {number_format($dataOrderItem.price,0,'.','.')} VND
                        </span> <br>
                        <span>
                            <strong>
                                Số lượng:
                            </strong>
                            {$dataOrderItem.quantity}
                        </span> <br>
                    </div>
                    <span>
                        <strong>Tổng tiền:</strong>
                        {number_format($dataOrderItem.price*$dataOrderItem.quantity,0,'.','.')}
                        VND <br>
                        <div id="wrap_button">
                            {if $dataOrderItem.status == 1}
                                <button class="btn btn-success mt-5" data-order-id="{$dataOrderItem.id}"
                                    id="update-order">Chỉnh
                                    sửa thông tin</button>
                                <button class="btn btn-warning mt-5" data-order-id="{$dataOrderItem.id}"
                                    data-product-id={$dataOrderItem.product_id} id="cancle-order">Hủy đơn hàng</button>
                            {/if}
                        </div>

                    </span>

                </div>
            </div>
        </div>
    </div>

</section>