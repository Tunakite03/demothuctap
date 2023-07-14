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
        if (isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/");
            $db->close();
            exit();
        }
        break;
    case 'profile':
        if (!isset($_SESSION['user_id'])) {
            $main->redirect('/tai-khoan');
            break;
        } else {
            $users = new users();
            $infouser = new infouser();
            $order = new orders();
            $order->set('user_id', $_SESSION['user_id']);
            $users->set('user_id', $_SESSION['user_id']);
            $infouser->set('user_id', $_SESSION['user_id']);
            $data_user = $users->getUserById();
            $data_infouser = $infouser->getInfoUserById();
            $data_order = $order->getListOrderItem();
            $st->assign('data_user', $data_user);
            $st->assign('dataInfoUser', $data_infouser);
            $st->assign('dataOrderItem', $data_order);
        }
        break;
    case 'error':
        $title .= 'Loi';
        break;

    case 'logout':

        if (!isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/");
            $db->close();
            exit();
        } else {
            // unset($_COOKIE['id']);
            unset($_COOKIE['password']);
            unset($_COOKIE['username']);
            // unset($_COOKIE['gid']);

            // setcookie( 'id', '44', time() - 3600);
            setcookie('username', '44', time() - 3600, '/');
            setcookie('password', '44', time() - 3600, '/');

            unset($_SESSION['password']);
            unset($_SESSION['username']);

            session_destroy();
            $main->redirect('/tai-khoan');
        }
        break;
    default:
        $main->redirect('/404');
        break;
}
