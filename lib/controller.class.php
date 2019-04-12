<?php

//require_once(ROOT.DS.'lib'.DS.'view.class.php');

class Controller {
	
	public $data;
	
	protected $model;
	
	protected $params;

    public $add;

    public $method;
	
	public function getData(){
		
		return $this->data;
		
	}
	
	public function getAdd(){
		
		return $this->add;
		
	}
	
	public function getModel(){
		
		return $this->model;
		
	}
	
		public function getParams(){
		
		return $this->params;
		
	}
	
	public function __construct($data=array()){
		
		$this->data=$data;
		
		$this->params=App::getRouter()->getParams();
		
		
		
	}
	
}