<?php


require_once __DIR__ . '/facebook-php-sdk/autoload.php';
use Facebook\Facebook;
use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;

//    require_once 'User.php';
class fbook {


// Include required libraries

    /*
     * Configuration and setup Facebook SDK
     */

    public function output()
    {
        $appId 			= '169409863782370'; //Facebook App ID
        $appSecret 		= 'a7f8dc3b45c491453d49a796bddcc539'; //Facebook App Secret
        $redirectURL 	= 'http://loginfb.mm'; //Callback URL
        $fbPermissions 	= array('email');  //Optional permissions

        $fb = new Facebook(array(
            'app_id' => $appId,
            'app_secret' => $appSecret,
            'default_graph_version' => 'v2.2',
        ));

// Get redirect login helper
        $helper = $fb->getRedirectLoginHelper();

// Try to get access token
        try {
            if(isset($_SESSION['facebook_access_token'])){
                $accessToken = $_SESSION['facebook_access_token'];
            }else{
                $accessToken = $helper->getAccessToken();
            }
        } catch(FacebookResponseException $e) {
            echo 'Graph returned an error: ' . $e->getMessage();
            exit;
        } catch(FacebookSDKException $e) {
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            exit;
        }
        if(isset($accessToken)){
            if(isset($_SESSION['facebook_access_token'])){
                $fb->setDefaultAccessToken($_SESSION['facebook_access_token']);
            }else{
                // Put short-lived access token in session
                $_SESSION['facebook_access_token'] = (string) $accessToken;

                // OAuth 2.0 client handler helps to manage access tokens
                $oAuth2Client = $fb->getOAuth2Client();

                // Exchanges a short-lived access token for a long-lived one
                $longLivedAccessToken = $oAuth2Client->getLongLivedAccessToken($_SESSION['facebook_access_token']);
                $_SESSION['facebook_access_token'] = (string) $longLivedAccessToken;

                // Set default access token to be used in script
                $fb->setDefaultAccessToken($_SESSION['facebook_access_token']);
            }

            // Redirect the user back to the same page if url has "code" parameter in query string
            if(isset($_GET['code'])){
                header('Location: ./');
            }

            // Getting user facebook profile info
            try {
                $profileRequest = $fb->get('/me?fields=name,first_name,last_name,email,link,gender,locale,picture');
                $fbUserProfile = $profileRequest->getGraphNode()->asArray();
            } catch(FacebookResponseException $e) {
                echo 'Graph returned an error: ' . $e->getMessage();
                session_destroy();
                // Redirect user back to app login page
                header("Location: ./");
                exit;
            } catch(FacebookSDKException $e) {
                echo 'Facebook SDK returned an error: ' . $e->getMessage();
                exit;
            }

            // Initialize User class
            $user = new User();

            // Insert or update user data to the database
            $fbUserData = array(
                'oauth_provider'=> 'facebook',
                'oauth_uid' 	=> $fbUserProfile['id'],
                'first_name' 	=> $fbUserProfile['first_name'],
                'last_name' 	=> $fbUserProfile['last_name'],
                'email' 		=> $fbUserProfile['email'],
                'gender' 		=> $fbUserProfile['gender'],
                'locale' 		=> $fbUserProfile['locale'],
                'picture' 		=> $fbUserProfile['picture']['url'],
                'link' 			=> $fbUserProfile['link']
            );
            $userData = $user->checkUser($fbUserData);

            // Put user data into session
            $_SESSION['userData'] = $userData;

            // Get logout url
            $logoutURL = $helper->getLogoutUrl($accessToken, $redirectURL.'logout.php');

            // Render facebook profile data
            if(!empty($userData)){
                $output  = '<h1>Facebook Profile Details </h1>';
                $output .= '<img src="'.$userData['picture'].'">';
                $output .= '<br/>Facebook ID : ' . $userData['oauth_uid'];
                $output .= '<br/>Name : ' . $userData['first_name'].' '.$userData['last_name'];
                $output .= '<br/>Email : ' . $userData['email'];
                $output .= '<br/>Gender : ' . $userData['gender'];
                $output .= '<br/>Locale : ' . $userData['locale'];
                $output .= '<br/>Logged in with : Facebook';
                $output .= '<br/><a href="'.$userData['link'].'" target="_blank">Click to Visit Facebook Page</a>';
                $output .= '<br/>Logout from <a href="'.$logoutURL.'">Facebook</a>';
            }else{
                $output = '<h3 style="color:red">Some problem occurred, please try again.</h3>';
            }

        }else{
            // Get login url
            $loginURL = $helper->getLoginUrl($redirectURL, $fbPermissions);

            // Render facebook login button
            $output = '<a href="'.htmlspecialchars($loginURL).'"><img src="images/fblogin-btn.png"></a>';
        }

        return $loginURL;
    }

}





?>