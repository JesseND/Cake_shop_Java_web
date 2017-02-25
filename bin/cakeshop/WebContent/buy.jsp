<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mypack.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=session.getAttribute("un").toString();
String image=request.getParameter("image");
String cakename=request.getParameter("cakename");
int price=Integer.parseInt(request.getParameter("price"));
CakeDAO cakeDAO=new CakeDAO();
int result=cakeDAO.buy(email,image,cakename,price);
if(result>0)
{%>
	<script type="text/javascript">
	alert("The cake is adding successfully!");
	window.location="main.jsp";
	</script>
<%}
else
{%>
	<script type="text/javascript">
    alert("The Operation is failed!");
    window.location="main.jsp";
    </script>
<%}%>
</body>
</html>