<%@page import="com.bean.SearchLogBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.IngredientBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Search Log List</title>
</head>
<body>

	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSidebar.jsp"></jsp:include>



	<%
	List<SearchLogBean> list = (List<SearchLogBean>) request.getAttribute("list");
	%>
	<div class="content-body">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">List Search Log</h4>
						</div>
						<div class="card-body">

							<div class="table-responsive">
								<table class="table table-responsive-sm table-hover">
									<thead class="thead-dark">
										<tr>
											<th>#</th>
											<th>Search Name (INS Code)</th>
											<th>User Name</th>
										</tr>
									</thead>
									<tbody>

										<%
										Iterator<SearchLogBean> it = list.iterator();
										while (it.hasNext()) {

											SearchLogBean ib = it.next();
										%>
										<tr>
											<td><%=ib.getSearchId()%></td>
											<td><%=ib.getName()%></td>
											<td><%=ib.getFirstName()%></td>
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
