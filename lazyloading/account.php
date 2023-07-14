<?php
$nod        = $main->get('nod');

if ($act == 'index') {

    switch ($nod) {
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

                $dLogin = $users->getDetailByUsername($main->post('username'));

                if (isset($dLogin['user_id'])) {
                    $_SESSION['user_id']     = $dLogin['user_id'];
                    $_SESSION['username']     = $dLogin['username'];
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

        default:
            echo 'Missing nod';
            $db->close();
            break;
    }
} else {
    echo 'Missing action';
    $db->close();
}
