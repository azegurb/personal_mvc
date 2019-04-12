<?php
/**
 * This script will search all PHP files in the same directory
 * and below and will check for trailing or leading whitespaces
 * and UTF-8 BOMs
 */

header("Content-Type: text/plain");

echo "starting...\n";
flush();
traverse(dirname(__FILE__));
echo "finished...\n";

function traverse($dir){
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
            //skip hidden files and upper dirs
            if(preg_match('/^[\._]/',$file)) continue;
            if(is_dir($dir.'/'.$file)){
                traverse($dir.'/'.$file);
                continue;
            }
            flush();

            if(!preg_match('/\.php$/',$file)) continue;
            $check = @file_get_contents("$dir/$file",0,null,0,3);
            if(!$check){
                echo "$dir/$file is not readable.\n";
                continue;
            }

            if($check == "\xef\xbb\xbf"){
                echo "$dir/$file has UTF-8 BOM at start.\n";
                continue;
            }

            if($check != '<?p'){
                echo "$dir/$file doesn't start with <?php\n";
                continue;
            }

            $check = file_get_contents("$dir/$file",0,null,
                                filesize("$dir/$file")-5,5);
            $pos = strpos($check, '?>');
            if($pos !== false && !(substr($check,-2) == '?>' || substr($check,-3) == "?>\n") ){
                echo "$dir/$file has trailing chars after closing ?>\n";
                continue;
            }
       }
       closedir($dh);
   }
}