<?php
class products extends model
{
    protected $class_name = 'productdogs'; // tin tức
    protected $id;
    protected $cate_id;
    protected $name;
    protected $des;
    protected $link_url;
    protected $key;
    protected $is_publish;
    protected $sale;
    protected $price;
    protected $quantity;
    protected $number_sold;






    // lấy list sản phẩm
    public function getList_new()
    {
        global $db;
        $sql = "SELECT pd.*, pr.image FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.product_id = pd.id WHERE pr.role_img=0  ORDER BY `id` DESC LIMIT 4";
        $l = $db->executeQuery($sql, 4);

        return $l;
    }
    public function getList_trent()
    {
        global $db;

        $sql = "SELECT pd.*, pr.image FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.product_id = pd.id WHERE pr.role_img=0  ORDER BY `number_sold` DESC LIMIT 4";
        $l = $db->executeQuery($sql, 4);

        return $l;
    }
    public function getProductSaleAll()
    {
        global $db;
        $sql = "SELECT pd.*, pr.image FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.product_id = pd.id WHERE pr.role_img=0 AND pd.sale != 1 ";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getProductAll()
    {
        global $db;

        $sql = "SELECT pd.*, pr.image FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.product_id = pd.id WHERE pr.role_img=0";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getProducById()
    {
        global $db;
        $sql = "SELECT pd.*, pr.image FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.product_id = pd.id WHERE pr.role_img=0 AND pd.id=$this->id";
        $l = $db->executeQuery($sql, 1);

        return $l;
    }
    public function getInfoProductById()
    {
        global $db;
        $sql = "SELECT * FROM $db->tbl_fix$this->class_name  WHERE id=$this->id";
        $l = $db->executeQuery($sql, 1);
        return $l;
    }

    public function getPriceProductById()
    {
        global $db;
        $id = $this->get('id');
        $sql = "SELECT ROUND((price*sale),2) as price
                        FROM productdogs
                       WHERE id=$id";
        $result = $db->executeQuery($sql, 1);

        return $result['price'];
    }
    public function getQuantityProductById()
    {
        global $db;
        $id = $this->get('id');
        $sql = "SELECT quantity
                        FROM productdogs
                       WHERE id=$id";
        $result = $db->executeQuery($sql, 1);

        return $result['quantity'];
    }
    public function getNumberSoldProductById()
    {
        global $db;
        $id = $this->get('id');
        $sql = "SELECT number_sold
                        FROM productdogs
                       WHERE id=$id";
        $result = $db->executeQuery($sql, 1);

        return $result['number_sold'];
    }

    public function getProductSearch()
    {

        global $db;
        $key = $this->key;

        $sql = "SELECT pd.*, pr.image FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.product_id = pd.id WHERE pr.role_img=0 AND pd.name LIKE  '%$key%'";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getProductFilter($sort)
    {

        global $db;
        $orderby = "";
        $set = "";
        $cate_id = $this->get('cate_id');

        if ($cate_id != null) {
            $set = " AND c.id = $cate_id OR c.root_id = $cate_id";
        }


        if ($sort == 'DESC') {
            $orderby =  " ORDER BY p.price DESC";
        } elseif ($sort == 'ASC') {
            $orderby =  " ORDER BY p.price ASC";
        }

        $sql = "SELECT *,pr.image,pr.role_img
        FROM $db->tbl_fix$this->class_name p
        JOIN product_category c ON p.cate_id = c.id
        JOIN properties pr ON p.id = pr.product_id
        WHERE pr.role_img=0 $set $orderby";

        $l = $db->executeQuery_list($sql);

        return $l;
    }
    public function updateProduct($arrKey)
    {
        global $db;
        $id = $this->id;
        foreach ($arrKey as $key => $value) {
            $arr[$value] = $this->$value;
        }

        $db->record_update($db->tbl_fix . $this->class_name, $arr, 'id =' . $id);

        return true;
    }
}
