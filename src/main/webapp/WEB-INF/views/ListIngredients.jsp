<%@page import="java.util.Iterator"%>
<%@page import="com.bean.IngredientBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Ingredients List</title>
</head>
<body>

	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSidebar.jsp"></jsp:include>



	<%
	List<IngredientBean> list = (List<IngredientBean>) request.getAttribute("list");
	%>
	<div class="content-body">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">List Ingredients</h4>
						</div>
						<div class="card-body">

							<div class="table-responsive">
								<table class="table table-responsive-sm table-hover">
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
											<td><a
												href="viewingredient?ingredientId=<%=ib.getIngredientId()%>">View</a></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


 





	<jsp:include page="AdminFooter.jsp"></jsp:include>
</body>
</html>
