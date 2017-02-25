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
int id=Integer.parseInt(request.getParameter("id"));
CartDAO cartDAO=new CartDAO();
int result=cartDAO.del(id);
if(result>0)
{%>
	<script type="text/javascript">
	alert("The cake had deleted successfully!");
	window.location="CartServlet";
	</script>
<%}
else
{%>
	<script type="text/javascript">
    alert("The Operation is failed!");
    window.location="cart.jsp";
    </script>
<%}%>
</body>
</html>