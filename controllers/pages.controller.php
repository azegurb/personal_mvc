<?php

class PagesController extends Controller {
	
	public function __construct($data=array()){
		
		parent::__construct($data);
		
		$this->model=new Page('main_menu');

		$dil=Config::get('languages');
		
		$this->add[1]=$dil[App::getRouter()->getLanguage()];
		
		
	}
	
	public function index(){

		
	}
	
    public function adminnews(){
		
		$this->data['pages'][1]=$this->model->getNewsList(null)->get();

        $this->data['pages'][2]=$this->model->getNewsCat()->get();

        $this->data['pages'][3]=$this->model->getEditors()->get();

		if($_POST){
			
			$result=$this->model->savenews($_POST, $_FILES);
			
			Router::redirect('/admin/pages/news');
		}
		
	}

	public function menu(){
		
		$params=App::getRouter()->getParams();
		
		$this->data['pages'][0]=$this->model->getList()->get();

		if(isset($params[0])){
			
			$alias=strtolower($params[0]);
		
			$this->data['page']=$this->model->getByIdMenu($alias);
			
			$this->data['page']['men']=App::getRouter()->getAction();
		
		}
		
	}
    public function adminmenu(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getList()->get();

        $this->data['pages'][1]=$this->model->getList()->where('parent_id', '=', 0);

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']=$this->model->getByIdMenu($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

        }

    }

    public function adminsavemenu(){

        $this->method="POST";

        $result=$this->model->savemenu($_POST);

    }

    public function adminnewscategory(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getTable('news_category')->where('parent_id', '=', 1);

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']=$this->model->getByIdMenu($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

        }

        if($_POST){

            $result=$this->model->savenewscategory($_POST);

            Router::redirect('/admin/pages/newscategory');
        }

    }


	public function admineditnews(){

        $this->data['pages'][2]=$this->model->getNewsCat()->get();

        $this->data['pages'][3]=$this->model->getEditors()->get();

		if($_POST){
			
			$id=isset($_POST['id'])?$_POST['id']:null;

			$result=$this->model->savenews($_POST, $_FILES, $id);
			
			if($result){
			
				Session::setFlash('Page saxlanildi yaddasa');
			
			}
			else {
			
				Session::setFlash('Error');
			
			}
			
		}
		
		if(isset($this->params[0])){
			
			$this->data['page']=$this->model->getByNewsId($this->params[0]);
			
		}
		else {
		
			Session::setFlash('wrong id');
			
//			Router::redirect('/admin/pages/news/'.$id);

		}
	}
	
	public function adminedithidden(){
	
		if($_POST){
			
			$id=isset($_POST['id'])?$_POST['id']:null;
	
			$result=$this->model->savehidden($_POST, $id);
			
			if($result){
			
				Session::setFlash('Page saxlanildi yaddasa');
			
			}
			else {
			
				Session::setFlash('Error');
			
			}
			
		}
		if(isset($this->params[0])){
			
			$this->data['page']=$this->model->getByHiddenId($this->params[0]);
			
		}
		
	}
	
	public function admineditmenu(){
	
		if($_POST){
			
			$id=isset($_POST['id'])?$_POST['id']:null;
	
			$result=$this->model->savemenu($_POST, $id);
			
			if($result){
			
				Session::setFlash('Page saxlanildi yaddasa');
			
			}
			else {
			
				Session::setFlash('Error');
			
			}
			
		}
		
		if(isset($this->params[0])){
			
			$this->data['page']=$this->model->getByMenuId($this->params[0]);
            $this->data['pages'][1]=$this->model->getList()->where('parent_id', '=', 0);
            $this->data['pages'][2]=$this->model->getLabel()->get();
            $this->data['pages'][3]=$this->model->getContentMat()->get();
		}
		else {
		
			Session::setFlash('wrong id');
			
		}
	}

	public function adminadd(){
		
		if($_POST){
			
	//		$this->data['page']=$this->model->getById($this->params[0]);
			$result=$this->model->save($_POST);
			
			if($result){
			
				Session::setFlash('Page saxlanildi yaddasa');
			
			}
			else {
			
				Session::setFlash('Error');
			
			}
			
			Router::redirect('/admin/pages/');
		}
	
	}

	public function admindeletemenu(){
	
		if(isset($this->params[0])){
		
			$result=$this->model->delete('main_menu', $this->params[0]);
						
			if($result){
			
				Session::setFlash('Page silindi');
			
			}
			else {
			
				Session::setFlash('Error ailinmedi page');
			
			}
		
		}
		
		Router::redirect('/admin/pages/');
	
	}

	public function adminpictur(){

        $this->data['pages'][0]=$this->model->getTable('gallery')->get();


        if(isset($this->params[0])){
		
			$result=$this->model->delete($this->params[0]);
						
			if($result){
			
				Session::setFlash('Page silindi');
			
			}
			else {
			
				Session::setFlash('Error ailinmedi page');
			
			}
		
		}
		
	}
	
	 public function logout(){
			
			if(isset($_SESSION)){
				
				Session::destroy();
				
			}
            
           Router::redirect('/pages/leftmenu/1');
            
        }
	
}