<section class="content-section">
    <!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img style="height:600px" class="w-100" src="{$domain}/public/assets/img/carousel01.jpg"
                        alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img style="height:600px" class="w-100" src="{$domain}/public/assets/img/carousel02.jpg"
                        alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->

    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="about-img position-relative overflow-hidden p-5 pe-0">
                        <img class="img-fluid w-100" src="{$domain}/public/assets/img/PetPosterHome.jpg">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h1 class="display-5 mb-4">Cửa hàng số 1 về cung cấp thức ăn, đồ dùng cho vật nuôi.</h1>
                    <p class="mb-4">Hãy an tâm khi mua hàng tại chúng tôi vì sản phẩm ở đây được nhập khẩu có nguồn gốc
                        rõ ràng, chính ngạch.
                    </p>
                    <p><i class="fa fa-check text-secondary me-3"></i>Đầy đủ thức ăn cho vật nuôi</p>
                    <p><i class="fa fa-check text-secondary me-3"></i>Cung cấp đủ đồ chơi, vật dụng cho bé cưng của bạn
                    </p>
                    <p><i class="fa fa-check text-secondary me-3"></i>Với những thương hiệu nổi tiếng trên toàn thế giới
                    </p>
                    <a class="btn btn-secondary rounded-pill py-3 px-5 mt-3" href="/san-pham">Tham quan ngay</a>

                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Product New Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0 gx-5 align-items-end">
                <div class="col-lg-12">
                    <div class="section-header text-start mb-5 wow fadeInUp " data-wow-delay="0.1s"
                        style="max-width: 1000px;">
                        <h1 class="display-5 mb-3">Sản phẩm mới cập nhật</h1>
                    </div>
                </div>
            </div>
            <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="dogItem" role="tabpanel" aria-labelledby="dogItem-tab">
                    <div class="row g-4">
                        <!--getListProductNew_Dog-->
                        {foreach from=$dataProductNews item=item key=key}
                            <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="product-item">
                                    <a class="d-block h5 mb-2" href="/shopdog/detail/{$item.id}">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100"
                                                src="{$domain}/public/assets/img/img_pet/{$item.image}" alt="">
                                            <div
                                                class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                                New</div>
                                        </div>
                                        <div class="text-center p-4">

                                            <a class="d-block h5 mb-2">
                                                {$item.name}
                                            </a>
                                            <span class="text-secondary me-1">
                                                {if $item.price gt $item.sale and $item.sale eq 0}
                                                    <h5 style="color:red;">
                                                        {$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup></br>
                                                    </h5>
                                                {else}
                                                    <h5>
                                                        <font color="red">
                                                            {$formatted_price = $item.sale|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup>
                                                        </font>
                                                        <strike>{$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}</strike><sup><u>đ</u></sup></br>
                                                    </h5>
                                                {/if}


                                            </span>
                                            <span class="me-1 d-block mb-2" href="">
                                                lượt mua:
                                                {$item.number_sell}
                                            </span>

                                        </div>

                                        <div class="d-flex border-top">
                                            <small class="w-50 text-center border-end py-2">
                                                <a class="text-body" href="shopdog/detail/"><i
                                                        class="fa fa-eye text-secondary me-2"></i>Xem</a>
                                            </small>
                                            <small class="w-50 text-center py-2">
                                                <a class="text-body"
                                                    href="<?= _WEB_ROOT ?>/cart/addtocart/<?= $set['id'] ?>"><i
                                                        class="fa fa-shopping-bag text-secondary me-2"></i>Thêm vào giỏ
                                                    hàng</a>
                                            </small>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        {/foreach}
                        <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                            <a href="/san-pham" class="btn btn-secondary rounded-pill py-3 px-5">Xem
                                thêm </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Product New End -->


    <!-- Product Trend Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0 gx-5 align-items-end">
                <div class="col-lg-6">
                    <div class="section-header text-start mb-5 wow fadeInUp" data-wow-delay="0.1s"
                        style="max-width: 500px;">
                        <h1 class="display-5 mb-3">Sản phẩm bán chạy</h1>
                    </div>
                </div>
            </div>
            <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="dogItemNew" role="tabpanel" aria-labelledby="dogItemNew-tab">
                    <div class="row g-4">
                        <!--getListProductTrend_Dog-->
                        {foreach from=$dataProductTrents item=item key=key}
                            <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="product-item">
                                    <a class="d-block h5 mb-2" href="/shopdog/detail/{$item.id}">
                                        <div class="position-relative bg-light overflow-hidden">
                                            <img class="img-fluid w-100"
                                                src="{$domain}/public/assets/img/img_pet/{$item.image}" alt="">
                                            <div
                                                class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">
                                                New</div>
                                        </div>
                                        <div class="text-center p-4">

                                            <a class="d-block h5 mb-2">
                                                {$item.name}
                                            </a>
                                            <span class="text-secondary me-1">
                                                {if $item.price gt $item.sale and $item.sale eq 0}
                                                    <h5 style="color:red;">
                                                        {$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup></br>
                                                    </h5>
                                                {else}
                                                    <h5>
                                                        <font color="red">
                                                            {$formatted_price = $item.sale|number_format:0:',':'.'}{$formatted_price}<sup><u>đ</u></sup>
                                                        </font>
                                                        <strike>{$formatted_price = $item.price|number_format:0:',':'.'}{$formatted_price}</strike><sup><u>đ</u></sup></br>
                                                    </h5>
                                                {/if}
                                            </span>
                                            <span class="me-1 d-block mb-2" href="">
                                                lượt mua:
                                                {$item.number_sell}
                                            </span>

                                        </div>

                                        <div class="d-flex border-top">
                                            <small class="w-50 text-center border-end py-2">
                                                <a class="text-body" href="shopdog/detail/"><i
                                                        class="fa fa-eye text-secondary me-2"></i>Xem</a>
                                            </small>
                                            <small class="w-50 text-center py-2">
                                                <a class="text-body"
                                                    href="<?= _WEB_ROOT ?>/cart/addtocart/<?= $set['id'] ?>"><i
                                                        class="fa fa-shopping-bag text-secondary me-2"></i>Thêm vào giỏ
                                                    hàng</a>
                                            </small>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        {/foreach}
                        <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                            <a class="btn btn-secondary rounded-pill py-3 px-5" href="/san-pham">Xem Thêm</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Product Trend End -->





    <!-- Blog Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s"
                style="max-width: 500px;">
                <h1 class="display-5 mb-3">Bài Viết Gần Nhất</h1>
            </div>
            <div class="row g-4">
                {* <?php
                while ($set = $news_lastest->fetch()) :
                ?>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <img class="img-fluid" src="{$domain}/public/assets/img/img_news/<?php echo $set[" img_news"] ?>"
                    alt="">
                    <div class="bg-light p-4">
                        <a class="d-block h5 lh-base mb-4" href="{$domain}/news/detail/<?php echo $set[" id"] ?>">
                            <?php echo $set["name"] ?>
                        </a>
                        <div class="text-muted border-top pt-4">
                            <small class="me-3"><i class="fa fa-user text-secondary me-2"></i>Admin</small>
                            <small class="me-3"><i class="fa fa-calendar text-secondary me-2"></i>
                                <?php echo $set['uptime'] ?>
                            </small>
                        </div>
                    </div>
                </div>
                <?php
                endwhile;
                ?> *}
            </div>
        </div>
    </div>
    <!-- Blog End -->

</section>