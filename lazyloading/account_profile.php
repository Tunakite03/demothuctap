<?php
$nod= $main->get('nod');

if ($act == 'profile') {

    switch ($nod) {
        case 'updateprofile':
            $users = new users();
            if (!isset($_SESSION['user_id'])) {
                echo 'done##', $main->toJsonData(403, 'Chua dang nhap', null);
                break;
            } else {
                $users->set('user_id', $_SESSION['user_id']);
                $users->set('phonenumber', $main->post('phonenumber'));
                $users->set('email', $main->post('email'));
                $users->set('fullname', $main->post('fullname'));
                $users->update();

                if ($users == true) {
                    $data_user = $users->getUserById();
                    echo 'done##', $main->toJsonData(200, 'chinh sua thanh cong', null);
                } else {
                    echo 'done##', $main->toJsonData(403, 'chinh sua that bai', null);
                }
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
