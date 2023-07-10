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
        $db->record_insert($db->tbl_fix . '`cart`', $arr);
        return true;
    }
    public function updateQuantity()
    {
        global $db;
        $cart_id = $this->id;
        $quantity = $this->quantity;
        $arr['quantity'] = $this->quantity;
        $db->record_update($db->tbl_fix . '`cart`', $arr, 'id =' . $cart_id);
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
    public function check_product()
    {
        global $db;
        $product_id = $this->product_id;
        $user_id = $this->user_id;
        $sql = "SELECT *
        FROM $db->tbl_fix$this->class_name
        WHERE `user_id` = '$user_id' 
        AND `product_id` = '$product_id' 
         limit 0,1";
        $rows = $db->executeQuery($sql, 1);
        return $rows;
    }
}
