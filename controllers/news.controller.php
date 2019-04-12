<?php

class NewsController extends Controller {

    public function __construct($data=array()){

        parent::__construct($data);

        $this->model=new Page('news');



    }

    public function index(){


        if(App::getRouter()->getAction()=='index' && count(App::getRouter()->getParams())==0){

            $this->data['pages'][0]=newsGenerator();
        }
        else {

            $this->data['pages'][0]=newsGenerator(App::getRouter()->getParams()[0]);

        }


    }


    public function inner(){

        $this->data['pages'][0]=newsInnerGenerator(App::getRouter()->getParams()[0]);

    }

    public function elanpage(){

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        $this->data['pages']['sol']=$this->model->getCategory();

        $this->data['pages']['news']=$this->model->getNews();

        $params=App::getRouter()->getParams();

        if(isset($params[0])){

            $alias=strtolower($params[0]);

        }
        else {

            $alias='1';

        }

        $this->data['pages']['elan']=$this->model->getElan($alias);

        $this->data['pages']['elancox']=$this->model->getElan(1);

        $this->data['pages']['sehifele']=$this->model->pagecount("Select * from news");

        $this->data['pages']['sehifele1']=$this->model->pagecount("Select * from common where active='active'", 6);

        $id=1;

        $this->data['page']=$this->model->getById($id);

        if(isset($_GET) && $_GET['s']!="" && isset($this->data['page']['link_name'])){

            $this->data['page']['link_name']='nese axtar';

            $this->data['page']['text']='';

        }
        else if( isset($_GET) && $_GET['s']!="" && isset($this->data['page']['link_name'])){

            $this->data['page']['title']='nese axtar';

            $this->data['page']['menu']='';

        }


    }



    public function axtar(){

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        $this->data['pages']['sol']=$this->model->getCategory();

        $this->data['pages']['news']=$this->model->getNews();

        $this->data['pages']['elan']=$this->model->getElan(1);

        $this->data['pages']['sehifele']=$this->model->pagecount("Select * from news");



        if(isset($_GET)){


            //	$soz=mysqli_real_escape_string($this->model->db->connection, $_GET['soz']);
            $soz=$_GET['soz'];

            $soz=isset($_GET['soz']) && $_GET['soz']!=''?$_GET['soz']:null;

            $cat=isset($_GET['category']) && $_GET['category']!=''?$_GET['category']:null;

            $this->data['page']['result']=$this->model->getSoz($soz, $cat);

            $this->data['page']['text']='';

        }


    }


    public function leftmenu(){

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        $this->data['pages'][1]=$this->model->getCategory();

        $this->data['pages']['elan']=$this->model->getElan(1);

        $this->data['pages']['sol']=$this->model->getCategory();

        $params=App::getRouter()->getParams();

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']=$this->model->getLeftById($alias);

        }

        if(isset($_GET) && $_GET['s']!="" && isset($this->data['page']['link_name'])){

            $this->data['page']['link_name']='nese axtar';

            $this->data['page']['text']='';

        }
        else if( isset($_GET) && $_GET['s']!="" && isset($this->data['page']['link_name'])){

            $this->data['page']['title']='nese axtar';

            $this->data['page']['menu']='';

        }

        $this->data['pages']['sehifele1']=$this->model->pagecount("Select * from common where active='active'", 6);

    }


    public function view(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        $this->data['pages']['sol']=$this->model->getCategory();

        $this->data['pages']['elan_sayi']=$this->model->getElansayi();

        $this->data['pages']['elancox']=$this->model->getElan(1);

        $cek=1;

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            if($alias=='1'){

                $this->data['pages']['news']=$this->model->getNews();

                $this->data['pages']['sehifele']=$this->model->pagecount("select * from news");

            }

            $this->data['page']=$this->model->getById($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

            $this->data['page']['param']=$params[0];

        }

        $this->data['pages']['elan']=$this->model->getElan($cek);

        $this->data['pages']['sehifele1']=$this->model->pagecount("Select * from common where active='active'", 6);

    }


    public function viewh(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        $this->data['pages']['sol']=$this->model->getCategory();

        $this->data['pages']['elan_sayi']=$this->model->getElansayi();

        $this->data['pages']['elancox']=$this->model->getElan(1);

        $cek=1;

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']['hid']=$this->model->getByHiddenId($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

            $this->data['page']['param']=$params[0];

        }

        $this->data['pages']['elan']=$this->model->getElan($cek);

        $this->data['pages']['sehifele1']=$this->model->pagecount("Select * from common where active='active'", 6);

    }

    /*
    public function news(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        $this->data['pages']['sol']=$this->model->getCategory();

        $this->data['pages']['news']=$this->model->getNews();

        if(isset($params[1]) && isset($params[0]) && $params[0]=='xeber'){

            $alias=strtolower($params[1]);

            $this->data['page']=$this->model->getByNewsId($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

            $this->data['page']['param']=$params[0];

            $this->data['pages']['sehifele']=$this->model->pagecount("select * from news");


        }

        else if(isset($params[0]) && !isset($params[1])){

            $this->data['pages']['news']=$this->model->getNews($params[0]);

            $this->data['pages']['sehifele']=$this->model->pagecount("select * from news");


        }
        else {

            $this->data['pages']['news']=$this->model->getNews();


        }

    }
    */

    public function news(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        $this->data['pages']['sol']=$this->model->getCategory();

        $this->data['pages']['elan']=$this->model->getElan(1);

        if(isset($params[1]) && isset($params[0]) && $params[0]=='xeber'){

            $alias=strtolower($params[1]);

            $this->data['page']=$this->model->getByNewsId($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

            $this->data['page']['param']=$params[0];

            $this->data['pages']['sehifele']=$this->model->pagecount("select * from news");


        }

        else if(isset($params[0]) && !isset($params[1])){

            $this->data['pages']['news']=$this->model->getNews($params[0]);

            $this->data['pages']['sehifele']=$this->model->pagecount("select * from news");


        }
        else {

            $this->data['pages']['news']=$this->model->getNews();


        }

    }

    public function cat(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getLeftMenuList();
        $this->data['pages']['sol']=$this->model->getCategory();

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']=$this->model->getByCatId($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

            $this->data['page']['param']=$params[0];

        }

    }


    public function admincategory(){

        $this->data['pages'][1]=$this->model->getCategory();


        if($_POST){

            $result=$this->model->savecategory($_POST);

            Router::redirect('/admin/pages/category');
        }

    }

    public function adminsubcategory(){

        $this->data['pages'][1]=$this->model->getCategory();

        $this->data['pages'][2]=$this->model->getPro();

        if($_POST){

            if(isset($_POST['sub3'])){

                $result=$this->model->savesub2category($_POST, $_FILES);

            }
            else {

                $result=$this->model->savesubcategory($_POST, $_FILES);

            }


            Router::redirect('/admin/pages/subcategory');


        }

    }


    public function adminnews(){

        $this->data['pages'][1]=$this->model->getNews('1', true);


        if($_POST){

            $result=$this->model->savenews($_POST);

            Router::redirect('/admin/pages/news');
        }

    }

    public function adminhidden(){

        $this->data['pages'][1]=$this->model->getHidden();


        if($_POST){

            $result=$this->model->savehidden($_POST);

            Router::redirect('/admin/pages/hidden');
        }

    }

    public function adminvahid(){

        $this->data['pages']['vahid']=$this->model->getVahid();

        if($_POST){

            $result=$this->model->savevahid($_POST);

            Router::redirect('/admin/pages/vahid');


        }

    }
    public function menu(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getList();

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']=$this->model->getByIdMenu($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

        }

    }

    public function submenu(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getList();

        $this->data['pages'][1]=$this->model->getLeftMenuList();

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']=$this->model->getByIdMenu($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

        }

    }


    public function subview(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getList();

        $this->data['pages'][1]=$this->model->getLeftMenuList();

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']=$this->model->getByIdSub($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

        }

    }

    public function elan(){

        $params=App::getRouter()->getParams();

        $this->data['pages'][0]=$this->model->getList();

        $this->data['pages'][1]=$this->model->getLeftMenuList();

        $this->data['pages']['sol']=$this->model->getCategory();

        $this->data['pages']['elancox']=$this->model->getElan(1);

        if(isset($params[0])){

            $alias=strtolower($params[0]);

            $this->data['page']['self']=$this->model->getElanById($alias);

            $this->data['page']['pic']=$this->model->getPic($alias);

            $this->data['page']['men']=App::getRouter()->getAction();

        }

        $this->data['pages']['sehifele1']=$this->model->pagecount("Select * from common where active='active'", 6);

    }


    public function adminindex(){

//        $this->data['pages']=$this->model->getList();
        //	$this->data['bolme']=$this->model->getLeftMenuList();
//        $this->add[1]=$this->model->getCatSubcat();
    }

    public function adminedit(){

        if($_POST){

            $id=isset($_POST['id'])?$_POST['id']:null;

            $result=$this->model->save($_POST, $id);

            if($result){

                Session::setFlash('Səhifə yaddaşa verildi');

            }
            else {

                Session::setFlash('Error');

            }

        }

        if(isset($this->params[0])){



            $this->data['page']=$this->model->getById($this->params[0]);

        }
        else {

            Session::setFlash('wrong id');

            Router::redirect('/admin/pages/');

        }
    }


    public function admineditcat(){

        if($_POST){

            $id=isset($_POST['id'])?$_POST['id']:null;

            $result=$this->model->savecategory($_POST, $id);

            if($result){

                Session::setFlash('Səhifə yaddaşa verildi');

            }
            else {

                Session::setFlash('Xəta');

            }

        }

        if(isset($this->params[0])){

            $this->data['page']=$this->model->getByCatId($this->params[0]);

        }
        else {

            Session::setFlash('wrong id');

        }
    }

    public function admineditsubcat(){

        if($_POST){

            $id=isset($_POST['id'])?$_POST['id']:null;

            $result=$this->model->savesubcategory($_POST, $_FILES, $id);

            if($result){

                Session::setFlash('Səhifə yaddaşa verildi');

                Router::redirect('/admin/pages/editsubcat/'.$id);

            }
            else {

                Session::setFlash('Xəta');
                Router::redirect('/admin/pages/editsubcat/'.$id);

            }

        }

        if(isset($this->params[0])){

            $this->data['page']=$this->model->getBySubCatIdm($this->params[0]);

            $this->data['pagecat']=$this->model->getCategory();

            $this->data['pages'][2]=$this->model->getPro();

        }
        else {

            Session::setFlash('wrong id');

        }
    }

    /*subcat edit2 burda baslayir */

    public function admineditsubcat2(){

        if($_POST){

            $id=isset($_POST['id'])?$_POST['id']:null;

            $result=$this->model->savesub2category($_POST, $id);

            if($result){

                Session::setFlash('Səhifə yaddaşa verildi');

                Router::redirect('/admin/pages/editsubcat2/'.$id);

            }
            else {

                Session::setFlash('Xəta');
                Router::redirect('/admin/pages/editsubcat2/'.$id);

            }

        }

        if(isset($this->params[0])){

            $this->data['page']=$this->model->getBySubCatIdm($this->params[0], 'subcategory2');

            $this->data['pagecat']=$this->model->getCategory();

            $this->data['pagesubcat']=$this->model->getSubCategory();

            //$this->data['pages'][2]=$this->model->getPro();

            $this->data['pages'][3]=$this->model->getSelectedProSub2($this->params[0]);

        }
        else {

            Session::setFlash('wrong id');

        }
    }

    /*subcat2 editi */

    public function admineditactiv(){

        $this->data['pages'][1]=$this->model->getCategory();


        if(isset($this->params[0])){

            $alias=strtolower($this->params[0]);

            $this->data['page']['catid']=$this->model->getElanById($this->params[0]);

            $this->data['page']['subcatid']=$this->model->getBySubCatId($this->data['page']['catid'][0]['cat_id']);

            $this->data['page']['sekiller']=$this->model->getByPic($alias);


            $this->data['page']['men']=App::getRouter()->getAction();

        }



    }


    public function admineditnews(){

        if($_POST){

            $id=isset($_POST['id'])?$_POST['id']:null;

            $result=$this->model->savenews($_POST, $id);

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

            Router::redirect('/admin/pages/news/'.$id);

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

    public function admineditsolmenu(){

        if($_POST){

            $id=isset($_POST['id'])?$_POST['id']:null;

            $result=$this->model->saveleftmenu($_POST, $id);

            if($result){

                Session::setFlash('Page saxlanildi yaddasa');

            }
            else {

                Session::setFlash('Error');

            }

        }

        if(isset($this->params[0])){

            $this->data['page']=$this->model->getBySolmenuId($this->params[0]);

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

    public function adminsolmenu(){

        $this->data['pages'][0]=$this->model->getLeftMenuList();

        if($_POST){

            $result=$this->model->saveleftmenu($_POST);

            Router::redirect('/admin/pages/solmenu');
        }

    }

    public function adminactiv(){


        if(isset($this->params[1]) && $this->params[0]=='a'){

            $this->data['pages'][2]=$this->model->getActives($this->params[1], 6);

            $this->data['pages'][1]=$this->model->getPassives(1, 6);

            $this->data['params']=$this->params[1];

        }

        else if(isset($this->params[1]) && $this->params[0]=='p'){

            $this->data['pages'][1]=$this->model->getPassives($this->params[1], 6);

            $this->data['pages'][2]=$this->model->getActives(1, 6);

            $this->data['params']=$this->params[1];

        }

        else {

            $this->data['pages'][2]=$this->model->getActives(1, 6);

            $this->data['pages'][1]=$this->model->getPassives(1, 6);

        }


        $this->data['pages']['sehifele1']=$this->model->pagecount("Select * from common where active='active'", 6);

        $this->data['pages']['sehifele2']=$this->model->pagecount("Select * from common where active='passive'", 6);

        if($_POST){

            $result=$this->model->saveleftmenu($_POST);

            Router::redirect('/admin/pages/solmenu');
        }

    }


    public function admindelete(){

        if(isset($this->params[0])){

            $result=$this->model->delete($this->params[0]);

            if($result){

                Session::setFlash('Page silindi');

            }
            else {

                Session::setFlash('Error ailinmedi page');

            }

        }

        Router::redirect('/admin/pages/');

    }

    public function admindeletesubcat(){

        if(isset($this->params[0])){

            $result=$this->model->delete('subcategory', $this->params[0]);

            if($result){

                Session::setFlash('Page silindi');

            }
            else {

                Session::setFlash('Error ailinmedi page');

            }

        }

        Router::redirect('/admin/pages/');

    }

    public function admindeleteactiv(){

        if(isset($this->params[0])){

            $result=$this->model->deleteActive($this->params[0]);

            if($result){

                Session::setFlash('Elan silindi');

            }
            else {

                Session::setFlash('Elan siline bilmedi');

            }

        }

        Router::redirect('/admin/pages/activ');

    }

    public function adminpictur(){

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