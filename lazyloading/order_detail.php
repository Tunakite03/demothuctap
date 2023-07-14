<?php
$nod        = $main->get('nod');

if ($act == 'index') {
    switch ($nod) {
        case 'cancle-order':
            if (!isset($_SESSION['user_id'])) {
                echo 'done##', $main->toJsonData(403, 'Vui lòng đăng nhập', null);
            } else {
                $order = new orders();
                $product = new products();
                $product->set('id', $main->post('product_id'));
                $order->set('id', $main->post("order_id"));
                $order->set('user_id', $_SESSION['user_id']);

                $rows = $order->getOrderItembById();

                // Kiểm tra có tồn tại đơn hàng hay không
                if (!isset($rows['id'])) {
                    echo 'done##', $main->toJsonData(403, 'Không tìm thấy đơn hàng này', null);
                    return;
                }
                // Kiểm tra xem status có phải là đang xử lý hay không
                if ($rows['status'] != 1) {
                    echo 'done##', $main->toJsonData(403, 'Bạn không thể hủy đơn hàng này vì đã qua quá trình xử lý', null);
                    return;
                }
                $result = $order->cancleOrder();
                if ($result == true) {
                    $quanity_stock = $product->getQuantityProductById();
                    $product->set('quantity', $quanity_stock + $rows['quantity']);
                    $arrKey = array('quantity');
                    $product->updateProduct($arrKey);

                    echo 'done##', $main->toJsonData(200, 'Bạn đã hủy đơn hàng thành công', null);
                } else {
                    echo 'done##', $main->toJsonData(200, 'Đã xảy ra lỗi trong quá trình hủy đơn hàng', null);
                }
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
