<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fintrack - Welcome</title>
<style>
    /* 1. Global Reset/Theme Setup */
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        /* Matches the dark background from your project's landing page screenshot  */
        background-color: #000; 
        color: white;
        min-height: 100vh; /* Ensures full height for the background */
    }

    /* 2. Navigation Bar Styling (Foreground element) */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 50px;
        z-index: 10; /* Ensures navigation is always on top */
        position: relative;
    }

    .navbar-brand {
        font-size: 24px;
        font-weight: bold;
        color: white;
        text-decoration: none;
        letter-spacing: 1px;
    }

    .nav-links a {
        color: white;
        text-decoration: none;
        padding: 10px 15px;
        margin-left: 15px;
        transition: color 0.3s;
    }

    .nav-links a:hover {
        color: #4C6EF5;
    }

    .nav-links .btn-signup {
        background-color: #4C6EF5; /* Professional blue button */
        border: none;
        border-radius: 4px;
        font-weight: bold;
        padding: 8px 18px;
        transition: background-color 0.3s;
    }
    
    /* 3. Hero Section (Container for the main background image) */
    .hero-section {
        /* Placeholder for a suitable financial background image, e.g., overlapping cards  */
        background-image: url('images/fintrack_landing_bg.png'); 
        background-size: cover;
        background-position: center bottom; /* Position the cards at the bottom */
        background-repeat: no-repeat;
        
        text-align: center;
        padding: 100px 20px;
        min-height: 80vh; /* Ensures content area is large */
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    
    .hero-content {
        max-width: 600px;
        z-index: 5; /* Ensures text is visible over background image */
    }
    
    .hero-content h1 {
        font-size: 48px;
        margin-bottom: 20px;
        color: white;
    }
</style>
</head>
<body>

    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">Fintrack</a>

        <div class="nav-links">
            <a href="login.jsp">Log in</a>
            <a href="register.jsp" class="btn-signup">Sign Up for free</a>
        </div>
    </nav>
    
    <main class="hero-section">
        <div class="hero-content">
            <h1>Simplified Financial Tracking Application</h1>
            <p>Welcome! You're on the right path. Get started with FinTrack and take control of your expenses today!</p>
            <a href="register.jsp" class="btn-signup" style="margin-top: 20px; font-size: 18px;">Sign Up for free</a>
        </div>
    </main>

</body>
</html>