<?php


switch ($act) {
    case 'index':
        $title .= 'liên hệ';

        break;
    case 'error':
        $title .= 'Loi';
        break;

    default:
        $main->redirect('/404');
        break;
}
