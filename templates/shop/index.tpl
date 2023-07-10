<!-- Product Section Begin -->
<section class="product spad ">
    <div class="container">
        <div class="row">
            <!-- Search -->
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar-item">
                        <h4 class="" style="font-weight: 700;">Danh mục sản phẩm</h4>
                        {* danh mục *}
                    </div>
                    {* <div class="sidebar-item">
                        <h4>Giá</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                data-min="0" data-max="1500000">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input mt-3 d-flex justify-content-between">
                                    <input type="number" id="minamount" min="0" value="0" class="px-2"
                                        style="width: fit-content !important; outline: none;" readonly>
                                    <input type="number" id="maxamount" value="1500000" class="px-2"
                                        style="width: fit-content !important; outline: none;" readonly>
                                </div>
                            </div>
                        </div>
                    </div> *}
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
                        <div class="product-discount-slider owl-carousel">
                            {foreach from=$dataproductsale item=item key=key}
                                <div class="col-lg-4 m-auto w-100 p-2 justify-content-center">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg">
                                            <img src="{$domain}/public/assets/img/img_pet/{$item.image}" alt=""
                                                width="100%">
                                            <div>
                                                <div class="product__discount__percent">-
                                                    {$discount_percent = round(($item.price - $item.sale) / $item.price * 100)}{$discount_percent}%
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <h6><a href="/cua-hang/chi-tiet-san-pham/{$item.id}"><span>
                                                        {$item.name}
                                                    </span></a></h6>
                                            <!-- <h5><a href="#">Raisin’n’nuts</a></h5> -->
                                            <div class="product__item__price">
                                                <p style="color: crimson;">
                                                    {$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}đ
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
                {* <?php } ?>

                    <!-- products -->
                    <?php
                            if ($productsCat->rowCount() > 0) {
                            ?>
                    <div class="container">
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
                                            <h6>
                                                Có
                                                <span>
                                                    <?php
                                                        $totalProducts = $productsCat->rowCount();
                                                        echo $totalProducts;
                                                        ?>
                                                </span> sản phẩm
                                            </h6>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="row">
                                <?php
                                    $productsToShow = array_slice($productsCat->fetchAll(), $from, $productsPerPage);

                                    $totalPages = ceil($totalProducts / $productsPerPage);

                                    foreach ($productsToShow as $product) { ?>

                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product-item">
                                        <div class="product-item-pic set-bg">
                                            <img src="<?php echo _WEB_ROOT ?>/public/assets/img/img_pet/<?php echo $product["
                                                image"] ?>" alt="" width="100%">

                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="/cart/addtocart/<?= $product[" id"] ?>"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product-item-text">
                                            <h6><a href="<?= _WEB_ROOT ?>/shopcat/detail/<?php echo $product[" id"]
                                                ?>"><span>
                                                        <?php echo $product["name"] ?>
                                                    </span></a></h6>

                                            <?php
                                                    if ($product["price"] > $product["sale"] && $product["sale"] == 0) {
                                                        echo '<h5 style="color:red;">
                                        ' . number_format($product['price']) . '<sup><u>đ</u></sup></br></h5>';
                                                        } else {
                                                            echo '<h5 >
                                        <font color="red">' . number_format($product['sale']) . '<sup><u>đ</u></sup></font>
                                        <strike>' . number_format($product['price']) . '</strike><sup><u>đ</u></sup></br></h5>';
                                                        }
                                                        ?>
                                        </div>
                                    </div>
                                </div>
                                <?php } ?>
                                <!-- display the pagination links -->
                                <div class="product-pagination text-center">
                                    <?php if ($currentPage > 1) : ?>
                                    <a href="?page=<?php echo $currentPage - 1; ?>"><i
                                            class="fa fa-long-arrow-left"></i></a>
                                    <?php endif; ?>
                                    <?php for ($i = 1; $i <= $totalPages; $i++) : ?>
                                    <a href="?page=<?php echo $i; ?>" <?php if ($i===$currentPage) echo 'class="active"' ;
                                        ?>>
                                        <?php echo $i; ?>
                                    </a>
                                    <?php endfor; ?>
                                    <?php if ($currentPage < $totalPages) : ?>
                                    <a href="?page=<?php echo $currentPage + 1; ?>"><i
                                            class="fa fa-long-arrow-right"></i></a>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <?php
                            } else {
                                ?>
                            <div class="row">
                                <div class="col-12">
                                    <p>Không có sản phẩm</p>
                                </div>
                            </div>
                            <?php
                            }
                                ?>
                        </div>
                    </div> *}

            </div>

        </div>
</section>