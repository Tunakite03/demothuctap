<?php
class infouser extends model
{
    private $id;
    private $user_id;
    private $fullname;

    private $phone;

    private $province;

    private $district;

    private $ward;

    private $street;
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

    public function insertInfoUser()
    {
        global $db;
        $arr['fullname'] = $this->fullname;
        $arr['phone'] = $this->phone;
        $arr['province'] = $this->province;
        $arr['district'] = $this->district;
        $arr['ward'] = $this->ward;
        $arr['street'] = $this->street;
        $arr['user_id'] = $this->user_id;

        $db->record_insert($db->tbl_fix . 'info_user', $arr);
        // $rows = $db->executeQuery($sql, 1);

        return true;
    }
    public function updateInfoUser()
    {
        global $db;
        $user_id = $this->user_id;
        $arr['fullname'] = $this->fullname;
        $arr['phone'] = $this->phone;
        $arr['province'] = $this->province;
        $arr['district'] = $this->district;
        $arr['ward'] = $this->ward;
        $arr['street'] = $this->street;

        $db->record_update($db->tbl_fix . 'info_user', $arr, 'user_id=' . $user_id);
        // $rows = $db->executeQuery($sql, 1);

        return true;
    }
}
