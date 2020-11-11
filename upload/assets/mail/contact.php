<?php

if(!$_POST) exit;

// Email verification, do not edit.
function isEmail($visitor_email ) {
	return(preg_match("/^[-_.[:alnum:]]+@((([[:alnum:]]|[[:alnum:]][[:alnum:]-]*[[:alnum:]])\.)+(ad|ae|aero|af|ag|ai|al|am|an|ao|aq|ar|arpa|as|at|au|aw|az|ba|bb|bd|be|bf|bg|bh|bi|biz|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|com|coop|cr|cs|cu|cv|cx|cy|cz|de|dj|dk|dm|do|dz|ec|edu|ee|eg|eh|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gh|gi|gl|gm|gn|gov|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|in|info|int|io|iq|ir|is|it|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mg|mh|mil|mk|ml|mm|mn|mo|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|name|nc|ne|net|nf|ng|ni|nl|no|np|nr|nt|nu|nz|om|org|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|pro|ps|pt|pw|py|qa|re|ro|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|su|sv|sy|sz|tc|td|tf|tg|th|tj|tk|tm|tn|to|tp|tr|tt|tv|tw|tz|ua|ug|uk|um|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|yu|za|zm|zw)$|(([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5])\.){3}([0-9][0-9]?|[0-1][0-9][0-9]|[2][0-4][0-9]|[2][5][0-5]))$/i",$visitor_email ));
}

if (!defined("PHP_EOL")) define("PHP_EOL", "\r\n");

$visitor_name     = $_POST['visitor_name'];
$visitor_email    = $_POST['visitor_email'];
$visitor_phone    = $_POST['visitor_phone'];
$visitor_comment  = $_POST['visitor_comment'];

if(trim($visitor_name) == '') {
	echo '<div class="error_message">You must enter your Name.</div>';
	exit();
} else if(trim($visitor_email) == '') {
	echo '<div class="error_message">Please enter a valid email address.</div>';
	exit();
} else if(!isEmail($visitor_email)) {
	echo '<div class="error_message">You have enter an invalid e-mail address, try again.</div>';
	exit();
	} else if(trim($visitor_phone) == '') {
	echo '<div class="error_message">Please enter a valid phone number.</div>';
	exit();
} else if(!is_numeric($visitor_phone)) {
	echo '<div class="error_message">Phone number can only contain numbers.</div>';
	exit();
} else if(trim($visitor_comment) == '') {
	echo '<div class="error_message">Please enter your message.</div>';
	exit();
}

if(get_magic_quotes_gpc()) {
	$visitor_comment = stripslashes($visitor_comment);
}


//$address = "HERE your email address";
$address = "arefin2k@gmail.com";


// Below the subject of the email
$e_subject = 'Your Website - Contact Form Email by ' . $visitor_name;

// You can change this if you feel that you need to.
$e_body = "Sender Name:" . PHP_EOL . $visitor_name . PHP_EOL . PHP_EOL;
$e_body .= "Sender Email:" . PHP_EOL . $visitor_email . PHP_EOL . PHP_EOL;
$e_body .= "Sender Phone:" . PHP_EOL . $visitor_phone . PHP_EOL . PHP_EOL;
$e_body .= "Sender Comment:" . PHP_EOL . $visitor_comment . PHP_EOL . PHP_EOL;

$msg = wordwrap($e_body, 70);

$headers = "From: $visitor_email" . PHP_EOL;
$headers .= "Reply-To: $visitor_email" . PHP_EOL;
$headers .= "MIME-Version: 1.0" . PHP_EOL;
$headers .= "Content-type: text/plain; charset=utf-8" . PHP_EOL;
$headers .= "Content-Transfer-Encoding: quoted-printable" . PHP_EOL;

// Back Email to User:

// $user = "$email_contact";
// $usersubject = "Thank You";
// $userheaders = "From: arefin2k@gmail.com\n";
// $userheaders .= "MIME-Version: 1.0" . PHP_EOL;
// $userheaders .= "Content-type: text/plain; charset=utf-8" . PHP_EOL;
// $userheaders .= "Content-Transfer-Encoding: quoted-printable" . PHP_EOL;
// $usermessage = "Thank you for contacting us. We will reply shortly!";
// mail($user,$usersubject,$usermessage,$userheaders);

if(mail($address, $e_subject, $msg, $headers)) {

	// Success message
	echo "<div id='success_page' style='padding:20px 0;color:green;font-size:14px;'>";
	echo "<strong>Email is sent successfully!</strong><br>";
	echo "Thank you <strong>$visitor_name</strong>. Your message has been submitted. We will contact you shortly.";
	echo "</div>";

} else {

	echo 'ERROR!';

}
