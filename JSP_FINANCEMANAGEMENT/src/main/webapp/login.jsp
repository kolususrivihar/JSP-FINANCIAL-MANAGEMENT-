<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fintrack | User Sign In</title>
<style>
    /* 1. Global/Reset Styles */
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f0f2f5; /* Light background for the overall page */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    /* 2. Main Container (Split Screen) */
    .auth-container {
        display: flex;
        max-width: 900px;
        width: 90%;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        overflow: hidden; /* Ensures contents stay within rounded corners */
    }

    /* 3. Promotional Panel (Dark Red Side) */
    .promo-panel {
        flex: 1;
        background-color: #791c28; /* Deep red color from design screenshots */
        color: white;
        padding: 50px 30px;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .promo-panel h1 {
        font-size: 32px;
        margin-bottom: 20px;
    }
    .btn-signup-promo {
        margin-top: 20px;
        border: 2px solid white;
        color: white;
        padding: 10px 30px;
        text-decoration: none;
        border-radius: 4px;
        font-weight: bold;
        transition: background-color 0.3s;
    }
    .btn-signup-promo:hover {
        background-color: rgba(255, 255, 255, 0.1);
    }

    /* 4. Form Panel (White Side) */
    .form-panel {
        flex: 1;
        background-color: white;
        padding: 50px 40px;
    }
    .form-panel h1 {
        color: #333;
        margin-bottom: 30px;
        text-align: center;
        font-size: 28px;
    }

    /* 5. Form Element Styling */
    .login-form {
        width: 100%;
    }
    .input-group {
        margin-bottom: 20px;
    }
    .form-input {
        width: 100%;
        padding: 15px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box; /* Includes padding in width */
        font-size: 16px;
        transition: border-color 0.3s;
    }
    .form-input:focus {
        border-color: #4C6EF5; /* Highlight focus with a professional blue */
        outline: none;
    }
    .form-label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    /* 6. Button Styling */
    .btn-submit {
        width: 100%;
        background-color: #4C6EF5;
        color: white;
        padding: 15px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 18px;
        font-weight: bold;
        transition: background-color 0.3s;
    }
    .btn-submit:hover {
        background-color: #3858c0;
    }
</style>
</head>
<body>

<div class="auth-container">
    <div class="promo-panel">
        <h1>Welcome Back!</h1>
        <p>Log in to Fintrack to manage your expenses, track your budgets, and achieve your financial goals effortlessly.</p>
        <p style="margin-top: 40px; font-weight: bold;">New User?</p>
        <a href="register.jsp" class="btn-signup-promo">SIGN UP</a>
    </div>

    <div class="form-panel">
        <h1>User Login</h1>
        
        <form action="logincode.jsp" method="post" class="login-form">
            
            <div class="input-group">
                <label for="email-input" class="form-label">Email Address</label>
                <input type="email" id="email-input" name="email" placeholder="Enter your email" required class="form-input">
            </div>
            
            <div class="input-group">
                <label for="password-input" class="form-label">Password</label>
                <input type="password" id="password-input" name="psw" placeholder="Enter your password" required class="form-input">
            </div>
            
            <input type="submit" value="Log In" class="btn-submit">
            
            <p style="text-align: center; margin-top: 15px;">
                <a href="#" style="color: #4C6EF5; text-decoration: none;">Forgot Password?</a>
            </p>
        </form>
    </div>
</div>

</body>
</html>