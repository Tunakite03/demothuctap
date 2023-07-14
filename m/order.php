<?php

switch ($act) {
    case 'index':
        if (!isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/tai-khoan");
            $db->close();
            exit();
        } else {
            $title .= 'Thanh toán';
            $cart = new cart();
            $user = new users();
            $cart->set('user_id', $_SESSION['user_id']);
            $user->setid($_SESSION['user_id']);
            $dataCart = $cart->getlistcart();
            $dataTotalCart = $cart->getTotalInCart();
            $datauser = $user->getInfoUserById();
            $st->assign('infoCart', $dataCart);
            $st->assign('datatotal', $dataTotalCart);
            $st->assign('dataInfoUser', $datauser);
        }
        break;
    case 'confirm':
        if (!isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/tai-khoan");
            $db->close();
            exit();
        } else {
            $title .= 'Xác nhận thanh toán thành công';
        }
        break;
    case 'detail':
        if (!isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/tai-khoan");
            $db->close();
            exit();
        } else {
            $title .= 'Chi tiết đơn hàng';
            $infouser = new infouser();
            $order = new orders();
            $order->set('id', $main->get('id'));
            $order->set('user_id', $_SESSION['user_id']);
            $infouser->set('user_id', $_SESSION['user_id']);
            $data_infouser = $infouser->getInfoUserById();
            $data_order = $order->getOrderItembById();
            if (empty($data_order) || empty($infouser)) {
                $main->redirect($domain . "/thong-tin-ca-nhan");
                $db->close();
                exit();
            }
            $st->assign('dataInfoUser', $data_infouser);
            $st->assign('dataOrderItem', $data_order);
        }
        break;
    case 'error':
        $title .= 'Loi';
        break;
    default:
        $main->redirect('/404');
        break;
}
