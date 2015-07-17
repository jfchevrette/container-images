<?php
function rgbcode($id){
  return '#'.substr(md5($id), 0, 6);
}
$color = rgbcode(gethostname());
?>
<h3>Hello World!</h3>
<h4>My hostname is: <span style="color:<?php echo $color ?>"><?php echo  gethostname(); ?></span></h4>
