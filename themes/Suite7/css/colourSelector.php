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

#header {
    background: #<?php echo $sugar_config['colourselector']['navbar']; ?>;
}

h1, h2, h3, h4, .home_h2 {color: #<?php echo $sugar_config['colourselector']['pageheader']; ?>;}

input[type=button],
input[type=submit],
input[type=reset],
.button {
background: #<?php echo $sugar_config['colourselector']['button1']; ?>; /* Old browsers */
}

input[type=button]:hover,
input[type=submit]:hover,
input[type=reset]:hover {
filter:none !important;
background: #<?php echo $sugar_config['colourselector']['buttonhover']; ?>;
}

.dashletPanel .h3Row {

background: #<?php echo $sugar_config['colourselector']['dashlet']; ?>;

}

/* Top navigation CSS */

#moduleList ul li a:link {
background:none;
color:#<?php echo $sugar_config['colourselector']['navbarfont']; ?>;
}

#moduleList ul li a:hover {
background:none;
color:#<?php echo $sugar_config['colourselector']['navbarlinkhover']; ?>;
}

#moduleList ul li:hover {
background:#<?php echo $sugar_config['colourselector']['navbarlihover']; ?>;
}

#moduleList ul li a:hover {
background:none;
color:#<?php echo $sugar_config['colourselector']['navbaralinkhover']; ?>;
}

#moduleList ul li ul.cssmenu {
background:#<?php echo $sugar_config['colourselector']['dropdownmenu']; ?>;
}

#moduleList ul li ul.cssmenu li a {
color:#<?php echo $sugar_config['colourselector']['dropdownmenulink']; ?>;
}

<?php echo $sugar_config['colourselector']['custom']; ?>