<?php

// config|_override.php
if(is_file('../../../config.php')) {
    require_once('../../../config.php'); // provides $sugar_config
}

// load up the config_override.php file.  This is used to provide default user settings
if(is_file('../../../config_override.php')) {
    require_once('../../../config_override.php');
}

if(!isset($sugar_config['colourselector'])) return;

//set file type back to css from php
header("Content-type: text/css; charset: UTF-8");

?>

/*custom colour css*/

h1, h2, h3, h4, .home_h2 {color: #<?php echo $sugar_config['colourselector']['pageheader']; ?>;}

.dashletPanel .h3Row{

background: #<?php echo $sugar_config['colourselector']['dashlet']; ?>;

}

/* Top navigation CSS */

.navbar-inverse {
    background:#<?php echo $sugar_config['colourselector']['navbar']; ?>;
}

#headerlinks a:link, #headerlinks a:visited {
background:none;
color:#<?php echo $sugar_config['colourselector']['navbarlink']; ?>;
}

ul#topnav li:hover, .dropdown-menu li a:hover, li#usermenu:hover  {
background:#<?php echo $sugar_config['colourselector']['navbarlihover']; ?>;
}

ul#topnav li a:hover{
color:#<?php echo $sugar_config['colourselector']['navbaralinkhover']; ?>;
}

.dropdown-menu {
background:#<?php echo $sugar_config['colourselector']['dropdownmenu']; ?>;
}

.dropdown-menu li a {
color:#<?php echo $sugar_config['colourselector']['dropdownmenulink']; ?>;
}

.btn, .btn-success, .btn-primary, .button, input[type=submit], input[type=button] {
    background:#<?php echo $sugar_config['colourselector']['button']; ?>;
}

.btn:hover, .btn-success:hover, .btn-primary:hover, .button:hover, input[type=submit]:hover, input[type=button]:hover {
    background:#<?php echo $sugar_config['colourselector']['buttonhover']; ?>;
}

<?php echo $sugar_config['colourselector']['custom']; ?>