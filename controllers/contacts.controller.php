<?php

class ContactsController extends Controller {
	
	
	
	public function __construct($data=array()){
		
		parent::__construct($data);
		
		$this->model=new Message();
		
		
	}
	public function index(){


		if($_POST){
			
			if($this->model->save($_POST)){
				
				Session::setFlash('Thank you! Your message gonderildi');
			}
			
		}
	
	}
	
	public function adminindex(){
		
		$this->data=$this->model->getList();
		
	}
	
	
}