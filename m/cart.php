<?php

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
            $dataTotalCart = $cart->getTotalInCart();
            $st->assign('data', $dataCart);
            $st->assign('datatotal', $dataTotalCart);
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
        $rows = $cart->getCartById();
        if (isset($rows['id'])) {
            $cart->set('quantity', $rows['quantity'] + $main->post('quantity'));
            $result = $cart->updateQuantity();
            if ($result == true) {
                $cart->set('user_id', $_SESSION['user_id']);
                $dataCart = $cart->getlistcart();

                echo 'done##', $main->toJsonData(200, 'Chỉnh sửa thành công', array('product' => $dataCart, 'domain' => $domain));
            }
        } else {
            echo 'done##', $main->toJsonData(403, 'Đơn hàng này hiện không có', null);
        }
        break;
    case 'deletecart':
        $cart = new cart();
        $cart->set('id', $main->post('id'));
        $rows = $cart->getCartById();
        if (isset($rows['id'])) {
            $result = $cart->deleteItemInCart();
            if ($result == true) {
                $cart->set('user_id', $_SESSION['user_id']);
                $dataCart = $cart->getlistcart();

                echo 'done##', $main->toJsonData(200, 'Xóa sản phẩm thành công', array('product' => $dataCart, 'domain' => $domain));
            }
        } else {
            echo 'done##', $main->toJsonData(403, 'Đơn hàng này hiện không có', null);
        }
        break;


    default:
        $main->redirect('/404');
        break;
}
