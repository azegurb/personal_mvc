<?php
session_start();
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('VIEWS_PATH', ROOT.DS.'views');

define('WATERMARK_OVERLAY_IMAGE', 'watermark.png');
define('WATERMARK_OVERLAY_OPACITY', 50);
define('WATERMARK_OUTPUT_QUALITY', 90);

$url=$_SERVER['REQUEST_URI'];


require_once(ROOT.DS.'lib'.DS.'init.php');

//$router=new Router($_SERVER['REQUEST_URI']);
/*
echo '<pre>';

print_r('Route: '. $router->getRoute().PHP_EOL);
print_r('Language: '. $router->getLanguage().PHP_EOL);
print_r('Controller: '. $router->getController().PHP_EOL);
print_r('Action to be called: '. $router->getmethodprefix(). $router->getAction().PHP_EOL);
echo "params:";
print_r($router->getParams());*/

App::run($_SERVER['REQUEST_URI']);

//include_once 'gpConfig.php';
//include_once 'User.php';


//$test=App::$db->query('Select * from pages');






