<?php
$nod        = $main->get('nod');

if ($act == 'index') {
    switch ($nod) {
        case 'updateInfoUser':
            if (!isset($_SESSION['user_id'])) {
                echo 'done##', $main->toJsonData(403, 'Vui lòng đăng nhập', null);
            } else {
                $users = new infouser();
                $users->set('fullname', $main->post('fullname'));
                $users->set('user_id', $_SESSION['user_id']);
                $users->set('phone', $main->post('phone'));
                $users->set('province', $main->post('province'));
                $users->set('district', $main->post('district'));
                $users->set('ward', $main->post('ward'));
                $users->set('street', $main->post('street'));
                $rows = $users->getInfoUserById();
                if (empty($rows) == 1) {
                    $result = $users->insertInfoUser();
                } else {
                    $result = $users->updateInfoUser();
                }
                if ($result == true) {
                    echo 'done##', $main->toJsonData(200, 'Cập nhật thông tin thành công', null);
                } else {
                    echo 'done##', $main->toJsonData(200, 'Đã xảy ra lỗi trong quá trình chỉnh sửa', null);
                }
            }
            break;
        case 'payment':

            if (!isset($_SESSION['user_id'])) {
                echo 'done##', $main->toJsonData(403, 'Vui lòng đăng nhập', null);
            } else {
                $users = new infouser();
                $cart = new cart();
                $order = new orders();
                $product = new products();
                $order_item = new orderitem();
                $cart->set('user_id', $_SESSION['user_id']);
                $rowsCartTotal = $cart->getTotalInCart();
                $rowsCartItem = $cart->getlistcart();

                $users->set('user_id', $_SESSION['user_id']);
                $rowsUser = $users->getInfoUserById();
                if (empty($rowsUser) == 1) {
                    echo 'done##', $main->toJsonData(403, 'Vui lòng cập nhật thông tin giao hàng', null);
                    return false;
                } else if (empty($rowsCartItem)) {
                    echo 'done##', $main->toJsonData(403, 'Giỏ hàng của bạn trống', null);
                    return false;
                } else {
                    $date = date("Y/m/d H:i:s");
                    $address = $rowsUser['province'] . ',' . $rowsUser['district'] . ',' . $rowsUser['ward'] . ',' . $rowsUser['street'];
                    $status = 1;
                    $total =  $rowsCartTotal['total'];
                    $fullname = $rowsUser['fullname'];
                    $phonenumber = $rowsUser['phone'];
                    $order->set('payment_method', $main->post('payment_method'));
                    $order->set('user_id', $_SESSION['user_id']);
                    $order->set('date', $date);
                    $order->set('address', $address);
                    $order->set('status', $status);
                    $order->set('total', $total);
                    $order->set('fullname', $fullname);
                    $order->set('phonenumber', $phonenumber);
                    $result = $order->insertOrder();
                    $lastOrderId = $order->getLastOrderId();

                    $arrProducts = array();

                    $arrKey = array();
                    $arrKey = ['quantity', 'number_sold'];

                    foreach ($rowsCartItem as $key => $value) {
                        $product->set('id', $value['product_id']);
                        $product_price = $product->getPriceProductById();
                        $product_quantity = $product->getQuantityProductById();
                        $product_number_sold = $product->getNumberSoldProductById();
                        if ($product_quantity < $value['quantity']) {
                            echo 'done##', $main->toJsonData(403, "Sản phẩm có mã " . $value['product_id'] . " không còn đủ số lượng", null);
                            return false;
                        }

                        array_push(
                            $arrProducts,
                            [
                                'product_id' => $value['product_id'],
                                'quantity_buy' => $value['quantity'],
                                'price' => $product_price,
                                'quantity' => $product_quantity,
                                'number_sold' => $product_number_sold
                            ]
                        );
                    }

                    foreach ($arrProducts as $key => $value) {
                        $order_item->set('order_id', $lastOrderId);
                        $order_item->set('product_id', $value['product_id']);
                        $order_item->set('quantity', $value['quantity_buy']);
                        $order_item->set('price', $value['price']);
                        $order_item->insertOrderItem();

                        $product->set('id', $value['product_id']);
                        $product->set('quantity', $value['quantity'] - $value['quantity_buy']);
                        $product->set('number_sold', $value['number_sold'] + 1);

                        $product->updateProduct($arrKey);
                    }


                    if ($result == true) {
                        $result = $cart->deleteCartByUserId();
                        echo 'done##', $main->toJsonData(200, 'Bạn đã đặt đơn hàng thành công', null);
                    } else {
                        echo 'done##', $main->toJsonData(403, 'Lỗi trong quá trình xử lý', null);
                    }
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
