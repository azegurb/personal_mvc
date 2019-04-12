<?php

include_once(ROOT.DS.'vendor/gmail.'.DS.'gpConfig.php');

global $output;


function wh_log($log_msg)
{
    $log_filename = "log";
    if (!file_exists($log_filename))
    {
        // create directory/folder uploads.
        mkdir($log_filename, 0777, true);
    }
    $log_file_data = $log_filename.'/log_' . date('d-M-Y') . '.log';
    file_put_contents($log_file_data, $log_msg . "\n", FILE_APPEND);
}

function newsGenerator($id=null){

    try {

        $model=new Page('news');

        $page=isset($_GET['page'])?$_GET['page']:1;

        $per_page=6;

        $menus=$model->getNewsList($id, $page, $per_page)->get();

        $count=$model->getNewsList($id)->get();

        $menuStr='<section id="page-content">
    <div class="container">
        <!-- post content -->

        <!-- Page title -->
        <!-- end: Page title -->

        <!-- Blog -->
        <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">';

        foreach ($menus as $menu){

            $menuStr.='<div class="post-item border shadow">
                    <div class="post-item-wrap">
                        <div class="post-image">
                            <a href="/news/inner/'.$menu['id'].'">
                                <img alt="" src="/uploads/news/small_img/'.$menu['news_image'].'" style="height:250px">
                            </a>
                            <span class="post-meta-category">
                                <a href="/news/inner/'.$menu['id'].'">'.$menu['news_category_name'].'</a>
                            </span>
                        </div>
                        <div class="post-item-description">
                            <span class="post-meta-date">
                                <i class="fa fa-calendar-o"></i>'.date("M j, Y", strtotime($menu['created_at'])).'</span>
                            <span class="post-meta-comments">
                                <a href="">
                                    <i class="fa fa-comments-o"></i>33 Comments</a>
                            </span>
                            <h2>
                                <a href="/news/inner/'.$menu['id'].'">'.$menu['title'].'
            </a>
                            </h2>
                            <p>'.$menu['short_name'].'</p>

                            <div class="post-author">
                                <img src="/images/blog/author.jpg">
                                <p>Muellif
                                    <a href="#">'.$menu['editor_name'].'</a> 2 days ago </p>
                            </div>

                        </div>
                    </div>
                </div>';
        }

        $menuStr.='</div>'.paginator(count($count),6).'</div></section>';
        return $menuStr;

    }
    catch (Exception $e) {

        wh_log($e->getMessage());

    }

}

function menuGenerator(){

    try {

        $model=new Menu('main_menu');

        $menus=$model->getMenuList()->where('parent_id', '=', 0);

        $menuStr='';

        foreach ($menus as $menu){

            $sub='';
            $class='';

            if(count($model->getMenuList()->where('parent_id', '=', $menu['id']))>0) {

                $sub = subMenuGenerator($menu['id']);
                $class='class="mega-menu-item"';

            }

            $menuStr.=($menu['main']==='index')?'<li '.$class.'><a href="/">'.$menu['menu_name'].'--</a></li>':($menu['label']=='contents'?'<li '.$class.'><a href="/'.$menu['label'].'/index/'.$menu['id'].'">'.$menu['menu_name'].'</a>'.$sub.'</li>':'<li '.$class.'><a href="/'.$menu['label'].'/index">'.$menu['menu_name'].'</a>'.$sub.'</li>');

        }

//        $menuStr='</ul>';
        return $menuStr;

    }
    catch (Exception $e) {

        wh_log($e->getMessage());

    }

}

function sliderR(){

    $model=new Gallery('gallery');

    $menus=$model->getGallery()->get();

    $menuStr='';
    $menuStr.='<section id="slider"><div id="rev_slider_24_1_wrapper" class="rev_slider_wrapper fullscreen-container" data-alias="website-intro" data-source="gallery"
            style="background:#000000;padding:0px;"><div id="rev_slider_24_1" class="rev_slider fullscreenbanner tiny_bullet_slider" style="display:none;" data-version="5.4.1">';

    $menuStr.=' <ul>';

    foreach ($menus as $m){

        $menuStr.='<li data-index="rs-67" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"
                        data-easein="default" data-easeout="default" data-masterspeed="600" data-thumb="js/plugins/revolution/assets/images/woman2-100x50.jpg"
                        data-rotate="0" data-saveperformance="off" data-title="Slide" data-param1="" data-param2="" data-param3=""
                        data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10=""
                        data-description="" data-slicey_shadow="0px 0px 0px 0px transparent">
                        <!-- MAIN IMAGE -->
                        <img src="/'.$m['name'].'" alt="" data-bgposition="center center" data-kenburns="on" data-duration="5000"
                            data-ease="Power2.easeInOut" data-scalestart="100" data-scaleend="150" data-rotatestart="0" data-rotateend="0"
                            data-blurstart="20" data-blurend="0" data-offsetstart="0 0" data-offsetend="0 0" class="rev-slidebg"
                            data-no-retina>';

        $menuStr.='<div class="tp-caption tp-shape tp-shapewrapper tp-slicey  tp-resizeme" id="slide-67-layer-9" data-x="[\'center\',\'center\',\'center\',\'center\']"
                            data-hoffset="[\'-112\',\'-43\',\'-81\',\'44\']" data-y="[\'middle\',\'middle\',\'middle\',\'middle\']" data-voffset="[\'-219\',\'-184\',\'-185\',\'182\']"
                            data-width="[\'250\',\'250\',\'150\',\'150\']" data-height="[\'150\',\'150\',\'100\',\'100\']" data-whitespace="nowrap"
                            data-type="shape" data-slicey_offset="250" data-slicey_blurstart="0" data-slicey_blurend="20" data-responsive_offset="on"
                            data-frames=\'[{"delay":300,"speed":1000,"frame":"0","from":"rX:0deg;rY:0deg;rZ:0deg;sX:1;sY:1;opacity:0;fb:20px;","to":"o:1;fb:0;","ease":"Power3.easeInOut"},{"delay":"+3700","speed":300,"frame":"999","to":"opacity:0;fb:0;","ease":"Power3.easeInOut"}]\'
                            data-textAlign="[\'inherit\',\'inherit\',\'inherit\',\'inherit\']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                            data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index: 5;background-color:rgba(0, 0, 0, 0.5);">
                        </div>

                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption tp-shape tp-shapewrapper tp-slicey  tp-resizeme" id="slide-67-layer-10" data-x="[\'center\',\'center\',\'center\',\'center\']"
                            data-hoffset="[\'151\',\'228\',\'224\',\'117\']" data-y="[\'middle\',\'middle\',\'middle\',\'middle\']" data-voffset="[\'-212\',\'-159\',\'71\',\'-222\']"
                            data-width="[\'150\',\'150\',\'100\',\'100\']" data-height="[\'200\',\'150\',\'150\',\'150\']" data-whitespace="nowrap"
                            data-type="shape" data-slicey_offset="250" data-slicey_blurstart="0" data-slicey_blurend="20" data-responsive_offset="on"
                            data-frames=\'[{"delay":350,"speed":1000,"frame":"0","from":"sX:1;sY:1;opacity:0;fb:20px;","to":"o:1;fb:0;","ease":"Power3.easeInOut"},{"delay":"+3650","speed":300,"frame":"999","to":"opacity:0;fb:0;","ease":"Power3.easeInOut"}]\'
                            data-textAlign="[\'inherit\',\'inherit\',\'inherit\',\'inherit\']" data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                            data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index: 6;background-color:rgba(0, 0, 0, 0.5);">
                        </div></li>';
    }

    $menuStr.=' </ul></div></div></section>';

    return $menuStr;


}
function vacancyGenerator($id=null){

    try {

        $model=new Vacancy('vacancies');

        $menus=$model->getVacancyList($id)->get();

        $menuStr='';

        if($id==null || $id==''){
            $menuStr='<table class="table">
                <thead>
                <tr>
                    <th>Row</th>
                    <th>Vezife</th>
                    <th>Deportament</th>
                    <th>Etrafli</th>
                </tr>
                </thead>
                <tbody>';

            foreach ($menus as $menu){

                $menuStr.='<tr><td>'.$menu['id'].'</td><td>'.$menu['profession_name'].'</td><td>'.$menu['name'].'</td><td><a href="/vacancies/index/'.$menu['id'].'">Etrafli melumat</a></td></tr>';

            }

            $menuStr.='</tbody></table>';
        }
        else {

            $content=$model->getVacancyInner($id)->get();

            $menuStr.='<div id="blog" class="single-post col-md-10 center">
            <!-- Post single item-->
            <div class="post-item">
                <div class="post-item-wrap">
                <h3>'.Session::flash().'</h3>
                    <div class="post-item-description">
                     '.$content[0]['vacancy_details'].'

                    </div>

                    <div class="respond-form" id="respond">
                        <div class="respond-comment">
                            Muraciet et
                        </div>
                        <form class="form-gray-fields" method="post" enctype="multipart/form-data" action="/vacancies/vacancypost">
                        <input type="hidden" name="id" value="'.$id.'">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="upper" for="name">Name</label>
                                        <input class="form-control required" name="senderName" placeholder="Enter name" id="name" aria-required="true" type="text">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="upper" for="email">Email</label>
                                        <input class="form-control required email" name="senderEmail" placeholder="Enter email" id="email" aria-required="true" type="email">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="upper" for="website">Website</label>
                                        <input class="form-control website" name="senderWebsite" placeholder="Enter Website" id="website" aria-required="false" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="upper" for="comment">Your comment</label>
                                        <textarea class="form-control required" name="comment" rows="9" placeholder="Enter comment" id="comment" aria-required="true"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group text-center">
                                        <input type="file" name="files">
                                        <button class="btn" type="submit">Submit Comment</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- end: Post single item-->
        </div>';
        }

        return $menuStr;

    }
    catch (Exception $e) {

        wh_log($e->getMessage());

    }

}
function subMenuGenerator($id){

    try {

        $model=new Menu('main_menu');

        $menus=$model->getMenuList()->where('parent_id', '=', $id);

        $menuStr='<ul class="dropdown-menu" style="background-image: url(/images/shortcode-megamenu-bg.png);">';
        $menuStr.='<li class="mega-menu-content">';
        $menuStr.='<div class="row">';
        $menuStr.='<div class="col-md-2">';
        $menuStr.='<ul>';

        foreach ($menus as $menu){

            $menuStr.='<li><a href="/'.$menu['label'].'/index/'.$menu['fid'].'">'.$menu['menu_name'].'</a></li>';

        }

        $menuStr.='</ul></div></div></li></ul>';
        return $menuStr;

    }
    catch (Exception $e) {

        wh_log($e->getMessage());

    }

}

function formGenerator(){

    $str='<div class="respond-form" id="respond">
                                <div class="respond-comment">
                                    Muraciet et
                                </div>
                                <form class="form-gray-fields">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="upper" for="name">Name</label>
                                                <input class="form-control required" name="senderName" placeholder="Enter name" id="name" aria-required="true" type="text">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="upper" for="email">Email</label>
                                                <input class="form-control required email" name="senderEmail" placeholder="Enter email" id="email" aria-required="true" type="email">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="upper" for="website">Website</label>
                                                <input class="form-control website" name="senderWebsite" placeholder="Enter Website" id="website" aria-required="false" type="text">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="upper" for="comment">Your comment</label>
                                                <textarea class="form-control required" name="comment" rows="9" placeholder="Enter comment" id="comment" aria-required="true"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group text-center">
                                                <input type="file">
                                                <button class="btn" type="submit">Submit Comment</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>';

    return $str;

}

function loginGenerator($url, $urlfb){

    $str='<div class="row"><div class="col-md-4 col-md-offset-4">
                        <div class="panel "><div class="panel-body"> <h3>Login</h3>
                                <form><div class="form-group"><label class="sr-only">Username or Email</label>
                                        <input type="text" placeholder="Username or Email" class="form-control">

                                    </div>
                                    <div class="form-group m-b-5">
                                        <label class="sr-only">Password</label>
                                        <input type="password" placeholder="Password" class="form-control">
                                    </div>
                                    <div class="form-group form-inline m-b-10 ">

                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox">
                                                <small> Remember me</small>
                                            </label>
                                        </div>
                                        <a class="right" href="#">
                                            <small>Lost your Password?</small>
                                        </a>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-default" type="button">Login</button>
                                        <div class="c-login">
                                            <a href="'.htmlspecialchars($urlfb).'" class="fb">Login with Faccebok </a>
                                            <a href="'.htmlspecialchars($url).'" class="gm">Login with Google </a>
                                            <style>
                                                .c-login {
        text-align: right;
                                                }

                                                .fb {
        color: blue
                                                }

                                                .gm {
        color: red
                                                }

                                                .c-login a {
        display: inherit;
        font-size: 16px;
                                                }
                                            </style>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <p class="small">Don have an account yet?
                            <a href="/register/index">Register New Account</a>
                        </p></div>

                </div>';
    return $str;
}

function contactGenerator(){

    $str='<div class="container" style="margin-top: 20px"><div class="row">
                    <div class="col-md-6">
                        <h3 class="text-uppercase">Get --In Touch</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse condimentum porttitor cursus.
                            Duis nec nulla turpis. Nulla lacinia laoreet odio, non lacinia nisl malesuada vel. Aenean malesuada
                            fermentum bibendum.</p>
                        <div class="m-t-30">
                            <form class="widget-contact-form" id="form-submit" action="/ajaxs/contact" role="form" method="post">
                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label for="name">Name</label>
                                        <input type="text" aria-required="true" name="widget-contact-form-name" class="form-control required name" placeholder="Enter your Name">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label for="email">Email</label>
                                        <input type="email" aria-required="true" name="widget-contact-form-email" class="form-control required email" placeholder="Enter your Email">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label for="subject">Your Subject</label>
                                        <input type="text" name="widget-contact-form-subject" class="form-control required" placeholder="Subject...">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="message">Message</label>
                                    <textarea type="text" name="widget-contact-form-message" rows="5" class="form-control required" placeholder="Enter your Message"></textarea>
                                </div>

                                <div class="form-group">
                   
                                </div>
 <div class="g-recaptcha" data-sitekey="6Ld-G0cUAAAAABv8fcOy5X-4b2vS9wgYT3okFHvF"></div>

                                <button class="btn btn-default" type="submit" id="form-submit">
                                    <i class="fa fa-paper-plane"></i>&nbsp;Send message</button>
                               
      
        <!--    <div class="g-recaptcha" data-sitekey="6LcTSkYUAAAAANgaVZ-8xy6yzyNeWP65CR23DN-H"></div>-->
                            </form>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3 class="text-uppercase">Address &amp; Map</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <strong>Polo, Inc.</strong>
                                    <br> 795 Folsom Ave, Suite 600
                                    <br> San Francisco, CA 94107
                                    <br>
                                    <abbr title="Phone">P:</abbr> (123) 456-7890
                                </address>
                            </div>
                            <div class="col-md-6">
                                <address>
                                    <strong>Polo Office</strong>
                                    <br> 795 Folsom Ave, Suite 600
                                    <br> San Francisco, CA 94107
                                    <br>
                                    <abbr title="Phone">P:</abbr> (123) 456-7890
                                </address>
                            </div>
                        </div>

                        <!-- Google map sensor -->
                    

                    </div>
                </div></div>';

    return $str;
}

function printR($obj){

    echo '<pre>';
    print_r($obj);
    echo '</pre>';
}

function createSelect($data, $name, $selectedid=null, $select='menu_name'){

    $str='<select name="'.$name.'" class="form-control"><option value="0">Secin..</option>';

    foreach ($data as $d){

        if($d['id']==$selectedid){
            $str.='<option selected value="'.$d['id'].'">'.$d[$select].'</option>';
        }
        else {
            $str.='<option value="'.$d['id'].'">'.$d[$select].'</option>';
        }

    }

    $str.='</select>';

    return $str;
}

function newsInnerGenerator($id){

    try {


        $model=new Page('news');

        $menu=$model->getNewsList(null, null, null, $id)->get();

        $menuStr='<section id="page-content">
            <div class="container">
                <div class="row">
                    <!-- content -->
                    <div class="content col-md-9">
                        <!-- Blog -->
                        <div id="blog" class="single-post">
                            <!-- Post single item-->
                            <div class="post-item">
                                <div class="post-item-wrap">
                                    <div class="post-image">
                                        <a href="#">
                                            <img alt="" src="/uploads/news/small_img/'.$menu[0]['news_image'].'" style="height:400px">
                                        </a>
                                    </div>
                                    <div class="post-item-description">
                                        <h2>'.$menu[0]['title'].'</h2>
                                        <div class="post-meta">

                                            <span class="post-meta-date">
                                                <i class="fa fa-calendar-o"></i>'.date("M j, Y", strtotime($menu[0]['created_at'])).'</span>
                                            <span class="post-meta-comments">
                                                <a href="">
                                                    <i class="fa fa-comments-o"></i>33 Comments</a>
                                            </span>
                                            <span class="post-meta-category">
                                                <a href="">
                                                    <i class="fa fa-tag"></i>Lifestyle, Magazine</a>
                                            </span>
                                            <div class="post-meta-share">
                                                <a class="btn btn-xs btn-slide btn-facebook" href="#">
                                                    <i class="fa fa-facebook"></i>
                                                    <span>Facebook</span>
                                                </a>
                                                <a class="btn btn-xs btn-slide btn-twitter" href="#" data-width="100">
                                                    <i class="fa fa-twitter"></i>
                                                    <span>Twitter</span>
                                                </a>
                                                <a class="btn btn-xs btn-slide btn-instagram" href="#" data-width="118">
                                                    <i class="fa fa-instagram"></i>
                                                    <span>Instagram</span>
                                                </a>
                                                <a class="btn btn-xs btn-slide btn-googleplus" href="mailto:#" data-width="80">
                                                    <i class="fa fa-envelope"></i>
                                                    <span>Mail</span>
                                                </a>
                                            </div>
                                        </div>
                                        '.$menu[0]['name'].'

                                    </div>
                                    <div class="post-tags">
                                        <a href="#">Life</a>
                                        <a href="#">Sport</a>
                                        <a href="#">Tech</a>
                                        <a href="#">Travel</a>
                                    </div>
                            
                                    <!-- Comments -->
                                    <div class="comments" id="comments">
                                        <div class="comment_number">
                                            Comments
                                            <span>(2)</span>
                                        </div>
                                        <div class="comment-list">
                                            <!-- Comment -->
                                            <div class="comment" id="comment-1">
                                                <div class="image">
                                                    <img alt="" src="images/blog/author.jpg" class="avatar">
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">John Doe</h5>
                                                    <span class="comment_date">Posted at 15:32h, 06 December</span>
                                                    <a class="comment-reply-link" href="#">Reply</a>
                                                    <div class="text_holder">
                                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting
                                                            industry. Lorem Ipsum has been the industry\'s standard dummy
                                                            text ever since the 1500s, when an unknown printer took a galley
                                                            of type and scrambled it to make a type specimen book. It has
                                                            survived not only five centuries, but also the leap into electronic
                                                            typesetting, remaining essentially unchanged. It was popularised
                                                            in the 1960s with the release of Letraset sheets containing Lorem
                                                            Ipsum passages, and more recently with desktop publishing software
                                                            like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                                    </div>
                                                </div>
                                                <!-- Comment -->
                                                <div class="comment" id="comment-1-1">
                                                    <div class="image">
                                                        <img alt="" src="images/blog/author2.jpg" class="avatar">
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">John Doe</h5>
                                                        <span class="comment_date">Posted at 15:32h, 06 December</span>
                                                        <a class="comment-reply-link" href="#">Reply</a>
                                                        <div class="text_holder">
                                                            <p>It is a long established fact that a reader will be distracted
                                                                by the readable content of a page when looking at its layout.
                                                                The point of using Lorem Ipsum is that it has a more-or-less
                                                                normal </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end: Comment -->
                                                <!-- Comment -->
                                                <div class="comment" id="comment-1-2">
                                                    <div class="image">
                                                        <img alt="" src="images/blog/author3.jpg" class="avatar">
                                                    </div>
                                                    <div class="text">
                                                        <h5 class="name">John Doe</h5>
                                                        <span class="comment_date">Posted at 15:32h, 06 December</span>
                                                        <a class="comment-reply-link" href="#">Reply</a>
                                                        <div class="text_holder">
                                                            <p>There are many variations of passages of Lorem Ipsum available,
                                                                but the majority have suffered alteration in some form, by
                                                                injected humour, or randomised words which don\'t look even
                                                                slightly believable. If you are going to use a passage of
                                                                Lorem Ipsum, you need to be sure there isn\'t anything embarrassing
                                                                hidden in the middle of text. </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end: Comment -->
                                            </div>
                                            <!-- end: Comment -->
                                            <!-- Comment -->
                                            <div class="comment" id="comment-2">
                                                <div class="image">
                                                    <img alt="" src="images/blog/author2.jpg" class="avatar">
                                                </div>
                                                <div class="text">
                                                    <h5 class="name">John Doe</h5>
                                                    <span class="comment_date">Posted at 15:32h, 06 December</span>
                                                    <a class="comment-reply-link" href="#">Reply</a>
                                                    <div class="text_holder">
                                                        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced
                                                            below for those interested. Sections 1.10.32 and 1.10.33 from
                                                            "de Finibus Bonorum et Malorum" by Cicero are also reproduced
                                                            in their exact original form, accompanied by English versions
                                                            from the 1914 translation by H. Rackham.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end: Comment -->
                                        </div>
                                    </div>
                                    <!-- end: Comments -->
                                    <div class="respond-form" id="respond">
                                        <div class="respond-comment">
                                            Şərh yazmaq üçün qeydiyyatdan keçin
                                        </div>
                                        <form class="form-gray-fields">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="upper" for="name">Name</label>
                                                        <input class="form-control required" name="senderName" placeholder="Enter name" id="name" aria-required="true" type="text">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="upper" for="email">Email</label>
                                                        <input class="form-control required email" name="senderEmail" placeholder="Enter email" id="email" aria-required="true" type="email">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label class="upper" for="website">Website</label>
                                                        <input class="form-control website" name="senderWebsite" placeholder="Enter Website" id="website" aria-required="false" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="upper" for="comment">Your comment</label>
                                                        <textarea class="form-control required" name="comment" rows="9" placeholder="Enter comment" id="comment" aria-required="true"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group text-center">
                                                        <button class="btn" type="submit">Submit Comment</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- end: Post single item-->
                        </div>

                    </div>
                    <!-- end: content -->

                    <!-- Sidebar-->
                    <div class="sidebar col-md-3">
                        <div class="pinOnScroll" style="width: 253px; height: 504px;">
                            <!--Tabs with Posts-->
                            <div class="widget">
                                <div id="tabs-01" class="tabs simple">
                                    <ul class="tabs-navigation">
                                        <li class="active">
                                            <a href="#tab1">Popular</a>
                                        </li>
                                     
                                    </ul>
                                    <div class="tabs-content">
                                        <div class="tab-pane active" id="tab1">
                                            <div class="post-thumbnail-list">
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/5.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Suspendisse consectetur fringilla luctus</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 6m ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Technology</span>
                                                    </div>
                                                </div>
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/6.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Consectetur adipiscing elit</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 24h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/7.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 11h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab2">
                                            <div class="post-thumbnail-list">
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/6.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Consectetur adipiscing elit</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 24h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/7.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 11h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/8.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Fringilla luctus Lorem ipsum dolor sit amet</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 11h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab3">
                                            <div class="post-thumbnail-list">
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/7.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 11h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/8.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Fringilla luctus Lorem ipsum dolor sit amet</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 11h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                                <div class="post-thumbnail-entry">
                                                    <img alt="" src="images/blog/thumbnail/6.jpg">
                                                    <div class="post-thumbnail-content">
                                                        <a href="#">Consectetur adipiscing elit</a>
                                                        <span class="post-date">
                                                            <i class="fa fa-clock-o"></i> 24h ago</span>
                                                        <span class="post-category">
                                                            <i class="fa fa-tag"></i> Lifestyle</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End: Tabs with Posts-->

                            <!--widget tags -->
                            <div class="widget  widget-tags">
                                <h4 class="widget-title">Tags</h4>
                                <div class="tags">
                                    <a href="#">Design</a>
                                    <a href="#">Portfolio</a>
                                    <a href="#">Digital</a>
                                    <a href="#">Branding</a>
                                    <a href="#">HTML</a>
                                    <a href="#">Clean</a>
                                    <a href="#">Peace</a>
                                    <a href="#">Love</a>
                                    <a href="#">CSS3</a>
                                    <a href="#">jQuery</a>
                                </div>
                            </div>
                            <!--end: widget tags -->


                        </div>
                    </div>
                    <!-- end: sidebar-->
                </div>
            </div>
        </section>';
        return $menuStr;

    }
    catch (Exception $e) {

        wh_log($e->getMessage());

    }

}

function paginator($datacount, $perpage){

    $countP=ceil($datacount/$perpage);

    $str='<div class="pagination pagination-simple">
            <ul><li>
                    <a href="#" aria-label="Previous">
                            <span aria-hidden="true">
                                <i class="fa fa-angle-left"></i>
                            </span>
                    </a>
                </li>';

    $page=isset($_GET['page'])?$_GET['page']:1;


    if($countP<7){

        for($i=1;$i<=$countP;$i++){
            if($i==$page){
                $str.='<li class="active"><a href="/news/?page='.$page.'">'.$page.'</a></li>';

            }
            else {

                $str.='<li><a href="/news/?page='.$i.'">'.$i.'</a></li>';
            }


        }
        $str.='</ul></div>';
    }

    return $str;
}




