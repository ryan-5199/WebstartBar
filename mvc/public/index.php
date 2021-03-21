<?php

ini_set('display_errors', 'On');
error_reporting(E_ALL);

define('ROOT', dirname(__DIR__));
define('WEBSITE_URL', 'http://bar.webstart.local/');

Require_once ROOT.'/App/Autoloader.php';

Core\Autoloader::register();


$page = 'home';
$action = 'show';

if(isset($_GET['page'])){
    $page = $_GET['page'];
}

if(isset($_GET['action'])){
    $action = $_GET['action'];
}

$nameController = 'App\Controller\\'.ucfirst($page).'Controller';

if(!class_exists($nameController) || !method_exists($nameController, $action)){
    header('Location: '.WEBSITE_URL);
}

$controller = new $nameController;

$controller->$action();