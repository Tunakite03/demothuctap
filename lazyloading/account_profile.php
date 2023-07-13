<?php
$nod = $main->get('nod');

if ($act == 'profile') {

    switch ($nod) {
        case 'updateprofile':
            $users = new users();
            $fullname         = $main->post('fullname');
            $phonenumber        = $main->post('phonenumber');

            if (!isset($_SESSION['user_id'])) {
                echo 'done##', $main->toJsonData(403, 'Vui lòng đăng nhập', null);
            } else if ($fullname == '') {
                echo 'done##', $main->toJsonData(403, 'Vui lòng nhập thông tin để cập 1', null);
            } else if ($phonenumber  == '') {
                echo 'done##', $main->toJsonData(403, 'Vui lòng nhập thông tin để cập nhât', null);
            } else {


                $users->set('user_id', $_SESSION['user_id']);
                $users->set('phonenumber', $phonenumber);
                $users->set('fullname', $fullname);
                $users->updateUser();

                if ($users == true) {
                    $data_user = $users->getUserById();
                    echo 'done##', $main->toJsonData(200, 'Cập nhật thông tin thành công', null);
                } else {
                    echo 'done##', $main->toJsonData(403, 'Có lỗi xảy ra trong quá trình cập nhật', null);
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
