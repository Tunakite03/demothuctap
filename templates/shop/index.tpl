<!-- Product Section Begin -->
<section class="product spad" style="padding-top: 200px;">
    <div class="container">
        <div class="row">
            <!-- Search -->
            <div class="col-lg-3 col-md-5" style="position: relative; top: 100px">
                <div class="sidebar">
                    <div class="sidebar-item">
                        <h4 class="sidebar-title">DANH MỤC SẢN PHẨM</h4>
                        <hr>
                        <div>
                            <ul class="sidebar-menu">
                                {foreach $dataCateRoot as $item}
                                    {if $item.root_id eq 0}
                                        <li class="sidebar-item">
                                            <p class="sidebar-subtitle cate_click">
                                                <a class="sidebar-link" data-cate-id="{$item.id}">{$item.category}</a>
                                            </p>
                                            <ul class="sidebar-submenu">
                                                {foreach $dataCateNotRoot as $subitem}
                                                    {if $subitem.root_id eq $item.id}
                                                        <li>
                                                            <p class="subcate_click"><a class="sidebar-link"
                                                                    data-subcate-id="{$subitem.id}">{$subitem.category}</a></p>
                                                        </li>
                                                    {/if}
                                                {/foreach}
                                            </ul>
                                        </li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Sale off -->
            <div class="col-lg-9 col-md-7">
                <!-- Sale off -->
                <div class="product-discount">
                    <div class="section-title product-discount-title">
                        <h2><img src="https://seeklogo.com/images/H/hot-sale-mexico-logo-726E38BE8E-seeklogo.com.png"
                                alt="Sale Off" width="150px" height="150px" srcset=""></h2>
                    </div>
                    <div class="row">
                    <h5>Sản phẩm khuyến mãi</h5>

                        <div class="product-discount-slider owl-carousel">
                            {foreach from=$dataproductsale item=item key=key}
                                <div class="col-lg-4 m-auto w-100 p-2 justify-content-center">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
                                            <img src="{$domain}/public/assets/img/img_pet/{$item.image}" alt=""
                                                width="100%">
                                            <div>
                                                <div class="product__discount__percent">-
                                                    {$discount_percent = (1 - $item.sale)*100}{$discount_percent}%
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <h6><a href="/{$item.link_url}-id{$item.id}"><span>
                                                        {$item.name}
                                                    </span></a></h6>
                                            <!-- <h5><a href="#">Raisin’n’nuts</a></h5> -->
                                            <div class="product__item__price">

                                                <p style="color: crimson;">
                                                    {$formatted_price = ($item.price*(1-(1-$item.sale)))|number_format:0:',':'.'}{$formatted_price}đ
                                                </p><span>
                                                    {$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                        <div class="owl-buttons"></div>
                    </div>
                </div>
                <hr>


                <!-- products -->
                {if $count_pd > 0}
                    <div class="container product_show">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter-sort">
                                <span>Xem Theo:</span>
                                <select class="form-control" id="select-price">
                                    <option value="ASC">Tăng Dần</option>
                                    <option value="DESC">Giảm Dần</option>
                                </select>
                            </div>
                        </div>
                        <div class="row" id="product-container">
                            <div class="filter-item">
                                <div class="row justify-content-center">
                                    <div class="col-12 text-center">
                                        <div class="filter-found">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="show_product">
                                {foreach from=$dataproductall item=item key=key}
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product-item">
                                            <div class="product-item-pic set-bg">
                                                <img src="{$domain}/public/assets/img/img_pet/{$item.image}" alt=""
                                                    width="100%">
                                                <ul class="product__item__pic__hover">
                                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="product-item-text">
                                                <h6><a href="/{$item.link_url}-id{$item.id}"><span>{$item.name}</span></a></h6>
                                                <span class="text-secondary me-1">
                                                    {if $item.sale == 1}
                                                        <h5 style="color:red;">
                                                            {$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup></br>
                                                        </h5>
                                                    {else}
                                                        <h5>
                                                            <font color="red">
                                                                {$formatted_price =  ($item.price*(1-(1-$item.sale)))|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup>
                                                            </font>
                                                            <strike>{$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}</strike><sup><u>đ</u></sup></br>
                                                        </h5>
                                                    {/if}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                {else}
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <p>Không có sản phẩm</p>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</section>