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
    case 'register':
        $users = new users();
        $users->set('fullname', $main->post('fullname'));
        $users->set('username', $main->post('username'));
        $users->set('password', $main->post('password'));
        $users->set('email', $main->post('email'));
        $users->set('phonenumber', $main->post('phonenumber'));

        if ($main->post('phonenumber') != '' && $users->is_exist_mobile_or_email($main->post('phonenumber'))) {
            echo 'done##', $main->toJsonData(403, 'Số điện thoại này đã được sử dụng', null);
        } else if ($main->post('email') != '' && $users->is_exist_mobile_or_email($main->post('email'))) {
            echo 'done##', $main->toJsonData(403, 'Email này đã được sử dụng', null);
        } else {
            $users->set('createdAt', time());

            $result = $users->add();
            $dLogin = $users->get_detail($main->post('username'));

            if (isset($dLogin['user_id'])) {

                $_SESSION['user_id']     = $dLogin['user_id'];
                $_SESSION['fullname']     = $dLogin['fullname'];
                $_SESSION['password']     = $dLogin['password'];

                setcookie('username', $_SESSION['username'], time() + 640000);
                setcookie('password', $_SESSION['password'], time() + 640000);

                echo 'done##', $main->toJsonData(200, 'success', null);
            } else {
                echo 'done##', $main->toJsonData(403, 'Lỗi trong quá trình đăng ký.', null);
            }
        }

        break;
    case 'login':
        $users = new users();
        $username         = $main->post('username');
        $password         = $main->post('password');

        if (isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/");
            $db->close();
            exit();
        } else if ($username == '') {
            echo 'done##', $main->toJsonData(403, 'Vui lòng nhập thông tin tài khoản', null);
        } else if ($password == '') {
            echo 'done##', $main->toJsonData(403, 'Vui lòng nhập mật khẩu', null);
        }

        $users->set('username', $username);
        $users->set('password', $password);
        $dClientLogin = $users->check_login();

        if (isset($dClientLogin['user_id']) && $dClientLogin['user_id'] != '') {
            $_SESSION['user_id']     = $dClientLogin['user_id'];
            $_SESSION['username']     = $dClientLogin['username'];
            $_SESSION['password']     = $dClientLogin['password'];

            setcookie('username', $_SESSION['username'], time() + 640000);
            setcookie('password', $_SESSION['password'], time() + 640000);
            echo 'done##', $main->toJsonData(200, 'success', null);
        } else {
            echo 'done##', $main->toJsonData(403, 'Sai tên đăng nhập hoặc mật khẩu', null);
        }
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
