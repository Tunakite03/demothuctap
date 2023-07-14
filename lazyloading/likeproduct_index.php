<?php
$nod        = $main->get('nod');

if ($act == 'index') {
    switch ($nod) {
        case 'addtolike':

            if (!isset($_SESSION['user_id'])) {
                $main->redirect($domain . "/tai-khoan");
                $db->close();
                exit();
            } else {
                $like_product = new like_product();
                $product = new products();

                $like_product->set('product_id', $main->post('product_id'));
                // echo
                $like_product->set('user_id', $_SESSION['user_id']);
                // $cart->set('quantity', $main->post('quantity'));
                $dataLike = $like_product->getListLikeItems();

                $count = $like_product->checkProductInLike();
                $st->assign('ListLikeProduct', $dataLike);
                $st->assign('CountLikeProduct', $dataCountLike);

                if ($count > 0) {

                    echo 'done##', $main->toJsonData(403, 'Bạn đã yêu thích sản phẩm này rồi', null);
                } else {

                    $result = $like_product->insertLikeProduct();
                    //    $dataCountLike = $like_product->getCountProductsInLike();

                    echo 'done##', $main->toJsonData(200, 'Bạn đã yêu thích sản phẩm thành công', null);
                }
            }
            break;

        case 'deletelike':
            $like_product = new like_product();
            $like_product->set('id', $main->post('id'));
            $rows = $like_product->getLikeById();
            if (isset($rows['id'])) {
                $result = $like_product->deleteItemInLikeProduct();
                // print_r($result);
                if ($result == true) {
                    $like_product->set('user_id', $_SESSION['user_id']);
                    $dataLikeproduct = $like_product->getListLikeItems();
                    echo 'done##', $main->toJsonData(200, 'Xóa sản phẩm thành công', array('product' => $dataLikeproduct, 'domain' => $domain));
                }
            } else {
                echo 'done##', $main->toJsonData(403, 'Ban chưa chọn sản phẩm yêu thích cho mình !!!', null);
            }
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
