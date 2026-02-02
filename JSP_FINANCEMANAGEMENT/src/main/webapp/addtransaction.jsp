<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

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
<title>Fintrack | Add New Transaction</title>
<style>
    /* General Form Styling (Modal/Card appearance) */
    body {
        background-color: #f4f7f6;
        font-family: Arial, sans-serif;
    }
    .form-container {
        max-width: 450px;
        margin: 50px auto;
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

    /* Input/Select Field Styling */
    .form-input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box; 
        font-size: 16px;
        /* Using the Fintrack accent blue for focus */
        transition: border-color 0.3s, box-shadow 0.3s;
    }
    .form-input:focus {
        border-color: #4C6EF5;
        box-shadow: 0 0 0 3px rgba(76, 110, 245, 0.15);
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
    <h2>Add New Transaction</h2>
    
    <form action="addtransactioncode.jsp" method="post">
        
        <div class="input-group">
            <label for="acc-select" class="form-label">Account</label>
            <select id="acc-select" name="acc_no" required class="form-input">
                <option value="" disabled selected>Select an Account</option>
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");
                    PreparedStatement ps = con.prepareStatement("SELECT acc_no, acc_name FROM accounts WHERE user_id=?");
                    ps.setInt(1, uid);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                        // Use a professional label format
                        out.println("<option value='"+rs.getInt("acc_no")+"'>"+rs.getString("acc_name")+" (No. "+rs.getInt("acc_no")+")</option>");
                    }
                    con.close();
                } catch(Exception e) {
                    // Display error professionally rather than breaking the UI
                    out.println("<option value=''>Error loading accounts</option>");
                    // In a real app, log this error instead of displaying it to the user
                }
                %>
            </select>
        </div>
        
        <div class="input-group">
            <label for="type-select" class="form-label">Transaction Type</label>
            <select id="type-select" name="type" required class="form-input">
                <option value="CREDIT">Income (Credit)</option>
                <option value="DEBIT">Expense (Debit)</option>
            </select>
        </div>
        
        <div class="input-group">
            <label for="amount-input" class="form-label">Amount ($)</label>
            <input type="number" id="amount-input" step="0.01" name="amount" required 
                   placeholder="e.g., 50.00" min="0.01" class="form-input">
        </div>
        
        <div class="input-group">
            <label for="note-input" class="form-label">Note/Description</label>
            <input type="text" id="note-input" name="note" placeholder="e.g., Groceries, Salary, Bill Payment" class="form-input">
        </div>
        
        <input type="submit" value="Log Transaction" class="btn-submit">
    </form>
</div>

</body>
</html>