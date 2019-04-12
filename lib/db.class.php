<?php
class DB {
	
	public $connection;
	
	public function __construct($host, $user, $password, $db_name){
		
		$this->connection=new mysqli($host, $user, $password, $db_name);
		
		mysqli_set_charset($this->connection,"utf8");
		
		if(mysqli_connect_error()){
			
			throw new Exception('couldnt connect to DB');
						
		}
		
	}
	
	public function query($sql){
		
		if(!$this->connection){
			
			return false;
			
		}
		
		$result=$this->connection->query($sql);
		
		if(mysqli_error($this->connection)){
			
			throw new Exception(mysqli_error($this->connection));
			
		}
		
		if(is_bool($result)){
			
			return $result;
			
		}
		
		$data=array();
		
		while($row=mysqli_fetch_assoc($result)){
			
			$data[]=$row;			
			
		}
		return $data;
		
	}
	
	public function querychained($sql){
		
		$deep=1;
		
		if(!$this->connection){
			
			return false;
			
		}
		
		$result=$this->connection->query($sql);
		
		if(mysqli_error($this->connection)){
			
			throw new Exception(mysqli_error($this->connection));
			
		}
		
		if(is_bool($result)){
			
			return $result;
			
		}
		
		$data=array();
		
		while($row=mysqli_fetch_assoc($result)){
			
				$lnid=$row["id"];
			
				if($this->nrows2($this->connection->query("select * from subcategory where sid='$lnid'"))>0){
					
					$row['sehife']=$this->querychained("select id, sid, name from subcategory where sid='$lnid'");
					
					for($i=0;$i<count($row['sehife']);$i++){
						
						$id=$row['sehife'][$i]['id'];
						
						if($this->nrows2($this->connection->query("select * from subcategory2 where ssid='$id'"))>0){
							
							$iki=$this->querychained("select * from subcategory2 where ssid='$id'");
							
							$row['sehife'][$i]['alt']=$iki;
							
						}
						
					}
					
				}
			
			
						
			$data[]=$row;
		}
		
		return $data;
		
	}
	
	public function escape($str){
		
		return mysqli_escape_string($this->connection, $str);
		
	}
	
	public function nrows($sql){
		
		$sor=$this->connection->query($sql);
		
		return $sor->num_rows;
		
	}
	
	public function nrows2($sql){
		
		return mysqli_num_rows($sql);
		
	}
	
	public function insertid($sql){
		
		$sor=$this->connection->query($sql);
		
		return $sor->insert_id;
		
	}
	
	public function query1($sql){
		
		if(!$this->connection){
			
			return false;
			
		}
				
		if(mysqli_error($this->connection)){
			
			throw new Exception(mysqli_error($this->connection));
			
		}
		
		$result=$this->connection->query($sql);
		
		if(is_bool($result)){
			
			return $result;
			
		}
		
				
	}

	
	
	
	
}