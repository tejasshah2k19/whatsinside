<%@page import="java.util.Iterator"%>
<%@page import="com.bean.IngredientBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Ingredients List</title>
<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>

	<%
	List<IngredientBean> list = (List<IngredientBean>) request.getAttribute("list");
	%>
	<div class="container mt-5">
		<div class="d-flex justify-content-between align-items-center mb-3">
			<h2>Ingredients List</h2>
			<a href="newingredient" class="btn btn-success">+ Add New
				Ingredient</a>
		</div>

		<table class="table table-bordered table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>Name (INS Code)</th>
					<th>Scientific Name</th>
					<th>Common Usage</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				Iterator<IngredientBean> it = list.iterator();
				while (it.hasNext()) {

					IngredientBean ib = it.next();
				%>
				<tr>
					<td><%=ib.getIngredientId()%></td>
					<td><%=ib.getName()%></td>
					<td><%=ib.getScientificName()%></td>
					<td><%=ib.getCommonUsage()%></td>
					<td><a href="viewingredient?ingredientId=<%=ib.getIngredientId()%>">View</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	 
</body>
</html>
