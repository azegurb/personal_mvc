<?php


class App {
	
	protected static $router;
	
	public static $db;

    public static $fburl;



    public static function getRouter(){
		
		return self::$router;
	}
	
	public static function run($url){
		
		self::$router=new Router($url);
		
		self::$db=new DB(Config::get('db.host'), Config::get('db.user'), Config::get('db.password'), Config::get('db.db_name'));
		
	//	Lang::load(self::$router->getLanguage());
		
		$controller_class=ucfirst(self::$router->getController()).'Controller';
				
		$controller_method=strtolower(self::$router->getmethodprefix().self::$router->getAction());
		
		$layout=self::$router->getRoute();
		
		if($layout=='admin' && Session::get('role')!='admin'){
			
			if($controller_method!='adminlogin'){
				
				Router::redirect('/admin/users/login/');
			}
		
		}
//echo self::$router->getLanguage();

		$controller_object=new $controller_class();

		if(method_exists($controller_object, $controller_method)){
		
			$view_path=$controller_object->$controller_method();
			
				if($controller_class!='AjaxsController' && !isset($controller_object->method) && $controller_object->method!='POST'){
					
					$view_object=new View($controller_object->getData(), $view_path);
					
					$content=$view_object->render();

					
				}
				else {

					$content='';


				}

		}
		else {
			
			throw new Exception('Method '.$controller_method.' of class '.$controller_class.' movcud edyil');
		}
		
		
		
		$layout_path=VIEWS_PATH.DS.$layout.'.html';
		
		$layout_path_footer=VIEWS_PATH.DS.$layout.'_footer.html';
				
		$layout_array=array($layout_path, $layout_path_footer);

		$layout_view_object=new View(compact('content'), $layout_array, $controller_object->getAdd());
//		return $layout_view_object->render();
		echo $layout_view_object->render();
		
	}

	public static function set($obj){

        self::$fburl=$obj;
    }

    public static function get(){

        return self::$fburl;
    }
}