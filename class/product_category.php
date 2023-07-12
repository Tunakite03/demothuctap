<?php
class product_category extends model
{
    protected $class_name = 'product_category'; // tin tức
    protected $id;
    protected $category;
    protected $root_id;
    protected $level;




    // lấy list sản phẩm
    public function getListCateRoot()
    {
        global $db;

        $sql = "SELECT * FROM $db->tbl_fix$this->class_name WHERE `root_id` IS NULL ";
        $l = $db->executeQuery($sql);

        return $l;
    }
    public function getListCateNotRoot()
    {
        global $db;

        $sql = "SELECT * FROM $db->tbl_fix$this->class_name WHERE `root_id` IS NOT NULL ";
        $l = $db->executeQuery($sql);

        return $l;
    }

}
