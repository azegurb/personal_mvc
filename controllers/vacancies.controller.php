<?php

class VacanciesController extends Controller {


    public function __construct($data=array()){

        parent::__construct($data);

        $this->model=new Vacancy('vacancy');

    }

    public function index(){

        if(App::getRouter()->getAction()=='index' && count(App::getRouter()->getParams())==0){

            $this->data['pages'][0]=vacancyGenerator();
        }
        else {

            $this->data['pages'][0]=vacancyGenerator(App::getRouter()->getParams()[0]);

        }

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