<?php
class like_product extends model
{
    protected $class_name = 'like_product';
    private $id;
    private $user_id;
    private $product_id;


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

    function getLikeById()
    {
        global $db;
        $id = $this->id;
        $sql = "SELECT *
        FROM $db->tbl_fix$this->class_name
        WHERE `id` = '$id' 
         limit 0,1";
        $rows = $db->executeQuery($sql, 1);
        return $rows;
    }
    public function deleteItemInLikeProduct()
    {
        global $db;
        $likepd_id = $this->id;
        $db->record_delete($db->tbl_fix . $this->class_name, 'id =' . $likepd_id);

        return true;
    }




    public function getLikeProduct()
    {
        global $db;
        $user_id = $this->get('user_id');
        $product_id = $this->get('product_id');
        $sql = "SELECT *
            FROM $db->tbl_fix`like_product`
            WHERE  user_id =  $user_id
            and    product_id=$product_id
            limit 0,1";
        $rows = $db->executeQuery($sql, 2);
        return $rows;
    }

    public function insertLikeProduct()
    {
        global $db;

        $arr['product_id'] = $this->product_id;
        $arr['user_id'] = $this->user_id;

        $db->record_insert($db->tbl_fix . 'like_product', $arr);

        // $rows = $db->executeQuery($sql, 1);

        return true;
    }
    // public function getlistcart()
    // {
    //     global $db;
    //     $user_id = $this->user_id;
    //     $sql = "SELECT ca.*, pd.name, pd.des, pd.price, pd.sale,pd.link_url, pp.image, pp.product_id  FROM $db->tbl_fix$this->class_name ca 
    //     LEFT JOIN productdogs pd on pd.id = ca.product_id 
    //     LEFT JOIN properties pp on pd.id = pp.product_id 
    //      WHERE user_id = $user_id and pp.role_img =0 ORDER BY `id` DESC ";
    //     $result = $db->executeQuery($sql);

    //     return $result;
    // }
    public function getListLikeItems()
    {
        global $db;
        // $product_id = $this->get('product_id');
        $user_id = $this->get('user_id');

        $sql = "SELECT    li.id,
        li.product_id,
      
        p.name AS product_name,
        p.price,
        pr.image as image
        FROM $db->tbl_fix$this->class_name li
        INNER JOIN productdogs p ON p.id= li.product_id
        INNER JOIN properties pr on pr.product_id=li.product_id
        WHERE  pr.role_img=0 and li.user_id=$user_id
        ";

        $rows = $db->executeQuery($sql, 4);

        return $rows;
    }
    public function checkProductInLike()
    {

        global $db;
        $product_id = $this->get('product_id');
        $user_id = $this->get('user_id');
        $sql = "SELECT * FROM like_product   WHERE user_id=$user_id and product_id= $product_id";
        $rows = $db->executeQuery($sql, 1);
        return $rows;
    }
    // public function updateInfoUser()
    // {
    //     global $db;
    //     $user_id = $this->user_id;
    //     $arr['fullname'] = $this->fullname;
    //     $arr['phone'] = $this->phone;
    //     $arr['province'] = $this->province;
    //     $arr['district'] = $this->district;
    //     $arr['ward'] = $this->ward;
    //     $arr['street'] = $this->street;

    //     $db->record_update($db->tbl_fix . 'info_user', $arr, 'user_id=' . $user_id);
    //     // $rows = $db->executeQuery($sql, 1);

    //     return true;
    // }
}
