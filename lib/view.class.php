<?php

class View {
	
	protected $data;
	
	protected $path;
	
	protected $add;
	
	public static function getDefaultViewPath(){
		
		$router=App::getRouter();
		
		if(!$router){
			
			return false;
			
		}
		
		$controller_dir=$router->getController();
		
		$template_name=$router->getMethodPrefix().$router->getAction(). '.html';
				
		return VIEWS_PATH.DS.$controller_dir.DS.$template_name;
		
	}
	
	public function __construct($data=array(), $path=null, $add=null){

		if(!$path){

			$path=self::getDefaultViewPath();

		}
		if(!file_exists(is_array($path)?$path[0]:$path)){
			
			echo VIEWS_PATH.DS.App::getRouter()->getController().DS.App::getRouter()->getAction().'.html';
			
			throw new Exception($path.' adli Template fayli tapilmaid');
			
		}

		$this->path=$path;
		
		$this->data=$data;
		
		if($add!=null){
			
			$this->add=$add;
			
		}

	}
	
	public function render(){
		
		$data=$this->data;
		
		ob_start();
		
		$add=$this->add;
		
		$met=App::getRouter()->getAction();
		
		$con=App::getRouter()->getController();
		
		if(is_array($this->path)){
			
			if($con!='ajaxs'){
				
				include($this->path[0]);
				
			}
			
			
		}
		else {
			
			include($this->path);
			
		}		
		
		$content=ob_get_clean();
		
		return $content;
	}
	
	
}