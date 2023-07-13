<?php
class orders extends model
{

    protected $id;
    protected $user_id;
    protected $fullname;
    protected $phonenumber;
    protected $total;
    protected $address;
    protected $date;
    protected $status;
    protected $cancled;
    protected $payment_method;

    // lấy list sản phẩm


    function getLastOrderId()
    {
        global $db;
        $sql = " SELECT LAST_INSERT_ID() as order_id";
        $result = $db->executeQuery($sql, 1);
        return $result['order_id'];
    }
    public function insertOrder()
    {
        global $db;
        $arr['user_id'] = $this->user_id;
        $arr['total'] = $this->total;
        $arr['address'] = $this->address;
        $arr['date'] = $this->date;
        $arr['status'] = $this->status;
        $arr['fullname'] = $this->fullname;
        $arr['phonenumber'] = $this->phonenumber;
        $arr['payment_method'] = $this->payment_method;
        $db->record_insert($db->tbl_fix . 'orders', $arr);

        return true;
    }
}
