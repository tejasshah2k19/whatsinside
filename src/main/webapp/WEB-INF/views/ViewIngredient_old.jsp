<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Ingredient Details</title>
<!-- Bootstrap 4.5 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">

		<div class="card shadow">
			<div class="card-header bg-primary text-white">
				<h4>Ingredient Details</h4>
			</div>
			<div class="card-body">
				<div class="row mb-3">
					<div
						class="col-md-4 font-weight-bold bg-light text-dark p-2 rounded">Name
						(INS Code):</div>
					<div class="col-md-8   text-dark">${ingredient.name}</div>
				</div>
				<div class="row mb-3">
					<div
						class="col-md-4 font-weight-bold bg-light text-dark p-2 rounded">Scientific
						Name:</div>
					<div class="col-md-8">${ingredient.scientificName}</div>
				</div>

				<div class="row mb-3">
					<div
						class="col-md-4 font-weight-bold bg-light text-dark p-2 rounded">Common
						Usage:</div>
					<div class="col-md-8">${ingredient.commonUsage}</div>
				</div>
				<div class="row mb-3">
					<div
						class="col-md-4 font-weight-bold bg-light text-dark p-2 rounded">Avoided
						By:</div>
					<div class="col-md-8">${ingredient.avoidBy}</div>
				</div>
				<div class="row mb-3">
					<div
						class="col-md-4 font-weight-bold bg-light text-dark p-2 rounded">FDA:</div>
					<div class="col-md-8">${ingredient.fda}</div>
				</div>

				<div class="row mb-3">
					<div
						class="col-md-4 font-weight-bold bg-light text-dark p-2 rounded">FSSAI:</div>
					<div class="col-md-8">${ingredient.fssai}</div>
				</div>

				<div class="row mb-3">
					<div
						class="col-md-4 font-weight-bold bg-light text-dark p-2 rounded">EFSA:</div>
					<div class="col-md-8">${ingredient.efsa}</div>
				</div>
			</div>
			<div class="card-footer text-right">
				<a href="listingredients" class="btn btn-secondary">Back to List</a>
			</div>
		</div>
	</div>


</body>
</html>
