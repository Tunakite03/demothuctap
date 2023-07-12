<?php
class products extends model
{
    protected $class_name = 'productdogs'; // tin tức
    protected $id;
    protected $id_cate;
    protected $name;
    protected $des;
    protected $link_url;
    protected $key;



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
    public function getPriceProductById()
    {
        global $db;
        $id = $this->get('id');
        $sql = "SELECT price
                        FROM productdogs
                       WHERE id=$id";
        $result = $db->executeQuery($sql, 1);

        return $result;
    }
    public function getProductSearch()
    {

        global $db;
        $key = $this->key;

        $sql = "SELECT pd.*, pr.image FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.product_id = pd.id WHERE pr.role_img=0 AND pd.name LIKE  '%$key%'";
        $l = $db->executeQuery($sql);

        return $l;
    }
}
