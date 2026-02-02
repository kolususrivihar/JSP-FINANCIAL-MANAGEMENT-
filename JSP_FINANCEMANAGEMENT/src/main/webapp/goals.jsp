<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// ----------------------------------------------------------------------
// WARNING: This scriptlet is kept for functional parity.
// For professional development, user session checks should be handled in a Java Servlet/Filter.
// ----------------------------------------------------------------------
Integer uid = (Integer)session.getAttribute("user_id");
if(uid == null){
    response.sendRedirect("login.jsp");
    return; // Stop processing the page
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fintrack | Set New Goal</title>
<style>
    /* General Form Styling (Simulates a centered card or modal) */
    body {
        background-color: #f4f7f6;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }
    .form-container {
        max-width: 450px;
        width: 90%;
        padding: 35px;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }
    .form-container h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #1a1a1a;
        font-size: 26px;
        border-bottom: 2px solid #f0f0f0;
        padding-bottom: 10px;
    }

    /* Input Group */
    .input-group {
        margin-bottom: 25px;
    }

    /* Label Styling */
    .form-label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #555;
        font-size: 15px;
    }

    /* Input Field Styling */
    .form-input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box; /* Ensures padding doesn't widen the input */
        font-size: 16px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }
    .form-input:focus {
        border-color: #00A65A; /* Success green for goals/savings */
        box-shadow: 0 0 0 3px rgba(0, 166, 90, 0.2);
        outline: none;
    }

    /* Button Styling */
    .btn-submit {
        width: 100%;
        background-color: #00A65A; /* Success green for savings goals */
        color: white;
        padding: 14px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s;
    }
    .btn-submit:hover {
        background-color: #008c4a;
    }
</style>
</head>
<body>

<div class="form-container">
    <h2>Set New Financial Goal</h2>
    
    <form action="goalcode.jsp" method="post">
        
        <div class="input-group">
            <label for="goal-name-input" class="form-label">Goal Name</label>
            <input type="text" id="goal-name-input" name="goal_name" placeholder="e.g., Down Payment, Vacation Fund, Emergency Savings" required class="form-input">
        </div>
        
        <div class="input-group">
            <label for="amount-input" class="form-label">Target Amount ($)</label>
            <input type="number" id="amount-input" step="0.01" name="goal_amt" required 
                   placeholder="e.g., 5000.00" min="0.01" class="form-input">
        </div>
        
        <div class="input-group">
            <label for="description-input" class="form-label">Description (Optional)</label>
            <input type="text" id="description-input" name="description" placeholder="Short description of the goal" class="form-input">
        </div>
        
        <input type="submit" value="Set Goal" class="btn-submit">
    </form>
</div>

</body>
</html>