<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OnLine Cake Shop</title>
<style type="text/css">
   body
{
    background-image:url(background1.jpg); 
    background-size:cover;
}
    table
{
     margin:0 auto;
     border-collapse:collapse;
     background:#F5DEB3; 
}
td
  {
  padding:5px;
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
th.item{
color:#984807;
}

</style>
<script type="text/javascript" src="js/jquery2.2.3.min.js"></script>
<script type="text/javascript">
var Q="彩条旗2.jpg";
var pic="";
window.onload=function(){
setInterval("change_image()",300);
var isloged = $(".zz").attr("id");
if(isloged!="zz"&&isloged!=""){
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



function buy(image,cakename,price,id){
   	       window.location="BuyServlet?cakename="+cakename+"&image="+image+"&id="+id+"&price="+price;
		
}

function open_cart(){
	window.location="CartServlet";
}
function open_register(){
	window.location="RegisterPage.jsp";
}
function open_login(){
window.location="LoginPage.jsp";
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
<jsp:useBean id="cakeDAO" class="mypack.CakeDAO" ></jsp:useBean>
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
<p style="text-align:center" class="button">
<img src="register.jpg" id="register" onclick="open_register()" width="160" height="80" onmouseover="become_biger(this)" onmouseout="become_smaller(this)"><br>
<img src="login.jpg" id="login" onclick="open_login()" width="160" height="80" onmouseover="become_biger(this)" onmouseout="become_smaller(this)"><br>
<img src="cart.jpg" onclick="open_cart()" width="160" height="90" onmouseover="become_biger(this)" onmouseout="become_smaller(this)"><br>
<img src="logout.jpg" id="logout" onclick="open_logout()" width="160" height="80" onmouseover="become_biger(this)" onmouseout="become_smaller(this)">
</p>
<span id="${un}" class="zz" style="display:none"></span>


<table>
<tr>
<c:forEach var="cake" items="${cakeDAO.cakes}" varStatus="status">
<c:if test="${status.count<4}">
<td>

<table>
<tr>
<th class="item">Image</th>
<td><img src="${cake.image}" width="120" height="100"></td>
</tr>
<tr>
<th class="item">ID</th>
<td style="text-align:center;color:#984807">${cake.id}</td> 
</tr>
<tr>
<th class="item">Cakename</th>
<td style="text-align:center;color:#984807">${cake.cakename}</td>
</tr>
<tr>
<th class="item">Price</th>
<td style="text-align:center;color:#984807">${cake.price}</td>
</tr>
<tr>
<th class="item">Operation</th>
<td align="center">
<img src="buy.jpg" width="50" height="50" 
onclick="buy('${cake.image}','${cake.cakename}',${cake.price},${cake.id})" >
</td>
</tr>
</table>

</td>
</c:if>
</c:forEach>
</tr>
</table>


<table>
<tr>
<c:forEach var="cake" items="${cakeDAO.cakes}" varStatus="status" begin="3">
<c:if test="${status.count<4}">
<td>


<table>
<tr>
<th class="item">Image</th>
<td><img src="${cake.image}" width="120" height="100"></td>
</tr>
<tr>
<th class="item">ID</th>
<td style="text-align:center;color:#984807">${cake.id}</td> 
</tr>
<tr>
<th class="item">Cakename</th>
<td style="text-align:center;color:#984807">${cake.cakename}</td>
</tr>
<tr>
<th class="item">Price</th>
<td style="text-align:center;color:#984807">${cake.price}</td>
</tr>
<tr>
<th class="item">Operation</th>
<td align="center">
<img src="buy.jpg" width="50" height="50" onclick="buy('${cake.image}','${cake.cakename}',${cake.price},${cake.id})" >
</td>
</tr>
</table>

</td>
</c:if>
</c:forEach>
</tr>
</table>

<table>
<tr>
<c:forEach var="cake" items="${cakeDAO.cakes}" varStatus="status" begin="6">

<td>


<table>
<tr>
<th class="item">Image</th>
<td><img src="${cake.image}" width="120" height="100"></td>
</tr>
<tr>
<th class="item">ID</th>
<td style="text-align:center;color:#984807">${cake.id}</td> 
</tr>
<tr>
<th class="item">Cakename</th>
<td style="text-align:center;color:#984807">${cake.cakename}</td>
</tr>
<tr>
<th class="item">Price</th>
<td style="text-align:center;color:#984807">${cake.price}</td>
</tr>
<tr>
<th class="item">Operation</th>
<td align="center">
<img src="buy.jpg" width="50" height="50" onclick="buy('${cake.image}','${cake.cakename}',${cake.price},${cake.id})" >
</td>
</tr>
</table>

</td>

</c:forEach>
</tr>
</table>

<center>
<img  src="bottom.jpg" width="810" height="130">
</center>
</body>
</html>