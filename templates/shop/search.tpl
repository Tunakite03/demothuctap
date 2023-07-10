{$count = 0}
{foreach from=$data_search item=item key=key}
    {$count = $count + 1}
{/foreach}
<section class="" style="padding-top:10rem;">
    <div class="container">
        {if $count > 0}
            <div class="row">
                <h3>Có <span>
                        {$count}
                    </span> kết quả phù hợp với từ khóa "<span>{$key_search}</span>"</h3>
            </div>
            <div class="row">
                {foreach from=$data_search item=item key=key}
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product-item">
                            <div class="product-item-pic set-bg">
                                <img src="{$domain}/public/assets/img/img_pet/{$item.image}" alt="" width="100%">

                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
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
        {else}
            <div class="row">
                <h3>Không có kết quả phù hợp với từ khóa "
                {$key_search}"
                </h3>
            </div>
        {/if}
    </div>
    </div>
</section>