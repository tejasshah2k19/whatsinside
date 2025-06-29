<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pay Now</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .payment-form {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 10px;
            background-color: #fff;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="payment-form">
        <h4 class="text-center mb-4">Pay Now - ₹500</h4>
        <form action="processPayment" method="post">
            <input type="hidden" name="amount" value="500" />

            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" maxlength="16" class="form-control" id="cardNumber" name="cardNumber" placeholder="Enter 16-digit card number" required>
            </div>

            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="password" maxlength="3" class="form-control" id="cvv" name="cvv" placeholder="Enter 3-digit CVV" required>
            </div>

            <div class="form-group">
                <label for="expDate">Expiry Date</label>
                <input type="month" class="form-control" id="expDate" name="expDate" required>
            </div>

            <div class="form-group">
                <label>Amount</label>
                <input type="text" class="form-control" value="₹500" disabled>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Pay ₹500</button>
        </form>
    </div>
</div>

</body>
</html>
