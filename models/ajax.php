<?php

class Ajax extends Model
{

    private $THUMBNAIL_IMAGE_MAX_WIDTH = '300';

    private $THUMBNAIL_IMAGE_MAX_HEIGHT = '300';

    public $UPLOADED_IMAGE_DESTINATION = "boyuk";

    public $THUMBNAIL_IMAGE_DESTINATION = "balaca";

    public $upload_image_path;

    public $name;

    public $large_name;

    public $source_width;

    public $source_height;

    public function save($data)
    {

        $ptype = $this->db->escape($data['ptype']);

        $name = $this->db->escape($data['name']);

        $sname = $this->db->escape($data['sname']);

        $fname = $this->db->escape($data['fname']);

        $company = $this->db->escape($data['company']);

        $area = $this->db->escape($data['area']);

        $login = $this->db->escape($data['login']);

        $password = $this->db->escape($data['password']);

        $email = $this->db->escape($data['email']);

        $phone = $this->db->escape($data['phone']);

        $address = $this->db->escape($data['address']);

        $contactperson = $this->db->escape($data['contactperson']);

        $webpage = $this->db->escape($data['webpage']);

        $rules = $this->db->escape($data['rules']);

        $capca = $this->db->escape($data['capca']);

        $m = array();

        $say = $this->db->nrows("Select * from qeydiyyat where email='{$email}'");

        if ($say > 0) {

            $m['message'] = 'Bu email-den artiq istifade edilmişdir';
            $m['xeta'] = true;

        } else {

            if (!$id && $capca == $_SESSION['random_number']) {

                $sql = "insert into qeydiyyat
							
									set ptype='{$ptype}', name='{$name}', sname='{$sname}', fname='{$fname}', company='{$company}',	area='{$area}', login='{$login}', password='{$password}', email='{$email}',
										
										phone='{$phone}', address='{$address}', contactperson='{$contactperson}', webpage='{$webpage}', rules='{$rules}', buyerseller='{$buyerseller}'";

                $res = $this->db->query1($sql);


            } else {


            }

            if ($res && $capca == $_SESSION['random_number']) {

                $m['message'] = 'Sizin qeydiyyat müvəffəqiyyətlə yerinə yetirilmişdir, portaldan istifadə edə bilərsiniz';

                $m['sessiya'] = $_SESSION['random_number'];

                $headers = "From: info@azagromarket.az\r\n";
                $headers .= "MIME-Version: 1.0\r\n";

                $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

                mail($email, "www.azagromarket.az", "Təbriklər, Siz qeydiyyatdan keçdiniz!, Sizin şifrə" . $password . " -dir", $headers, "info@azagromarket.az");

            } else {

                $m['message'] = 'Xeta bas verdi';

                $m['sessiya'] = 'Kod duzgun deyil';

            }


        }


        echo json_encode($m);


    }

    /*sekil ucun */
    public function genRandomString()
    {

        $length = 8;

        $characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWZYZ";

        $real_string_length = strlen($characters);

        $string = "id";

        for ($p = 0; $p < $length; $p++) {
            $string .= $characters[mt_rand(0, $real_string_length - 1)];
        }

        return strtolower($string);
    }

    function generate_image_thumbnail($source_image_path, $thumbnail_image_path)
    {

        list($source_image_width, $source_image_height, $source_image_type) = getimagesize($source_image_path);

        switch ($source_image_type) {

            case IMAGETYPE_GIF:
                $source_gd_image = imagecreatefromgif($source_image_path);
                break;

            case IMAGETYPE_JPEG:
                $source_gd_image = imagecreatefromjpeg($source_image_path);
                break;

            case IMAGETYPE_PNG:
                $source_gd_image = imagecreatefrompng($source_image_path);
                break;
        }

        if ($source_gd_image === false) {
            return false;
        }

        $thumbnail_image_width = $this->THUMBNAIL_IMAGE_MAX_WIDTH;
        $new_w = $thumbnail_image_width;
        $thumbnail_image_height = $this->THUMBNAIL_IMAGE_MAX_HEIGHT;
        $new_h = $thumbnail_image_height;
        $orig_w = $source_image_width;
        $orig_h = $source_image_height;
        $w_ratio = ($new_w / $orig_w);
        $h_ratio = ($new_h / $orig_h);

        $source_aspect_ratio = $source_image_width / $source_image_height;
        $thumbnail_aspect_ratio = $thumbnail_image_width / $thumbnail_image_height;

        if ($source_image_width <= $thumbnail_image_width && $source_image_height <= $thumbnail_image_height) {
            $thumbnail_image_width = $source_image_width;
            $thumbnail_image_height = $source_image_height;
        } else if ($source_image_width > $source_image_height) {

            $crop_w = round($source_image_width * $h_ratio);
            $crop_h = $new_h;
            $src_x = ceil(($orig_w - $orig_h) / 2);
            $src_y = 0;


        } elseif ($orig_w < $orig_h) {//portrait
            $crop_h = round($orig_h * $w_ratio);
            $crop_w = $new_w;
            $src_x = 0;
            $src_y = ceil(($orig_h - $orig_w) / 2);
        } else {//square
            $crop_w = $new_w;
            $crop_h = $new_h;
            $src_x = 0;
            $src_y = 0;
        }


        $this->source_height = $thumbnail_image_height;

        $this->source_width = $thumbnail_image_width;

        $thumbnail_gd_image = imagecreatetruecolor($thumbnail_image_width, $thumbnail_image_height);


        imagecopyresampled($thumbnail_gd_image, $source_gd_image, 0, 0, $src_x, $src_y, $crop_w, $crop_h, $source_image_width, $source_image_height);

        switch ($source_image_type) {

            case IMAGETYPE_GIF:

                imagegif($thumbnail_gd_image, $thumbnail_image_path, 90);
                break;

            case IMAGETYPE_JPEG:
                imagejpeg($thumbnail_gd_image, $thumbnail_image_path, 90);
                break;

            case IMAGETYPE_PNG:
                imagepng($thumbnail_gd_image, $thumbnail_image_path, 0);
                break;

        }

        imagedestroy($source_gd_image);

        return $thumbnail_gd_image;

    }

    public function create_watermark($source_file_path, $output_file_path)
    {

        $nn = $this->generate_image_thumbnail($source_file_path, $output_file_path);

        $source_gd_image = $nn;

        $source_width = $this->source_width;

        $source_height = $this->source_height;

        $overlay_gd_image = imagecreatefrompng(WATERMARK_OVERLAY_IMAGE);

        $overlay_width = imagesx($overlay_gd_image);

        $overlay_height = imagesy($overlay_gd_image);

        $watermark_left = ($source_width / 2) - (206 / 2); //watermark left

        $watermark_bottom = ($source_height / 2) - (44 / 2); //watermark bottom

        imagecopy($source_gd_image, $overlay_gd_image, $watermark_left, $watermark_bottom, 0, 0, 206, 44); //merge image

        imagejpeg($source_gd_image, $output_file_path, WATERMARK_OUTPUT_QUALITY);

        imagedestroy($source_gd_image);

        imagedestroy($overlay_gd_image);

    }

    function process_image_upload($field, $temp)
    {

        $temp_image_path = $temp;

        $temp_image_name = $field;

        $bul = $temp_image_name;

        $bulunacak = array('ç', 'Ç', 'ý', 'Ý', 'ð', 'Ð', 'ü', 'ö', 'Þ', 'þ', 'Ö', 'Ü', ',', ' ', '(', ')', '[', ']');

        $degistir = array('c', 'C', 'i', 'I', 'g', 'r', '', 'ts', 'yu', 'Yu', 'Ts', '', '', '_', '', '', '', '');

        $temp_image_name = str_replace($bulunacak, $degistir, $bul);

        list(, , $temp_image_type) = getimagesize($temp_image_path);

        if ($temp_image_type === NULL) {

            return false;

        }

        switch ($temp_image_type) {

            case IMAGETYPE_GIF:
                break;

            case IMAGETYPE_JPEG:
                break;

            case IMAGETYPE_PNG:
                break;

            default:
                return false;

        }

        $extension = end(explode('.', $temp_image_name));

        $ra = $this->genRandomString() . strtotime(date('m/d/Y h:i:s a', time()));

        $ad = $ra . '.' . $extension;

        $uploaded_image_path = "$this->UPLOADED_IMAGE_DESTINATION/" . $ad;

        move_uploaded_file($temp_image_path, $uploaded_image_path);

        $this->thumbnail_image_path = "$this->THUMBNAIL_IMAGE_DESTINATION/" . preg_replace('{\\.[^\\.]+$}', '.jpg', $ad);

        $result = $this->create_watermark($uploaded_image_path, $this->thumbnail_image_path);

        $this->name = 'balaca/' . $ad;

        $this->large = 'boyuk/' . $ad;

        return $result ? array($uploaded_image_path, $this->thumbnail_image_path) : false;

    }

    public function saveelan($data)
    {

        $cid = $this->db->escape($data['cat']);
        $sid = $this->db->escape($data['subcat']);
        $ssid = $this->db->escape($data['ssid']);
        $namen = $this->db->escape($data['namen']);
        $source = $this->db->escape($data['source']);
        $price = $this->db->escape($data['price']);
        $login = $this->db->escape($data['login']);
        $amount = $this->db->escape($data['amount']);
        $vahid = $this->db->escape($data['vahid']);
        $diri = $this->db->escape($data['diri']);
        $cins = $this->db->escape($data['cins']);
        $fatty = $this->db->escape($data['fatty']);
        $age = $this->db->escape($data['age']);
        $pro = $this->db->escape($data['pro']);
        $qeyd = $this->db->escape($data['qeyd']);
        $deliver = $this->db->escape($data['deliver']);

        $tarix = date("Y-m-d");

        if (!$id) {

            $sql = "insert into elan
					
							set cid='{$cid}', sid='{$sid}', ssid='{$ssid}', name='{$namen}', price='{$price}',	amount='{$amount}', vahid='{$vahid}', diri='{$diri}', fatty='{$fatty}', cins='{$cins}',
								
								age='{$age}', pro='{$pro}', source='{$source}', deliver='{$deliver}', pic='', tarix='{$tarix}', qeyd='{$qeyd}', active='passive'";

            $res = $this->db->query1($sql);

            $lastid = $this->db->connection->insert_id;

            if (count($_FILES["files"]) > 0) {

                foreach ($_FILES["files"]['name'] as $key => $val) {

                    $file_name = $_FILES['files']['name'][$key];

                    $file_tmp = $_FILES['files']['tmp_name'][$key];

                    if ($_FILES['files']['name'][$key] != "") {

                        $this->process_image_upload($file_name, $file_tmp);

                        $sek = $this->name;

                        $sek_large = $this->large;

                        $sor = $this->db->query1("Insert into pic values('', '$lastid', '$sek', '$sek_large')");

                    }

                }

            }


        } else {


        }


        $m = array();

        if ($res) {

            $m['message'] = $data;

            $m['sessiya'] = $_SESSION['random_number'];

        } else {

            $m['message'] = 'Xeta bas verdi';

            $m['sessiya'] = 'Kod duzgun deyil';

        }


        echo json_encode($m);


    }

    public function savepic($data, $text)
    {


        $sql = "insert into gallery set  name='{$data}', text='{$text}'";

        $this->db->query($sql);


    }

}