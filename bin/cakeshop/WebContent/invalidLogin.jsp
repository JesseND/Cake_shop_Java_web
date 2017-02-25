<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Invalid Login</title>
<style type="text/css">
  body
{
    background-image:url(background1.jpg); 
    background-size:cover;
}
p.border1{
position:absolute;
left:318px;
top:272px;
}
p.border2{
position:absolute;
right:317px;
top:272px;
}
p.background2{
position:absolute;
left:340px;
top:272px;
z-index:-1;
}
p.bottom{
position:absolute;
left:275px;
top:700px;
}
p.back{
position:absolute;
left:360px;
top:650px;
}

</style>
</head>
<script type="text/javascript">
var Q="彩条旗2.jpg";
var pic="";
window.onload=function(){
	setInterval("change_image()",300);
}
function change_image(){
	var image=document.getElementById("Q1");
	p=image.src;
	image.src=Q;
	Q=p;	
}
function open_register(){
	window.location="RegisterPage.jsp";
	}
function open_login(){
	window.location="LoginPage.jsp";
	}
function become_biger(img){
	img.width=140;
	img.height=45;
}
function become_smaller(img){
	img.width=120;
	img.height=35;
}
</script>
<body>
<center>
<img src="top.jpg" width="810" height="150">
</center>
<center>
<img id="Q1" src="彩条旗1.jpg" width="810" height="130">
</center>
<p class="border1">
<img src="border.jpg" width="22" height="450">
</p>
<p class="border2">
<img src="border.jpg" width="23" height="450">
</p>	
<p class="background2">
<img src="background2.jpg" width="670" height="450">
</p>
<p class="bottom">
<img  src="bottom.jpg" width="810" height="130">
</p>
<center style="margin-top:120px;color:#984807">
Sorry, you are not a registered user! Please sign up first!<br>
<img src="go_to_register.jpg" width="120" height="35" onclick="open_register()" style="margin-top:24px" onmouseover="become_biger(this)" onmouseout="become_smaller(this)">
</center>
<p style="text-align:center" class="back">
<img src="back.jpg" onclick="open_login()" width="40" height="40">
</p>
</body>
</html>