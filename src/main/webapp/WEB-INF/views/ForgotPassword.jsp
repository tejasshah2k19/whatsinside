<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ForgetPassword</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <h2 class="mb-4 text-center">ForgetPassoword</h2>

            <form action="forgotpassword" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                 <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-primary">Help</button>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="signup">New user? Sign up</a>
                    <a href="login">Existing User?</a>
                </div>

            </form>
            <BR> 
          <span class="text-danger">${error}</span>  
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
