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

h1, h2, h3, h4 {color: #<?php echo $sugar_config['colourselector']['pageheader']; ?>;}

.dashletPanel .h3Row {

background: #<?php echo $sugar_config['colourselector']['dashlet']; ?>;

}

/* Top navigation CSS */

#moduleList ul li a:link {
background:none;
color:#<?php echo $sugar_config['colourselector']['modlink']; ?>;
}

#moduleList ul li a:visited {
background:none;
color:#<?php echo $sugar_config['colourselector']['modlinkvisited']; ?>;
}

#moduleList ul li:hover {
background:#<?php echo $sugar_config['colourselector']['modlisthover']; ?>;
}

#moduleList ul li a:hover {
background:none;
color:#<?php echo $sugar_config['colourselector']['modlinkhover']; ?>;
}

#moduleList ul li ul.cssmenu {
background:#<?php echo $sugar_config['colourselector']['cssmenu']; ?>;
}

#moduleList ul li ul.cssmenu li a {
color:#<?php echo $sugar_config['colourselector']['cssmenulink']; ?>;
}

<?php echo $sugar_config['colourselector']['custom']; ?>