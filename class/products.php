<?php
class products extends model
{
    protected $class_name = 'productdogs'; // sản phẩm
    protected $id;
    protected $id_cate;
    protected $name;
    protected $des;



    // lấy list sản phẩm
    public function getList_new()
    {
        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0  ORDER BY `id` DESC LIMIT 4";
        $result = $db->executeQuery($sql);

        return $result;
    }
    public function getList_trent()
    {
        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0  ORDER BY `number_sell` DESC LIMIT 4";
        $result = $db->executeQuery($sql);

        return $result;
    }


    public function getProductSaleAll()
    {

        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0 AND pr.sale > 0 ";
        $result = $db->executeQuery($sql);

        return $result;
    }
    public function getProductAll()
    {

        global $db;

        $sql = "SELECT pd.*, pr.image,pr.price,pr.sale,pr.number_sell FROM $db->tbl_fix$this->class_name pd JOIN properties pr ON pr.id_pd = pd.id WHERE pr.role_img=0";
        $result = $db->executeQuery($sql);

        return $result;
    }
    // public function getProductByID()
    // {

    //     global $db;

    //     $sql = "SELECT * FROM $db->tbl_fix$this->class_name where id =$id" ;
    //     $result = $db->executeQuery($sql);

    //     return $result;  
    // }

    public function getProductDetail()
    {
        global $db;
        $id = $this->get('id');
        $sql = "SELECT pr.*,pd.*
                        FROM $db->tbl_fix$this->class_name
                        pd  JOIN properties pr on pr.id_pd=pd.id WHERE pd.id=$id";

        $result = $db->executeQuery($sql, 1);

        return $result;
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
