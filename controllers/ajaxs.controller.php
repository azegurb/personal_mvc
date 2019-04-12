<?php

class AjaxsController extends Controller {
	
	public function __construct($data=array()){
		
		parent::__construct($data);
		
		$this->ajaxmodel=new Ajax();
		
		
	}
	
	public function yaddas(){
		
		if($_POST){

			$result=$this->ajaxmodel->save($_POST);
			
		}
	
	}

    public function contact(){

//        $this->method='POST';

//        require_once(ROOT.DS.'config'.DS.'src/autoload.php');
//
        $sitekey = '6Ld-G0cUAAAAABv8fcOy5X-4b2vS9wgYT3okFHvF';
        $secret = '6Ld-G0cUAAAAAFgj3_2wwI2WYm1yrAAY_T6sjQ6-';
//
//        $RECAPTCHA = new \ReCaptcha\ReCaptcha($secret);
//
//        $GRECAPTCHARESPONSE = $_POST['g-recaptcha-response']; //GOOGLE CAPTCHA POST DATA
//        $REMOTEIP ='185.18.245.120'; //TO GET USER'S IP
//
//        $RECAPTCHAERRORS = ''; // BLANK VARIBLE TO STORE ERROR
//
//        $RESP = $RECAPTCHA->verify($GRECAPTCHARESPONSE, $REMOTEIP); //METHOD TO VERIFY CAPTCHA
//        IF ($RESP->isSuccess()) {
//            // SEND MAIL OR INSERT IN DB OR DO WHATVER YOU WISH TO
//
//        } ELSE {
//            $RECAPTCHAERRORS = $RESP->getErrorCodes(); // SET THE ERROR IN VARIBLE
//        }


        $url = 'https://www.google.com/recaptcha/api/siteverify';
        $data = array(
            'secret' => '6Ld-G0cUAAAAAFgj3_2wwI2WYm1yrAAY_T6sjQ6-',
            'response' => $_POST["g-recaptcha-response"]
        );

        $query = http_build_query($data);
        $options = array(
            'http' => array(
                'header' => "Content-Type: application/x-www-form-urlencoded\r\n".
                    "Content-Length: ".strlen($query)."\r\n".
                    "User-Agent:MyAgent/1.0\r\n",
                'method'  => "POST",
                'content' => $query,
            ),
        );
        $context  = stream_context_create($options);
        $verify = file_get_contents($url, false, $context);
        $captcha_success=json_decode($verify);

        if(isset($captcha_success->success) && $captcha_success->success==1){

//            return 'Sizin məktub göndərildi';
            printR('Sizin məktub göndərildi');
        }
        printR($_POST);
        printR( $_SERVER['REMOTE_ADDR']);
        printR($captcha_success);

    }

	
	public function deletepic(){
		
		if($_POST){

			$result=$this->ajaxmodel->deletepic($_POST['id'], $_POST['eid']);
			
		}
	
	}
	
	public function delimage(){
		
		if($_POST){

			$result=$this->ajaxmodel->delimage($_POST['elanid']);
			
		}
	
	}
	
	
	public function elancek(){
		
		if($_POST){

			$result=$this->ajaxmodel->elancek($_POST);
			
		}
	
	}
	
	public function forgetemail(){
		
		if($_POST){

			$result=$this->ajaxmodel->emailcek($_POST['email']);
			
		}
	
	}
	
	public function subcatcek(){
		
		if($_POST){

			$result=$this->ajaxmodel->subcatcek($_POST);
			
		}
	
	}
	
	public function aktivet(){
		
		if($_POST){

			$result=$this->ajaxmodel->activate($_POST);
			
		}
	
	}
	
	
	public function yaddaselan(){
		
		if($_POST){

			$result=$this->ajaxmodel->saveelan($_POST);
			
		}
	
	}
	
	public function editelan(){
		
		if($_POST){

			$result=$this->ajaxmodel->editelan($_POST);
			
		}
	
	}
	
	public function giris(){
		
		if($_POST){

			$result=$this->ajaxmodel->daxilol($_POST);
			
		}
	
	}

	
	
	public function picture(){
		
        $res=move_uploaded_file($_FILES["files"]["tmp_name"], 'uploads/gallery/'.$_FILES["files"]["name"]);

        $this->ajaxmodel->savepic('uploads/gallery/'.$_FILES["files"]["name"], $_POST['imgtext']);

        if($res){
            echo 'Yuklendi sekil';
        }
			
	}
	
	
	public function sesverme(){
		
		
		if(!$_POST['poll'] || !$_POST['pollid']){
			
			$result=$this->ajaxmodel->sesver($_GET);
	
			
		}
	
		else {
			
			$result=$this->ajaxmodel->sesver2($_POST);
			
		}
	
	}
	
}