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
<title>Fintrack | Add New Bill</title>
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
        border-color: #FF5A5F; /* Use a strong color for bills/alerts */
        box-shadow: 0 0 0 3px rgba(255, 90, 95, 0.2);
        outline: none;
    }

    /* Button Styling */
    .btn-submit {
        width: 100%;
        background-color: #4C6EF5; /* Primary accent blue */
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
        background-color: #3858c0;
    }
</style>
</head>
<body>

<div class="form-container">
    <h2>Schedule New Bill Payment</h2>
    
    <form action="billscode.jsp" method="post">
        
        <div class="input-group">
            <label for="bill-name-input" class="form-label">Bill Name / Service</label>
            <input type="text" id="bill-name-input" name="bill_name" placeholder="e.g., Rent, Netflix, Electricity" required class="form-input">
        </div>
        
        <div class="input-group">
            <label for="amount-input" class="form-label">Amount ($)</label>
            <input type="number" id="amount-input" step="0.01" name="bill_amt" required 
                   placeholder="e.g., 1200.50" min="0.01" class="form-input">
        </div>
        
        <div class="input-group">
            <label for="date-input" class="form-label">Due Date</label>
            <input type="date" id="date-input" name="due_date" required class="form-input">
        </div>
        
        <input type="submit" value="Add Bill" class="btn-submit">
    </form>
</div>

</body>
</html>