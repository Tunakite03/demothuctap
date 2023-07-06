<?php

/**
 * m/shop.php dành cho các thông tin chưa login tất cả được điều hướng và xử lý tại đây
 */

/**
 * BEGIN Trang shop
 */

if ($act == 'index') {
	$title .= 'Trang chủ';
	$manager_image = new manager_image();

	$manager_image->set('type', 'slide');
	$manager_image->set('is_hidden', '0');
	$st->assign('lSlide', $manager_image->filter(''));
} elseif ($act == 'error') {
	$title .= 'Lỗi';
	/**
	 * END trang lỗi và thông báo lỗi
	 */
} else {
	$main->redirect($domain); //Nếu không xác định được trang cần tìm có thể redirect ra trang home hoặc show trang not found
}
