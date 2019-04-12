<?php

class Page extends Model {

		public $name;

		public function getContent($id){
		
				$sql="Select * from content_material where id=$id";
				
				return $this->db->query($sql);
		
		}

		public function getByAlias($alias){

            $alias=$this->db->escape($alias);

            $sql="Select * from pages where alias='{$alias}' limit 1";

            $result=$this->db->query($sql);

            return isset($result[0])?$result[0]:null;

		}
	
		public function getById($id){
		
				$id=(int)$id;
				
				$sql="Select * from main where id='{$id}' limit 1";
				
				$result=$this->db->query($sql);
				
				return isset($result[0])?$result[0]:null;
		
		}

		public function getByCatId($id){

				$id=(int)$id;

				$sql="Select * from category where id='{$id}' limit 1";

				$result=$this->db->query($sql);

				return isset($result[0])?$result[0]:null;

		}

		public function getBySubCatId($id){

				$id=(int)$id;

				$sql="Select * from subcategory where sid='{$id}'";

				$result=$this->db->query($sql);

				return isset($result)?$result:null;

		}

		public function saveVacancy($data){

        }

        public function getByNewsId($id){

            $id=(int)$id;

            $sql="Select * from news where id='{$id}' limit 1";

            $result=$this->db->query($sql);

            return isset($result[0])?$result[0]:null;

        }

        public function savenews($data, $image, $id=null){

            if(!isset($data['title']) || !isset($data['name'])){

                return false;

            }

            $id=(int)$id;

            $title=$this->db->escape($data['title']);

            $catid=$this->db->escape($data['cat_id']);

            $shortname=$this->db->escape($data['short_name']);

            $content=$this->db->escape($data['name']);

            $editor=$this->db->escape($data['editor_id']);

            $date=date('Y-m-d H:i:s');

            if(!empty($image['newsimage']['name'])){

                $imageObj=new ImageController();

                $imageObj->UPLOADED_IMAGE_DESTINATION="uploads/news/large_img";

                $imageObj->THUMBNAIL_IMAGE_DESTINATION="uploads/news/small_img";

                $imageObj->RESIZED_IMAGE_DESTINATION="uploads/news/resized_img";

                $file_name=$image['newsimage']['name'];

                $file_path=$image['newsimage']['tmp_name'];

                $imageObj->process_image_upload($file_name, $file_path);

                $sek=$imageObj->name;

        }
        else {

            $sek="";
        }


        if($id==null){

            $sql="insert into news set title='{$title}', news_image='{$sek}', editor_id='{$editor}', news_category_id='{$catid}', short_name='{$shortname}', name='{$content}', created_at='{$date}'";

        }

        else {

            if(!empty($image['newsimage']['name'])){

                $resized=ROOT.DS.'webroot'.DS.'uploads'.DS.'news'.DS.'resized_img'.DS.$data['oldimage'];
                $small=ROOT.DS.'webroot'.DS.'uploads'.DS.'news'.DS.'small_img'.DS.$data['oldimage'];
                $large=ROOT.DS.'webroot'.DS.'uploads'.DS.'news'.DS.'large_img'.DS.$data['oldimage'];

                unlink ($resized);
                unlink ($small);
                unlink ($large);
                $sql="update news set title='{$title}', news_image='{$sek}', editor_id='{$editor}', news_category_id='{$catid}', short_name='{$shortname}',name='{$content}', created_at='{$date}' where id={$id}";

            }
            else {

                $sql="update news set title='{$title}', editor_id='{$editor}', news_category_id='{$catid}', short_name='{$shortname}',name='{$content}', created_at='{$date}' where id={$id}";

            }

        }

        return $this->db->query($sql);



    }

    public function savemenu($data, $id=null){
		
		if(!isset($data['name'])){
			
			return false;
			
		}
		
		$id=(int)$id;
			
		$title=$this->db->escape($data['name']);

        $parent_id=(int)$data['main_menu'];
        $label=$data['label'];
        $content_id=$data['cont_id'];
		if(!$id){
			
			$sql="insert into main_menu set parent_id='{$parent_id}', menu_name='{$title}'";
			
		}
		
		else {
			
			$sql="update main_menu set parent_id='{$parent_id}', fid='{$content_id}', label='{$label}', menu_name='{$title}' where id='{$id}'";
						
		}
		
		return $this->db->query1($sql);
		
		
		
	}


	/*kateqori save*/

	public function savenewscategory($data, $id=null){

		if(!isset($data['name'])){

			return false;

		}

		$id=(int)$id;

		$name=$this->db->escape($data['name']);

        $parent_id=(int)$data['parent_id'];


		if(!$id){

			$sql="insert into news_category set name='{$name}', parent_id='{$parent_id}'";

		}

		else {

			$sql="update news_category set name='{$name}' where id={$id}";

		}

	$this->db->query1($sql);



	}


	public function delete($table='pages', $id){
	
		$id=(int)$id;
		
		$sql="delete from $table where id={$id}";
		
		return $this->db->query($sql);
	}


    public function getNewsList($id=null, $page=null, $per_page=null, $sid=null){

        try {

            $search='';

            if($id!==null && $id!='' && App::getRouter()->getAction()!='inner'){

                $search="where n.news_category_id=$id";
            }
            if($sid!==null){

                $search="where n.id=$sid";
            }
//            printR(App::getRouter()->getParams());
//            die();
//            printR(App::getRouter()->getParams());
//            die();
            if($page!==null && App::getRouter()->getParams()[0]==''){

                $start=($page-1)*$per_page;

                $search.="limit $start, $per_page";

            }

            $this->sql = "Select n.id, n.name, n.news_image, n.short_name, n.created_at, n.title, n.news_image, nc.name as news_category_name, e.name as editor_name from news n inner join news_category nc on n.news_category_id=nc.id inner join editors e on n.editor_id=e.id $search";
//
//            printR($this->sql);
//            die();
            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }

    public function getList(){

        try {

            $this->sql = "Select * from $this->tablename";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }

    public function getTable($table){

        try {

            $this->sql = "Select * from $table";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }


    public function getLabel(){

        try {

            $this->sql = "Select * from labels";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }

    public function getContentMat(){

        try {

            $this->sql = "Select * from content_material";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }

    public function getNewscat(){

        try {

            $this->sql = "Select * from news_category where parent_id!=0";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }

    public function getEditors(){

        try {

            $this->sql = "Select * from editors";

            return $this;

        }
        catch (Exception $e) {

            wh_log($e->getMessage());
        }

    }


    public function getByMenuId($id){

        $id=(int)$id;

        $sql="Select * from main_menu where id='{$id}'";

        $result=$this->db->query($sql);

        return isset($result[0])?$result[0]:null;

    }
}
?>