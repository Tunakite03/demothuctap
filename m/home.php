<?php

/**
 * m/shop.php dành cho các thông tin chưa login tất cả được điều hướng và xử lý tại đây
 */

/**
 * BEGIN Trang shop
 */

if ($act == 'index') {
	$title .= 'Trang chủ';
	$page = $main->get('page');
	print_r($page);
	// print_r($_SESSION);
} elseif ($act == 'error') {
	$title .= 'Lỗi';
	/**
	 * END trang lỗi và thông báo lỗi
	 */
} else {
	$main->redirect('/404'); //Nếu không xác định được trang cần tìm có thể redirect ra trang home hoặc show trang not found
}
