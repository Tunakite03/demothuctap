<?php
class cart extends model
{
    protected $class_name = 'cart'; // sản phẩm
    protected $id;

    protected $user_id;
    protected $product_id;
    protected $quantity;

    protected $price;
    protected $total;

    // lấy list sản phẩm

    public function addtocart()
    {
        global $db;

        $arr['user_id'] = $this->user_id;
        $arr['product_id'] = $this->product_id;
        $arr['quantity'] = $this->quantity;
        $arr['price'] = $this->price;
        $total =  $this->quantity * $this->price;
        $arr['total'] = $total;
        $db->record_insert($db->tbl_fix . '`cart`', $arr);
        return true;
    }

    public function getlistcart()
    {
        global $db;
        $user_id = $this->user_id;
        $sql = "SELECT ca.*, pro.name  FROM $db->tbl_fix$this->class_name ca LEFT JOIN productdogs pro on pro.id = ca.product_id  WHERE user_id = $user_id ORDER BY `id` DESC ";

        $result = $db->executeQuery($sql);

        return $result;
    }
}
