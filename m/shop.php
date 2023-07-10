<?php

/**
 * m/shop.php dành cho các thông tin chưa login tất cả được điều hướng và xử lý tại đây
 */

/**
 * BEGIN Trang shop
 */


switch ($act) {
    case 'index':
        $title .= 'Tài khoản';

        $product = new products();

        $data_products_sale = $product->getProductSaleAll();
        // print_r($data_products_sale);
        $data_products_all = $product->getProductAll();

        $st->assign('dataproductsale', $data_products_sale);
        $st->assign('dataproductall', $data_products_all);

        break;
    case 'detail':
        $title .= 'sản phẩm chi tiết';

        $product = new products();

        $id = $main->get('id');

        $product->set('id', $id);

        // $data_products_detail= $product->getProductByID($id);
        $data_products_detail = $product->getProductDetail();
        // $st->assign('dataproductdetail', $data_products_detail);
        $st->assign('data', $data_products_detail);

        break;


    case 'error':
        $title .= 'Loi';
        break;


    default:
        $main->redirect('/404');
        break;
}
