<?php

class Session {
	
	public static $flash_message;
	
	public static function setFlash($message){

        $_SESSION['flash_message']= $message;
		
	}
	
	public static function hasFlash(){
		
		return !is_null(self::$flash_message);		
		
	}
		
	public static function flash(){

        if(isset($_SESSION['flash_message'])){
            echo $_SESSION['flash_message'];

            self::delete('flash_message');

        }

	}
		
	public static function set($key, $value){
		
		$_SESSION[$key]=$value;
		
	}
	
	public static function get($key){
		
		if(isset($_SESSION[$key])){
			
			return $_SESSION[$key];
		}
		
		return null;
		
	}
	
	public static function delete($key){
		
		if(isset($_SESSION[$key])){
			
			unset($_SESSION[$key]);
		}
		
				
	}
	
	public static function destroy(){
		
		session_destroy();
		
	}
	
	
}