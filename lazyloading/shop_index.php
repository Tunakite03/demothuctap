<?php
$nod = $main->get('nod');

if ($act == 'index') {
    switch ($nod) {
        case 'filter':
            $product = new products();

            $cate_id = $main->post('cate_id');
            $sort = $main->post('sort');
            
            $product->set('cate_id', $cate_id);

            $data_products_all = $product->getProductFilter($sort);

            echo 'done##', $main->toJsonData(200, 'set cate success', array('products' => $data_products_all, 'domain' => $domain));
            break;

        default:
            echo 'Missing nod';
            $db->close();
            break;
    }
} else {
    echo 'Missing action';
    $db->close();
}
