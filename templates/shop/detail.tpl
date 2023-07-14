<section class="content-section">
    <span id="error_cart" class="alert alert-warning d-none"></span>
    <span id="success_cart" class="alert alert-warning d-none"></span>
    <div class="container-lg my-5">
        <div class="row">
            <div class="col-md-6">
                <div class="text-end ">
                    <div id="wrapper">
                        <div id="slider-wrap">
                            <ul id="slider">
                                {* if($set.hinh==$res.hinh){ *}
                                <li data-color="#1abc9c">
                                    <a data-fancybox="gallery"
                                        href="{$domain}/public/assets/img/img_pet/{$data_detail.image}">
                                        <img src="{$domain}/public/assets/img/img_pet/{$data_detail.image}"
                                            width="500px" height="450px" class="img_spdetail">
                                    </a>
                                </li>
                                {* } *}

                            </ul>

                            <!--controls-->
                            <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
                            <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
                            <!-- <div id="counter"></div> -->

                            <div id="pagination-wrap">
                                <ul>
                                </ul>
                            </div>
                            <!--controls-->

                        </div>

                    </div>



                    <!-- cuối slide -->

                </div>

            </div>
            <div class="col-md-6">
                <h1 class="mb-4"><span>{$data_detail.name}</span></h1>
                <p class="text-muted">Mã sản phẩm: <span>{$data_detail.id}</span></p>
                {if $data_detail.sale == 1 }
                    <h5 style="color:red;">
                        {$formatted_price = $data_detail.price|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup></br>
                    </h5>
                {else}
                    <h5>
                        <font color="red">
                            {$formatted_price =  ($data_detail.price*(1-(1-$data_detail.sale)))|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup>
                        </font>
                        <strike>{$formatted_price = $data_detail.price|number_format:0:',':'.'}{$formatted_price}</strike><sup><u>đ</u></sup></br>
                    </h5>
                {/if}

                <div class="mb-3">
                    <input type="number" value="{$data_detail.id}" hidden id="product_id">
                    <label for="quantity" class="form-label">Số lượng: {$data_detail.quantity}</label>
                    <div class="input-group">
                        <button type="button" class="btn btn-outline-primary minus-btn" id="minus">-</button>
                        <input style="width: 60px; padding: 0 5px;" type="number"
                            class="btn btn-outline-primary minus-btn" id="quantity-pro" name="quantity" value="1">
                        <button type="button" class="btn btn-outline-primary plus-btn" id="plus">+</button>
                    </div>
                </div>
                <div class="data-action">
                    <button type="button" class="btn btn-warning" id="add_to_cart">Thêm vào giỏ hàng</button>
                    <button class="btn btn-success" id="insertLike"><i class="bi bi-suit-heart-fill"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="data-description">
                    <h3 class="my-4">Mô tả sản phẩm</h3>
                    <p>
                        {$data_detail.des}
                    </p>
                </div>
            </div>
            <!-- Bình luận -->

        </div>
        <div class="row">
            <div class="comments-section comment">
                <h5><i class="fa fa-comments"></i>Bình luận</h5>

                {if isset($smarty.session.loggedID)}
                    <form action="" method="post">
                        <div class="comment-form">
                            <div class="comment-fields">
                                <textarea id="comment" name="content" rows="4" class="form-control"
                                    placeholder="Nhập bình luận của bạn...!!" required></textarea>
                                <div class="text-end">
                                    <button type="submit" name="submitcomment" class="btn btn-danger my-3">Đăng</button>
                                </div>
                            </div>
                        </div>
                    </form>
                {else}
                    <div class="alert alert-success" role="alert">
                        <a href="/account">Bạn cần đăng nhập để Bình Luận!!</a>
                    </div>
                {/if}
                {* {$sount = $comment->rowCount()}
                <div class="midcmt">
                    <span class="totalcmt">
                        <b>{$sount} Bình Luận</b>
                    </span>
                </div>

                <div class="comments">
                    <table>
                        {foreach $comment as $set}
                            <tr>
                                <th style="vertical-align: top;" rowspan="2">
                                    <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png"
                                        height="40px" width="40px" alt="">
                                </th>
                                <td>
                                    <b style="color: darkblue;">
                                        {$set.customer_name}
                                    </b>
                                </td>
                            </tr>
                            <tr>
<td>
                                    <p class="comment-text">
                                        {$set.content}
                                    </p>
                                </td>
                            </tr>
                        {/foreach}
                    </table>
                </div> *}
            </div>
        </div>

    </div>
    </div>
</section>

<script type="text/javascript" src="{$domain}/public/assets/clients/js/detail.js"></script>

<script>


</script>