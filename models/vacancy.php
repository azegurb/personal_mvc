<?php


class Vacancy extends Model {

    public function __construct($tablename)
    {
        parent::__construct($tablename);
    }

    public function getVacancyList($id){

        try {
            if($id!==null && $id!=''){

                $id="where v.id=$id";
            }

            $this->sql = "Select v.id, v.vacancy_details, v.created_at, d.name, p.name as profession_name from $this->tablename v inner join departaments d on v.departament_id=d.id inner join professions p on v.profession_id=p.id $id";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }

    public function getVacancyInner($id){

        try {

            $this->sql = "Select v.vacancy_details from $this->tablename v where id=$id";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());

            return $e->getMessage();
        }
    }

    public function save($data, $files=null){

        if(!isset($data['senderName']) || !isset($data['senderEmail'])){

            return false;

        }

        $senderName=$this->db->escape($data['senderName']);

        $email=$this->db->escape($data['senderEmail']);

        $senderWebsite=$this->db->escape($data['senderWebsite']);

        $comment=$this->db->escape($data['comment']);

        $senderFile=$_FILES["files"]["name"];

        $res=move_uploaded_file($_FILES["files"]["tmp_name"], 'uploads/'.$_FILES["files"]["name"]);

        $sql="insert into vacancy_request set sender_name='{$senderName}', sender_email='{$email}', sender_comment='{$comment}', sender_webpage='{$senderWebsite}', sender_file='{$senderFile}'";

       $this->db->query($sql);

        $this->sendEmail($email);


    }

}
