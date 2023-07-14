<?php
class orderitem extends model
{
    protected $class_name = "order_item";
    protected $id;
    protected $order_id;
    protected $product_id;
    protected $price;
    protected $quantity;

    // lấy list sản phẩm
    function insertOrderItem()
    {
        global $db;
        $arr['order_id'] = $this->order_id;
        $arr['product_id'] = $this->product_id;
        $arr['price'] = $this->price;
        $arr['quantity'] = $this->quantity;
      
        $db->record_insert($db->tbl_fix . $this->class_name, $arr);

        return true;
    }
}
