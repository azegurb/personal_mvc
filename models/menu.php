<?php

class Menu extends Model {

    public function __construct($tablename)
    {
        parent::__construct($tablename);
    }



  public function getMenuList(){

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