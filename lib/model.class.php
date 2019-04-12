<?php

class Model {
	
	public $db;
    public $sql;
    public $tablename;
	
	public function __construct($tablename=null){

        $this->tablename=($tablename!=null)?$tablename:'';
		$this->db=App::$db;
		
	}

    public function get(){

        return $this->db->query($this->sql);
    }

    public function where($field, $sign, $val){

        $this->sql=$this->sql.' where '.$field.$sign.$val;
        return $this->db->query($this->sql);
    }

    public function count(){

        return count($this->db->query($this->sql));
    }

    public function sendEmail($address){

        $to      = $address;
        $subject = 'the subject';
        $message = 'hello';
        $headers = 'From: info@polo.mm' . "\r\n" .
            'Reply-To: webmaster@example.com' . "\r\n" .
            'X-Mailer: PHP/' . phpversion();

        mail($to, $subject, $message, $headers);

    }
	
}