<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ page import="java.util.*" %>
    <%@ page import="mypack.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Cart</title>
<style type="text/css">
   body
{
    background-image:url(background1.jpg); 
   
}
    table
{
     margin:0 auto;
}
td
  {
  padding:20px;
  }

th.item{
color:#984807;
}
p.button{
position:absolute;
left:135px;
top:400px;
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
top:1064px;
}
</style>
<script type="text/javascript" src="js/jquery2.2.3.min.js"></script>
<script type="text/javascript">
var Q="彩条旗2.jpg";
var pic="";
window.onload=function(){
	setInterval("change_image()",300);
	var isloged = $(".zz").attr("id");
	if(isloged!="zz"){
		$("#login").css("visibility","hidden");
		$("#register").css("visibility","hidden");
		$("#logout").css("visibility","visible");
	}

	else{
		$("#login").css("visibility","visible");
		$("#register").css("visibility","visible");
		$("#logout").css("visibility","hidden");
	}
}
function change_image(){
	var image=document.getElementById("Q1");
	p=image.src;
	image.src=Q;
	Q=p;	
}
function del(id){
	var result=confirm("Are you really want to delete this cake?");
	if(result==true)
		{
        	window.location="del.jsp?id="+id;
		}
}
function open_menu(){
        	window.location="main.jsp";
}
function open_logout(){
	window.location="MainServlet";
}
function become_biger(img){
	img.width=180;
	img.height=90;
}
function become_smaller(img){
	img.width=160;
	img.height=80;
}
</script>
</head>
<body>
<center>
<img src="top.jpg" width="810" height="150">
</center>
<center>
<img id="Q1" src="彩条旗1.jpg" width="810" height="130">
</center>
<p class="border1">
<img src="border.jpg" width="22" height="792">
</p>
<p class="border2">
<img src="border.jpg" width="23" height="792">
</p>
<p class="background2">
<img src="background2.jpg" width="670" height="792">
</p>
<p class="bottom">
<img  src="bottom.jpg" width="810" height="130">
</p>
<p style="text-align:center" class="button">
<img src="register.jpg" id="register" onclick="open_register()" width="160" height="80" onmouseover="become_biger(this)" onmouseout="become_smaller(this)"><br>
<img src="login.jpg" id="login" onclick="open_login()" width="160" height="80" onmouseover="become_biger(this)" onmouseout="become_smaller(this)"><br>
<img src="menu.jpg" onclick="open_menu()" width="160" height="80" onmouseover="become_biger(this)" onmouseout="become_smaller(this)"><br>
<img src="logout.jpg" id="logout" onclick="open_logout()" width="160" height="80"onmouseover="become_biger(this)" onmouseout="become_smaller(this)">
</p>
<span id="${un}" class="zz" style="display:none"></span>

<table>
<tr>
<th class="item">Image</th>
<th class="item">Cakename</th>
<th class="item">Price</th>  
<th class="item">Operation</th>
</tr>
<c:forEach var="cart" items="${list}">
  <tr>
      <td><img src="${cart.image}" width="180" height="140"></td>
      <td style="text-align:center;color:#984807">${cart.cakename}</td>
      <td style="text-align:center;color:#984807">${cart.price}</td>
       <td align="center">
       <img src="delete.jpg" width="80" height="80" onclick="del(${cart.id})" >
      </td>
      </tr>
</c:forEach>

</table>

</body>
</html>