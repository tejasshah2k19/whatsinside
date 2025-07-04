<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Focus - Bootstrap Admin Dashboard</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link href="./css/style.css" rel="stylesheet">

</head>

<body class="h-100">
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<h4 class="text-center mb-4">Sign up your account</h4>
									<form action="saveuser" method="post">
										<div class="form-group">
											<label><strong>FirstName</strong></label> <input type="text"
												class="form-control" placeholder="firstname"
												name="firstName">
										</div>

										<div class="form-group">
											<label><strong>LastName</strong></label> <input type="text"
												class="form-control" placeholder="lastname" name="lastName">
										</div>

										<div class="form-group">
											<label class="form-label"><strong>Gender</strong></label><br>
										
											<div class="form-check form-check-inline">
												<input class="" type="radio" name="gender"
													id="genderMale" value="Male"> <label
													class="form-check-label" for="genderMale">Male</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="" type="radio" name="gender"
													id="genderFemale" value="Female"> <label
													class="form-check-label" for="genderFemale">Female</label>
											</div>
											<span class="text-danger">
												${result.getFieldError("gender").getDefaultMessage()}</span>
										</div>


										<div class="form-group">
											<label><strong>Email</strong></label> <input type="email"
												class="form-control" placeholder="hello@example.com"
												name="email">
										</div>
										<div class="form-group">
											<label><strong>Password</strong></label> <input
												type="password" class="form-control" value="Password"
												name="password">
										</div>
										<div class="text-center mt-4">
											<button type="submit" class="btn btn-primary btn-block">Sign
												me up</button>
										</div>
									</form>
									<div class="new-account mt-3">
										<p>
											Already have an account? <a class="text-primary" href="login">Sign
												in</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="./vendor/global/global.min.js"></script>
	<script src="./js/quixnav-init.js"></script>
	<!--endRemoveIf(production)-->
</body>

</html>