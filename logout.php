<?php
error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);

include 'include/global.php';
include 'include/session.php';

// $page = $main->get('page');

// unset($_COOKIE['id']);
unset($_COOKIE['password']);
unset($_COOKIE['fullname']);
unset($_COOKIE['username']);
// unset($_COOKIE['gid']);

// setcookie( 'id', '44', time() - 3600);
setcookie('fullname', '44', time() - 3600, '/');
setcookie('username', '44', time() - 3600, '/');
setcookie('password', '44', time() - 3600, '/');

unset($_SESSION['password']);
unset($_SESSION['fullname']);
unset($_SESSION['username']);

session_destroy();
$main->redirect('/tai-khoan');

// if (isset($page) && $page == 'admin') {

//     unset($_COOKIE['id']);
//     unset($_COOKIE['fullname']);
//     unset($_COOKIE['pass']);
//     unset($_COOKIE['username']);
//     unset($_COOKIE['gid']);

//     setcookie('id', '44', time() - 3600, '/');
//     setcookie('pass', '44', time() - 3600, '/');
//     setcookie('fullname', '44', time() - 3600, '/');
//     setcookie('username', '44', time() - 3600, '/');

//     unset($_SESSION['id']);
//     unset($_SESSION['pass']);
//     unset($_SESSION['fullname']);
//     unset($_SESSION['username']);
//     unset($_SESSION['gid']);

//     session_destroy();
//     $main->redirect('/admin');
// } elseif (isset($page) && $page == 'client') {
//     // unset($_COOKIE['id']);
//     unset($_COOKIE['password']);
//     unset($_COOKIE['fullname']);
//     unset($_COOKIE['username']);
//     // unset($_COOKIE['gid']);

//     // setcookie( 'id', '44', time() - 3600);
//     setcookie('fullname', '44', time() - 3600, '/');
//     setcookie('username', '44', time() - 3600, '/');
//     setcookie('password', '44', time() - 3600, '/');

//     unset($_SESSION['password']);
//     unset($_SESSION['fullname']);
//     unset($_SESSION['username']);

//     session_destroy();
//     $main->redirect('/dang-nhap');
// } else {
//     $main->redirect('/');
// }
