<%@page import="java.util.Iterator"%>
<%@page import="com.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List User</h2>

	<%
	List<UserBean> users = (List<UserBean>) request.getAttribute("users");
	Iterator<UserBean> it = users.iterator();
	%>

	<table border="1">
		<thead>
			<tr>
				<th>FirstName</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>
			<%
			while (it.hasNext()) {
				UserBean user = it.next();
			%>
			<tr>
				<td><%=user.getFirstName()%></td>
				<td><%=user.getEmail()%></td>
				<td><a href="deleteuser?userId=<%=user.getUserId()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>

	</table>


</body>
</html>