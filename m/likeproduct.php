<?php

switch ($act) {
    case 'index':
        if (!isset($_SESSION['user_id'])) {
            $main->redirect($domain . "/tai-khoan");
            $db->close();
            exit();
        } else {
            $title .= 'yêu thích';
            $like_product = new like_product();           
                $like_product->set('user_id', $_SESSION['user_id']);
                $dataLike = $like_product->getListLikeItems();
               
                $CountLikeProduct = count($dataLike);


                $st->assign('ListLikeProduct', $dataLike);
                $st->assign('CountLikeProduct', $CountLikeProduct);

            // }
        }
        break;
    case 'addtolike':
        $like_product = new like_product();
        $product = new products();

        $cart->set('product_id', $main->post('product_id'));
        $cart->set('user_id', $_SESSION['user_id']);
        // $cart->set('quantity', $main->post('quantity'));
        $dataLike = $like_product->getListLikeItems();
        $st->assign('ListLikeProduct', $dataLike);

        if ($dataLike->rowCount() > 0) {
            echo 'done##', $main->toJsonData(403, 'Bạn đã yêu thích sản phẩm này rồi', null);
        } else {
            $like_product->insertLikeProduct();
        }
        break;
    case 'error':
        $title .= 'Loi';
        break;
    default:
        $main->redirect('/404');
        break;
}
