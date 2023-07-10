<?php

/**
 * m/shop.php dành cho các thông tin chưa login tất cả được điều hướng và xử lý tại đây
 */

/**
 * BEGIN Trang shop
 */


switch ($act) {
    case 'index':
        if (!isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/tai-khoan");
            $db->close();
            exit();
        } else {
            $title .= 'Giỏ hàng';
            $cart = new cart();
            $cart->set('user_id', $_SESSION['user_id']);
            $dataCart = $cart->getlistcart();

            $st->assign('data', $dataCart);
        }
        break;
    case 'error':
        $title .= 'Loi';
        break;
    case 'addtocart':
        $cart = new cart();
        $product = new products();
        $cart->set('product_id', $main->post('product_id'));
        $cart->set('user_id', $_SESSION['user_id']);
        $cart->set('quantity', $main->post('quantity'));

        $rows = $cart->check_product();

        if ($main->post('quantity') < 1) {
            echo 'done##', $main->toJsonData(403, 'Số lượng sản phẩm không được nhỏ hơn 1', null);
        } elseif (!isset($_SESSION['user_id']) || $_SESSION['user_id'] == "") {
            echo 'done##', $main->toJsonData(403, 'Vui lòng đăng nhập', null);
        } else {
            if (isset($rows['id'])) {
                $cart->set('id', $rows['id']);
                $cart->set('quantity', $rows['quantity'] + $main->post('quantity'));
                $result =   $cart->updateQuantity();
            } else {
                $product->set('id', $main->post('product_id'));
                $price = $product->getPriceProductById();
                $cart->set('price', $price['price']);
                $result = $cart->addtocart();
            }
            if ($result == true) {
                echo 'done##', $main->toJsonData(200, 'Thêm vào giỏ hàng thành công', null);
            } else {
                echo 'done##', $main->toJsonData(403, 'Lỗi trong quá trình đăng ký.', null);
            }
        }
        break;
    case 'updatequantity':
        $cart = new cart();
        $cart->set('id', $main->post('id'));
        $cart->set('quantity', $main->post('quantity'));
        break;


    default:
        $main->redirect('/404');
        break;
}
