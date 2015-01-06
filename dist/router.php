<?php
// router.php
$path = pathinfo($_SERVER['REQUEST_URI']);
if (preg_match('/(?:png|jpg|jpeg|gif|css|js|woff|ttf|svg|eot)/', $path['extension'])) {
  return false;    // serve the requested resource as-is
} else {
  require('index.php');
}
?>
