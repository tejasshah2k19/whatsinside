<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">

				<h2 class="mb-4 text-center">Sign Up</h2>

				<form action="saveuser" method="post">
					<div class="mb-3">
						<label for="firstName" class="form-label">First Name</label> <input
							type="text" class="form-control" id="firstName" name="firstName">

						<span class="text-danger">
							${result.getFieldError("firstName").getDefaultMessage()} </span>
					</div>

					<div class="mb-3">
						<label for="lastName" class="form-label">Last Name</label> <input
							type="text" class="form-control" id="lastName" name="lastName">
						<span class="text-danger">
							${result.getFieldError("lastName").getDefaultMessage()} </span>
					</div>

					<div class="mb-3">
						<label class="form-label">Gender</label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="genderMale" value="Male"> <label
								class="form-check-label" for="genderMale">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="genderFemale" value="Female"> <label
								class="form-check-label" for="genderFemale">Female</label>
						</div>
						<span class="text-danger">
							${result.getFieldError("gender").getDefaultMessage()}</span>
					</div>

					<div class="mb-3">
						<label for="email" class="form-label">Email Address</label> <input
							type="text" class="form-control" id="email" name="email">
						<span class="text-danger">
							${result.getFieldError("email").getDefaultMessage()} </span>
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password"> <span class="text-danger">

							${result.getFieldError("password").getDefaultMessage()} </span>
					</div>

					<div class="d-grid">
						<button type="submit" class="btn btn-primary">Sign Up</button>
					</div>

					<div class="d-flex justify-content-between">
						<a href="login">Existing user? Sign in</a>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
