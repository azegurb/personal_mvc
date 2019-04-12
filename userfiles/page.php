<?php
class Page extends Model {
	

public function getList(){
		
		$sql="Select * from main";
		
		return $this->db->query($sql);
		
	}
	
	public function getLeftMenuList(){
		
		$sql="Select link_id, link_name from section where uplink_id='0'";
		
		return $this->db->query($sql);
		
	}
	public function getLeftSubMenuList(){
		
		$sql="Select * from section where uplink_id='0'";
		
		return $this->db->query($sql);
		
	}
	
	
	public function getListSub(){
		
		$sql="Select * from submenu";
		
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
	
	public function getByIdMenu($id){
		
		$id=(int)$id;
		
		$sql="Select * from section where link_id='{$id}' limit 1";
		
		$result=$this->db->query($sql);
		
		return isset($result[0])?$result[0]:null;
		
	}
	
	public function getByIdSub($id){
		
		$id=(int)$id;
		
		$sql="Select * from submenu where id='{$id}' limit 1";
		
		$result=$this->db->query($sql);
		
		return isset($result[0])?$result[0]:null;
		
	}
	
	public function save($data, $id=null){
		
		if(!isset($data['title']) || !isset($data['content'])){
			
			return false;
			
		}
		
		$id=(int)$id;
		
		$alias=$this->db->escape($data['alias']);
		
		$title=$this->db->escape($data['title']);
		
		$content=$this->db->escape($data['content']);
		
		$is_published=isset($data['is_published'])?1:0;
		
		if(!$id){
			
			$sql="
			
				insert into main
			
					set title='{$title}',
						
						menu='{$content}'						
						
						
			";
			
		}
		
		else {
			
			$sql="
			
				update main
			
					set title='{$title}',
						
						menu='{$content}'
						
						where id={$id}
						
			";
						
		}
		
		return $this->db->query($sql);
		
		
		
	}
	
	public function delete($id){
	
		$id=(int)$id;
		
		$sql="delete from pages where id={$id}";
		
		return $this->db->query($sql);
		
		
	
	
	}
	
	
}