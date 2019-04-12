<?php

require_once(ROOT.DS.'config'.DS.'config.php');

require_once(ROOT.DS.'config'.DS.'helper.php');


function __autoload($class_name){
	
	$lib_path=ROOT.DS.'lib'.DS.strtolower($class_name).'.class.php';
	
	$controller_path=ROOT.DS.'controllers'.DS.str_replace('controller', '', strtolower($class_name)).'.controller.php';
	
	$model_path=ROOT.DS.'models'.DS.strtolower($class_name).'.php';
	
	if(file_exists($lib_path)){
		
		require_once($lib_path);
		
	}
	else if(file_exists($controller_path)){
		
		require_once($controller_path);
	}
	else if(file_exists($model_path)){
		
		require_once($model_path);
	}

	else {
		
		 throw new Exception($class_name. ' adli klasi baglaya bilmedi');
	}

}

function __($key, $default_value=''){
	
	return Lang::get($key, $default_value);
	
}



