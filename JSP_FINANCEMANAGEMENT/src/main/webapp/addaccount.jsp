<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fintrack | Add New Account</title>
<style>
    /* General Form Styling (Assumes this is inside a main page or modal) */
    .form-container {
        max-width: 400px;
        margin: 30px auto;
        padding: 30px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        color: #333;
    }

    /* Header */
    .form-container h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #1a1a1a;
        font-size: 24px;
    }

    /* Input Group for Spacing */
    .input-group {
        margin-bottom: 20px;
    }

    /* Label Styling */
    .form-label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #555;
        font-size: 14px;
    }

    /* Input Field Styling */
    .form-input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box; 
        font-size: 16px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }
    .form-input:focus {
        border-color: #4C6EF5;
        box-shadow: 0 0 0 3px rgba(76, 110, 245, 0.2);
        outline: none;
    }

    /* Button Styling */
    .btn-submit {
        width: 100%;
        background-color: #00A65A; /* Success green for 'Add' action */
        color: white;
        padding: 14px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        letter-spacing: 0.5px;
        transition: background-color 0.3s;
    }
    .btn-submit:hover {
        background-color: #008c4a;
    }
</style>
</head>
<body>

<div class="form-container">
    <h2>Add New Financial Account</h2>
    
    <form action="addaccountcode.jsp" method="post">
        
        <div class="input-group">
            <label for="acc-name-input" class="form-label">Account Number</label>
            <input type="number" id="acc-name-input" name="acc_no" placeholder="Enter the  account number" required class="form-input">
        </div>
        
        <div class="input-group">
            <label for="acc-type-input" class="form-label">Account Type</label>
            <select id="acc-type-input" name="acctype" required class="form-input">
                <option value="" disabled selected>Select Account Type</option>
                <option value="Checking">Checking Account</option>
                <option value="Savings">Savings Account</option>
                <option value="Credit Card">Credit Card</option>
                <option value="Cash">Cash/Wallet</option>
                <option value="Investment">Investment Account</option>
            </select>
        </div>
        
        <div class="input-group">
            <label for="balance-input" class="form-label">Initial Balance ($)</label>
            <input type="number" id="balance-input" name="bal" 
                   step="0.01" value="0.00" min="0" required 
                   class="form-input" placeholder="e.g., 500.00">
        </div>
        
        <input type="submit" value="Add Account" class="btn-submit">
    </form>
</div>

</body>
</html>