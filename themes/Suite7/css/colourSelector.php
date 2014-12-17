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

/* Header CSS */

h1, h2, h3, h4, .home_h2 {color: #<?php echo $sugar_config['colourselector']['pageheader']; ?>;}

#header {
background: #<?php echo $sugar_config['colourselector']['navbar']; ?>;
border-bottom:2px solid #<?php echo $sugar_config['colourselector']['pagelink']; ?>;
}

/* Pagelink CSS */

a, a:link, a:visited {
color: #<?php echo $sugar_config['colourselector']['pagelink']; ?>;
}

/* Dashlet CSS */

.dashletPanel .h3Row {

background: #<?php echo $sugar_config['colourselector']['dashlet']; ?>;

}

/* Top navigation bar CSS */

#moduleList ul li a:link {
background:none;
color:#<?php echo $sugar_config['colourselector']['navbarfont']; ?>;
}

#moduleList ul li a:hover {
background:none;
color:#<?php echo $sugar_config['colourselector']['navbarlinkhover']; ?>;
}

#moduleList ul li:hover, ul#drop-nav li:hover, #quick-nav li:hover {
background:#<?php echo $sugar_config['colourselector']['navbarlihover']; ?>;
}

/* Dropdown menu CSS */

#moduleList ul li ul.cssmenu, #drop-nav ul, #quick-nav ul{
background:#<?php echo $sugar_config['colourselector']['dropdownmenu']; ?>;
}

#moduleList ul li ul.cssmenu li a, ul#drop-nav li a, ul#quick-nav li a {
color:#<?php echo $sugar_config['colourselector']['dropdownmenulink']; ?>;
}

/* Button and action menu CSS */

input[type=button],
input[type=submit],
input[type=reset],
.button,
a#create_link.utilsLink{
background: #<?php echo $sugar_config['colourselector']['button1']; ?>; /* Old browsers */
}

input[type=button]:hover,
input[type=submit]:hover,
input[type=reset]:hover,
.button:hover,
a#create_link.utilsLink:hover,
#globalLinksModule ul.clickMenu.SugarActionMenu li a:hover,
#globalLinksModule ul.clickMenu li:hover span,
ul.SugarActionMenuIESub li a:hover, ul.clickMenu.SugarActionMenu li a:hover, ul.clickMenu.SugarActionMenu li span.subhover:hover,
ul#globalLinksSubnav li a:hover, ul#quickCreateULSubnav li a:hover,
ul.clickMenu li ul.subnav li a:hover,ul.clickMenu li ul.subnav li input:hover, ul.clickMenu.subpanel.records li ul.subnav li a:hover, ul.clickMenu ul.subnav-sub li a:hover{
filter:none !important;
background: #<?php echo $sugar_config['colourselector']['buttonhover']; ?>;
}