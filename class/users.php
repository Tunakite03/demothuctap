<?php
class users extends model
{
    private $user_id;
    private $fullname;

    private $username;

    private $password;

    private $email;

    private $phonenumber;

    private $createdAt;
    public function set($parameter, $val)
    {
        $this->$parameter = $val;
        return true;
    }
    // get value with paramater
    public function get($parameter)
    {
        return $this->$parameter;
    }
    public function setid($id)
    {
        $this->user_id = $id;
    }
    public function getid()
    {
        return $this->user_id;
    }
    // 2 set get username
    public function setusername($val)
    {
        $this->username = $val;
    }
    public function getusername()
    {
        return $this->username;
    }
    // 3 set get fullname
    public function setfullname($val)
    {
        $this->fullname = $val;
    }
    public function getfullname()
    {
        return $this->fullname;
    }
    // 4 set get password
    public function setpassword($pass)
    {
        $this->password = $pass;
    }

    public function getpassword()
    {
        return $this->password;
    }
    //  5 salt

    // 	6 set get mobile
    public function setphonenumber($val)
    {
        $this->phonenumber = $val;
    }
    public function getphonenumber()
    {
        return $this->phonenumber;
    }
    // 	7 set get phone

    // 	8 set get address

    // 	9 set get email
    public function setemail($email)
    {
        $this->email = $email;
    }
    public function getemail()
    {
        return $this->email;
    }

    public function is_exist_mobile_or_email($info)
    {
        global $db;
        $sql = "SELECT `user_id` FROM `users` WHERE `phonenumber` = '$info' OR `email` = '$info' LIMIT 1 ";
        $result = $db->executeQuery($sql, 1);
        return isset($result['user_id']);
    }

    public function get_by_email()
    {
        global $db, $main;

        ($this->get('user_id') != '') ? $except_id = " AND `user_id` <> '" . $this->get('user_id') . "'" : $except_id = "";

        $email = $this->get('email');

        $email = str_replace(' ', '_', $email);
        $email = str_replace('#', '_', $email);
        $email = str_replace('/', '_', $email);
        $email = str_replace('\\', '_', $email);

        $rows = array();
        if (($email != '' && preg_match('/^[ \w]+$/',  $email) || $main->isEmail($email))) {

            $sql = "SELECT `user_id`, `fullname` ,`password`, `salt`, `activate`  FROM " . $db->tbl_fix . 'users' . " WHERE 
					(`email`='$email' AND `email` <> '' ) $except_id LIMIT 1";

            $rows = $db->executeQuery($sql, 1);
        }

        return $rows;
    }

    public function getInfoUserById()
    {
        global $db;
        $user_id = $this->get('user_id');
        $sql = "SELECT *
        FROM $db->tbl_fix`info_user`
        WHERE  user_id =  $user_id
         limit 0,1";

        $rows = $db->executeQuery($sql, 1);

        return $rows;
    }

    public function get_by_mobile()
    {
        global $db, $main;

        ($this->get('user_id') != '') ? $except_id = " AND `user_id` <> '" . $this->get('user_id') . "'" : $except_id = "";

        $mobile = $this->get('mobile');

        $mobile = str_replace(' ', '_', $mobile);
        $mobile = str_replace('#', '_', $mobile);
        $mobile = str_replace('/', '_', $mobile);
        $mobile = str_replace('\\', '_', $mobile);

        $rows = array();

        $sql = "SELECT *  FROM " . $db->tbl_fix . 'users' . " WHERE 
                (`mobile`='$mobile' AND `mobile` <> '' )  $except_id LIMIT 1";
        $rows = $db->executeQuery($sql, 1);

        return $rows;
    }

    public function get_by_email_or_mobile()
    {
        global $db, $main;

        ($this->get('user_id') != '') ? $except_id = " AND `user_id` <> '" . $this->get('user_id') . "'" : $except_id = "";

        $email = $this->get('email');
        $mobile = $this->get('mobile');

        $email = str_replace(' ', '_', $email);
        $email = str_replace('#', '_', $email);
        $email = str_replace('/', '_', $email);
        $email = str_replace('\\', '_', $email);

        $mobile = str_replace(' ', '_', $mobile);
        $mobile = str_replace('#', '_', $mobile);
        $mobile = str_replace('/', '_', $mobile);
        $mobile = str_replace('\\', '_', $mobile);

        $rows = array();
        if (($email != '' && preg_match('/^[ \w]+$/',  $email) || $main->isEmail($email))) {

            $sql = "SELECT `user_id`, `email`, `mobile`, `fullname` ,`password`, `salt`, `activate`  FROM " . $db->tbl_fix . 'users' . " WHERE 
					((`email`='$email' AND `email` <> '' ) OR (`mobile`='$mobile' AND `mobile` <> '' )) $except_id LIMIT 1";

            $rows = $db->executeQuery($sql, 1);
        }

        return $rows;
    }

    public function check_login()
    {
        global $db, $database;

        $username = $this->getusername();

        $rows = array();
        $username = str_replace(' ', '_', $username);
        $username = str_replace('#', '_', $username);
        $username = str_replace('/', '_', $username);
        $username = str_replace('\\', '_', $username);

        // if( preg_match('/^[ \b]+$/',  $username ) ){

        $sql = "SELECT *
					FROM $db->tbl_fix`users`
					WHERE `username` = '$username' 
					AND `password` = '" . md5($this->getpassword()) . "' 
					 limit 0,1";
        $rows = $db->executeQuery($sql, 1);
        // }
        return $rows;
    }

    // public function get_detail($username)
    // {
    //     global $db;
    //     $sql = "SELECT * FROM " . $db->tbl_fix . "`users` WHERE `username`='" . str_replace("'", "\'", $username) . "'";
    //     $rows = $db->executeQuery($sql, 1);
    //     return $rows;
    // }

    public function get_fullname($username)
    {
        global $db;
        $sql = "SELECT fullname FROM " . $db->tbl_fix . "`user` WHERE `username`='" . str_replace("'", "\'", $username) . "'";
        $rows = $db->executeQuery($sql, 1);
        return $rows['fullname'];
    }

    public function get_fullname_by_id($id)
    {
        global $db;
        $sql = "SELECT `fullname` FROM " . $db->tbl_fix . "`user` WHERE `id` = '$id' ";
        $rows = $db->executeQuery($sql, 1);
        return isset($rows['fullname']) ? $rows['fullname'] : '';
    }

    public function detailbyuser()
    {
        global $db;
        $sql = "SELECT * FROM " . $db->tbl_fix . "user WHERE `username`='" . str_replace("'", "\'", $this->getusername()) . "'";
        $rows = $db->executeQuery($sql, 2);
        return $rows;
    }

    public function updatePass()
    {
        global $db;
        $arr["password"] = $this->getpassword();
        $db->record_update($db->tbl_fix . "user", $arr, " `username`='" . str_replace("'", "\'", $this->getusername()) . "'");
    }

    public function update_password()
    {
        global $db;
        $id                 = $this->getid();
        $password = $this->getpassword();
        $pass = md5($password);
        $arr['password'] = $pass;
        $db->record_update($db->tbl_fix . "`user`", $arr, "	`id` = '$id' ");
    }


    // public function delete($username)
    // {
    //     global $db;
    //     $db->record_delete($db->tbl_fix . "user", " `username`='" . str_replace("'", "\'", $username) . "' ");
    //     return true;
    // }

    public function add()
    {
        global $db;

        $arr['username'] = $this->getusername();
        $arr['fullname'] = $this->getfullname();
        $password = $this->getpassword();
        $pass = md5($password);
        $arr['password'] = $pass;
        $arr['phonenumber'] = $this->getphonenumber();
        $arr['email'] = $this->getemail();
        $arr['createdAt'] = time();

        $db->record_insert($db->tbl_fix . '`users`', $arr);

        return true;
    }

    public function updateUser()
    {
        global $db;
        $id = $this->user_id;
        $arr['fullname'] = $this->fullname;
        $arr['phonenumber'] = $this->phonenumber;
        $db->record_update($db->tbl_fix . '`users`', $arr, " `user_id` = '$id' ");

        return true;
    }
    private function create_default_password()
    {
        $password = '123456Abcd';
        $pass = md5($password);
        $return['password'] = $pass;
        return $return;
    }
    public function reset_password($username)
    {
        global $db;
        $duser = $this->get_detail($username);
        if ($duser['username'] != '') {

            $dpass = $this->create_default_password();

            $arr['password'] = $dpass['password'];
            $arr['salt'] = $dpass['salt'];

            $db->record_update($db->tbl_fix . '`user`', $arr, " username='" . $username . "'");
        } else {
            echo "Không tìm thấy tên khách hàng trong hệ thống.";
            $db->close();
            exit();
        }
        return true;
    }
    public function getUserById()
    {
        global $db;
        $sql = "SELECT * FROM `users` WHERE user_id=$this->user_id";
        $rows = $db->executeQuery($sql, 1);
        return $rows;
    }
}

/**
 * GHI CHÚ CHO TRƯỜNG HỢP KÍCH HOẠT HAY KHÔNG KÍCH HOẠT ĐẠI LÝ CỦA MỘT USER = KHÁCH HÀNG CỦA YOBE
 * 1. Nếu trường thời gian kích hoạt là license còn => nghĩa user này đang kích hoạt toàn bộ sản phẩm
 * 2. Còn ngược lại thì kiểm tra ở một bản cài đặt sản phẩm được hưởng free và cộng với sản phẩm kích hoạt chỉ 1 sản phẩm
 */
