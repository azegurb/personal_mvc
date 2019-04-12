<?php

class ShopsController extends Controller {


    public function __construct($data=array()){

        parent::__construct($data);

        $this->model=new Shop('shop');

    }

    public function index(){



    }

    public function vacancypost(){

        $this->method='POST';

        if($_POST && isset($_POST['senderName']) && isset($_POST['senderEmail'])){

            $this->model->save($_POST, $_FILES);

            Session::setFlash('Səhifə yaddaşa verildi');

            Router::redirect('/vacancies/index/'.$_POST['id']);

        }

    }


    public function logout(){

        if(isset($_SESSION)){

            Session::destroy();

        }

        Router::redirect('/pages/leftmenu/1');

    }

}