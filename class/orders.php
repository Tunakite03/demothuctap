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

    function getListOrderItem()
    {

        global $db;
        $user_id = $this->user_id;

        $sql = "SELECT od.*, odi.quantity, odi.price, pp.image, pr.name, pr.link_url  FROM orders od
        JOIN order_item odi on od.id = odi.order_id 
        JOIN productdogs pr on pr.id = odi.product_id 
        LEFT JOIN properties pp on pr.id = pp.product_id 
        WHERE user_id = $user_id and pp.role_img =0  ORDER BY `id` DESC";
        $result = $db->executeQuery($sql, 4);
        return $result;
    }
}
