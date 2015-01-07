<?php
// router.php
$router_path = pathinfo($_SERVER['REQUEST_URI']);
$router_extension = isset($router_path['extension']) ? $router_path['extension'] : '';
if (preg_match('/(?:png|jpg|jpeg|gif|css|js|woff|ttf|svg|eot)/', $router_extension)) {
  return false;    // serve the requested resource as-is
} else {
  require('index.php');
}
?>
