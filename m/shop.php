<?php

/**
 * m/shop.php dành cho các thông tin chưa login tất cả được điều hướng và xử lý tại đây
 */

/**
 * BEGIN Trang shop
 */


switch ($act) {
    case 'index':
        $title .= 'cửa hàng';

        $product = new products();
        $cate = new product_category();
  
      
        $data_products_sale = $product->getProductSaleAll();
        $data_products_all = $product->getProductAll();
        $data_cate_root = $cate->getListCateRoot();
        $data_cate_not_root = $cate->getListCateNotRoot();

        $count_pd = count($product->getProductAll());

    


        $st->assign('dataproductsale', $data_products_sale);
        $st->assign('dataproductall', $data_products_all);
        $st->assign('dataCateRoot', $data_cate_root);
        $st->assign('dataCateNotRoot', $data_cate_not_root);
        $st->assign('count_pd', $count_pd);

        break;
    case 'detail':
        $title .= 'chi tiết san phẩm';
        $product = new products();

        $product->set('link_url', $main->get('link_url'));
        $product->set('id', $main->get('id'));

        $data_detail = $product->getProducById();

        if (!isset($data_detail['id'])) {
            $main->redirect($link . "/404");
        } else {
            $st->assign('data_detail', $data_detail);
        }
        break;
    case 'search':
        $title .= 'tìm kiếm san phẩm';
        $product = new products();


        $product->set('key', $main->post('key'));
        $data_search = $product->getProductSearch();

        $st->assign('data_search', $data_search);
        $st->assign('key_search', $main->post('key'));


        break;
    case 'error':
        $title .= 'Loi';
        break;

    default:
        $main->redirect('/404');
        break;
}
