<?php

include_once('classes.php');
$link=new Link('localhost','root','','sklad');
  if (isset($_GET['delid'])) 
  {
      $link->DeleteItem($_GET['delid']);
  }
?>
