<?php

class Gallery extends Model {

    public function __construct($tablename)
    {
        parent::__construct($tablename);
    }

  public function getGallery(){

      try {
          $this->sql = "Select * from ".$this->tablename;

          return $this;

      }
      catch (Exception $e) {

          wh_log($e->getMessage());
      }

  }

}
?>