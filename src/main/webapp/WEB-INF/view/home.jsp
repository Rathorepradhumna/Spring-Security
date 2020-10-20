<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to home page</title>
</head>
<body>
	<h3>	Hey !! You are on home page.</h3>
	<p>
		User : <security:authentication property="principal.username"/>
		<br><br>
		Role : <security:authentication property="principal.authorities"/>
	</p>
	<security:authorize access="hasRole('MANAGER')">
	<p>
		<a href="${pageContext.request.contextPath}/leaders">LeaderShip Metting</a>
		(Only for managers)
	</p>	
	</security:authorize>
	
	<security:authorize access="hasRole('ADMIN')">
	<p>
		<a href="${pageContext.request.contextPath}/systems">IT system Metting</a>
		(Only for admin)
	</p>	
	</security:authorize>
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout"/>
	
	</form:form>
</body>
</html>