<section class="content-section" style="background-color: #f5f5f7;">
    <div class="container-fluid">
        <div class="row" id="formlike">
            {if empty($CountLikeProduct)}

                <div class="col-12 p-5">
                    <h4 class="text-center px4 py-3">Danh sách yêu thích của bạn đang trống !!</h4>
                    <div class="text-center py-2">
                        <a href="/cua-hang" class="btn btn-login text-center w-25 m-auto">Tham quan ngay</a>
                    </div>
                </div>

            {else}
                <h1 class="text-center">Danh Sách Yêu Thích Của Bạn</h1>
                <div class="col-lg-12 col-12 mt-4 ">
                    <div class="container p-2 py-4" style="background-color: #fff;">
                        <form action="" method="">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th>Hình ảnh</th>
                                        <th style="width: 300px">Tên Sản phẩm</th>
                                        <th>Giá</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="tbl_data_likeproduct">
                                    {foreach from=$ListLikeProduct item=product}
                                        <tr>
                                            <td><img src="{$domain}/public/assets/img/img_pet/{$product.image}" alt=""
                                                    width="100"></td>
                                            <td>{$product.product_name}</td>
                                            <td>{number_format($product.price, 0, ".", ".")} VND</td>
                                            <td><a  data-like-id={$product.id} class="ri-delete-bin-line delete-product" style="cursor: pointer"></a></td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            {/if}
        </div>

    </div>
    </div>
</section>