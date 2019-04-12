<?php


class Shop extends Model {

    public function __construct($tablename)
    {
        parent::__construct($tablename);
    }

    public function getNewsList(){

        try {
            $this->sql = "Select n.id, n.name, n.created_at, n.title, n.news_image, nc.name as news_category_name, e.name as editor_name from news n inner join news_category nc on n.news_category_id=nc.id inner join editors e on n.editor_id=e.id";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }

}
