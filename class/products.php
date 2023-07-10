<?php
class products extends model
{
    protected $class_name = 'productdogs'; // tin tức
    protected $id;
    protected $id_cate;
    protected $name;
    protected $des;
    protected $link_url;


    // lấy list sản phẩm
    public function getList_new()
    {
        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0  ORDER BY `id` DESC LIMIT 4";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getList_trent()
    {
        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0  ORDER BY `number_sell` DESC LIMIT 4";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getProductSaleAll()
    {

        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0 AND pr.sale > 0 ";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getProductAll()
    {

        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getProducById()
    {
        global $db;
        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0 AND pd.id=$this->id";
        $l = $db->executeQuery($sql, 1);

        return $l;
    }
    public function getPriceProductById()
    {
        global $db;
        $id = $this->get('id');
        $sql = "SELECT price
                        FROM properties
                       WHERE id_pd=$id";
        $result = $db->executeQuery($sql, 1);

        return $result;
    }
}
