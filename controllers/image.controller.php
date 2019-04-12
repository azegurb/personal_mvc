<?php


define('WATERMARK_OVERLAY_IMAGE', 'watermark.png');
//define('WATERMARK_OVERLAY_OPACITY', 50);
//define('WATERMARK_OUTPUT_QUALITY', 90);

class ImageController extends Controller
{
    private $THUMBNAIL_IMAGE_MAX_WIDTH='300';
    private $THUMBNAIL_IMAGE_MAX_HEIGHT='250';
    private $RESIZED_IMAGE_MAX_WIDTH='800';
    private $RESIZED_IMAGE_MAX_HEIGHT='666';
    public $UPLOADED_IMAGE_DESTINATION="boyuk";
    public $THUMBNAIL_IMAGE_DESTINATION="balaca";
    public $RESIZED_IMAGE_DESTINATION="resized";
    public $upload_image_path;
    public $name;
    public $source_width;
    public $source_height;

    /*burda qurtar*/
    public function genRandomString()
    {
        $length = 8;
        $characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWZYZ";
        $real_string_length = strlen($characters) ;
        $string="id";
        for ($p = 0; $p < $length; $p++) {
            $string .= $characters[mt_rand(0, $real_string_length-1)];
        }
        return strtolower($string);
    }

    function generate_image_thumbnail( $source_image_path, $thumbnail_image_path )
    {
        list( $source_image_width, $source_image_height, $source_image_type ) = getimagesize( $source_image_path );

        switch ( $source_image_type ){
            case IMAGETYPE_GIF:
                $source_gd_image = imagecreatefromgif( $source_image_path );
                break;

            case IMAGETYPE_JPEG:
                $source_gd_image = imagecreatefromjpeg( $source_image_path );
                break;

            case IMAGETYPE_PNG:
                $source_gd_image = imagecreatefrompng( $source_image_path );
                break;
        }

        if ($source_gd_image === false){
            return false;
        }

        $thumbnail_image_width = $this->THUMBNAIL_IMAGE_MAX_WIDTH;
        $thumbnail_image_height =$this->THUMBNAIL_IMAGE_MAX_HEIGHT;
        $source_aspect_ratio = $source_image_width / $source_image_height;
        $thumbnail_aspect_ratio = $thumbnail_image_width / $thumbnail_image_height;

        if ( $source_image_width <= $thumbnail_image_width && $source_image_height <= $thumbnail_image_height){
            $thumbnail_image_width = $source_image_width;
            $thumbnail_image_height = $source_image_height;
        }
        elseif ( $thumbnail_aspect_ratio > $source_aspect_ratio )
        {
            $thumbnail_image_width = ( int ) ( $thumbnail_image_height * $source_aspect_ratio );
        }
        else
        {
            $thumbnail_image_height = ( int ) ( $thumbnail_image_width / $source_aspect_ratio );
        }

        $this->source_height=$thumbnail_image_height;
        $this->source_width=$thumbnail_image_width;
        $thumbnail_gd_image = imagecreatetruecolor( $thumbnail_image_width, $thumbnail_image_height );

        imagecopyresampled( $thumbnail_gd_image, $source_gd_image, 0, 0, 0, 0, $thumbnail_image_width, $thumbnail_image_height, $source_image_width, $source_image_height );

        switch ( $source_image_type )
        {
            case IMAGETYPE_GIF:
                imagegif( $thumbnail_gd_image, $thumbnail_image_path, 90 );
                break;

            case IMAGETYPE_JPEG:
                imagejpeg( $thumbnail_gd_image, $thumbnail_image_path, 90 );
                break;

            case IMAGETYPE_PNG:
                imagepng( $thumbnail_gd_image, $thumbnail_image_path, 9 );
                break;
        }

        imagedestroy( $source_gd_image );

        // imagedestroy( $thumbnail_gd_image );

        return $thumbnail_gd_image;
    }

    function generate_image_thumbnail_large( $source_image_path, $thumbnail_image_path )
    {
        list( $source_image_width, $source_image_height, $source_image_type ) = getimagesize( $source_image_path );

        switch ( $source_image_type ){
            case IMAGETYPE_GIF:
                $source_gd_image = imagecreatefromgif( $source_image_path );
                break;

            case IMAGETYPE_JPEG:
                $source_gd_image = imagecreatefromjpeg( $source_image_path );
                break;

            case IMAGETYPE_PNG:
                $source_gd_image = imagecreatefrompng( $source_image_path );
                break;
        }

        if ($source_gd_image === false){
            return false;
        }

        $thumbnail_image_width = $this->RESIZED_IMAGE_MAX_WIDTH;
        $thumbnail_image_height =$this->RESIZED_IMAGE_MAX_HEIGHT;
        $source_aspect_ratio = $source_image_width / $source_image_height;
        $thumbnail_aspect_ratio = $thumbnail_image_width / $thumbnail_image_height;

        if ( $source_image_width <= $thumbnail_image_width && $source_image_height <= $thumbnail_image_height){
            $thumbnail_image_width = $source_image_width;
            $thumbnail_image_height = $source_image_height;
        }
        elseif ( $thumbnail_aspect_ratio > $source_aspect_ratio )
        {
            $thumbnail_image_width = ( int ) ( $thumbnail_image_height * $source_aspect_ratio );
        }
        else
        {
            $thumbnail_image_height = ( int ) ( $thumbnail_image_width / $source_aspect_ratio );
        }

        $this->source_height=$thumbnail_image_height;
        $this->source_width=$thumbnail_image_width;
        $thumbnail_gd_image = imagecreatetruecolor( $thumbnail_image_width, $thumbnail_image_height );

        imagecopyresampled( $thumbnail_gd_image, $source_gd_image, 0, 0, 0, 0, $thumbnail_image_width, $thumbnail_image_height, $source_image_width, $source_image_height );

        switch ( $source_image_type )
        {
            case IMAGETYPE_GIF:
                imagegif( $thumbnail_gd_image, $thumbnail_image_path, 90 );
                break;

            case IMAGETYPE_JPEG:
                imagejpeg( $thumbnail_gd_image, $thumbnail_image_path, 90 );
                break;

            case IMAGETYPE_PNG:
                imagepng( $thumbnail_gd_image, $thumbnail_image_path);
                break;
        }

        imagedestroy( $source_gd_image );

        // imagedestroy( $thumbnail_gd_image );

        return $thumbnail_gd_image;
    }

    //--------------------------------
    public function create_watermark($source_file_path, $output_file_path, $methodName)
    {
//        $nn=$this->generate_image_thumbnail($source_file_path, $output_file_path);
        $nn=call_user_func_array(array($this, $methodName), array($source_file_path, $output_file_path));
        $source_gd_image=$nn;

        $source_width=$this->source_width;
        $source_height=$this->source_height;

        $overlay_gd_image = imagecreatefrompng(WATERMARK_OVERLAY_IMAGE);

        $overlay_width = imagesx($overlay_gd_image);
        $overlay_height = imagesy($overlay_gd_image);
        /*
    $watermark_left = ($source_width/2)-($overlay_width/2); //watermark left
    $watermark_bottom = ($overlay_width/2)-($overlay_height/2); //watermark bottom
        */
        $watermark_left = ($source_width/2)-(206/2); //watermark left
        $watermark_bottom = ($source_height/2)-(44/2); //watermark bottom

//use PHP imagecopy() to merge two images.
        imagecopy($source_gd_image, $overlay_gd_image, $watermark_left, $watermark_bottom, 0, 0, 206, 44); //merge image

        imagejpeg($source_gd_image, $output_file_path, WATERMARK_OUTPUT_QUALITY);
        imagedestroy($source_gd_image);
        imagedestroy($overlay_gd_image);
    }

    // FILE PROCESSING FUNCTION
    //--------------------------------
    public function process_image_upload( $field, $temp)
    {
        $temp_image_path = $temp;
        $temp_image_name = $field;
        $bul=$temp_image_name;
        $bulunacak = array('ç','Ç','ý','Ý','ð','Ð','ü','ö','Þ','þ','Ö','Ü',',',' ','(',')','[',']');
        $degistir  = array('c','C','i','I','g','r','','ts','yu','Yu','Ts','','','_','','','','');
        $temp_image_name=str_replace($bulunacak, $degistir, $bul);
        list( , , $temp_image_type ) = getimagesize($temp_image_path);
        if ($temp_image_type === NULL){
            return false;
        }
        switch ($temp_image_type){
            case IMAGETYPE_GIF:
                break;
            case IMAGETYPE_JPEG:
                break;
            case IMAGETYPE_PNG:
                break;
            default:
                return false;
        }
        $tmp = explode('.', $temp_image_name);
        $extension = end($tmp);
        $ra=$this->genRandomString().strtotime(date('m/d/Y h:i:s a', time()));
        $ad=$ra.'.'.$extension;
        $uploaded_image_path ="$this->UPLOADED_IMAGE_DESTINATION/". $ad;
        move_uploaded_file($temp_image_path, $uploaded_image_path);
        /*bu watermark*/
        $this->thumbnail_image_path ="$this->THUMBNAIL_IMAGE_DESTINATION/". preg_replace( '{\\.[^\\.]+$}', '.'.$extension, $ad);
        $this->resized_image_path ="$this->RESIZED_IMAGE_DESTINATION/". preg_replace( '{\\.[^\\.]+$}', '.'.$extension, $ad);
        /*burda edn ele*/

        $result = $this->create_watermark($uploaded_image_path, $this->thumbnail_image_path, 'generate_image_thumbnail');
        $result = $this->create_watermark($uploaded_image_path, $this->resized_image_path, 'generate_image_thumbnail_large');
        $this->name=$ad;

        return $result? array( $uploaded_image_path, $this->thumbnail_image_path): false;
    }
}
