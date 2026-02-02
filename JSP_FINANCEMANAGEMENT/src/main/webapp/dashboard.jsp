<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
// ------------------------------------------------------------------------------------------
// 1. BACKEND LOGIC (Scriptlet - Refactored for better variable scope and error handling)
// ------------------------------------------------------------------------------------------
Integer uid = (Integer)session.getAttribute("user_id");
String userName = (String)session.getAttribute("user_name");

if(uid == null){
    response.sendRedirect("login.jsp");
    return; // Stop execution
}

// Variables to hold financial data
DecimalFormat currencyFormatter = new DecimalFormat("₹ #,##0.00");
Double totalBalance = 0.0;
int pendingBills = 0;
int goalsSet = 0;
boolean dataError = false;
Connection con = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb", "root", "root");

    // Query 1: Total Balance
    PreparedStatement ps1 = con.prepareStatement("SELECT SUM(balance) AS total_balance FROM accounts WHERE user_id=?");
    ps1.setInt(1, uid);
    ResultSet rs1 = ps1.executeQuery();
    if(rs1.next() && rs1.getObject("total_balance") != null){
        totalBalance = rs1.getDouble("total_balance");
    }

    // Query 2: Pending Bills (Assuming a status column like 'Pending')
    PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) AS bill_count FROM bills WHERE user_id=? AND status='Pending'");
    ps2.setInt(1, uid);
    ResultSet rs2 = ps2.executeQuery();
    if(rs2.next()){
        pendingBills = rs2.getInt("bill_count");
    }

    // Query 3: Goals Set (Assuming a status column like 'Active')
    PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) AS goal_count FROM goals WHERE user_id=? AND status='Active'");
    ps3.setInt(1, uid);
    ResultSet rs3 = ps3.executeQuery();
    if(rs3.next()){
        goalsSet = rs3.getInt("goal_count");
    }
} catch(Exception e) {
    dataError = true;
    System.err.println("Dashboard Data Error: " + e.getMessage()); // Log error to server console
} finally {
    if (con != null) {
        try { con.close(); } catch (SQLException e) { /* Ignore close errors */ }
    }
}
// ------------------------------------------------------------------------------------------
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fintrack | Dashboard Overview</title>
<style>
    /* 2. Frontend Styling */
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f7f6;
        display: flex;
        min-height: 100vh;
    }

    /* Sidebar Navigation */
    .sidebar {
        width: 250px;
        background-color: #1f2a40; /* Dark blue */
        color: white;
        padding: 20px 0;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        height: 100vh; /* Full viewport height */
        position: fixed;
    }
    .sidebar h2 { text-align: center; color: #4C6EF5; margin-bottom: 30px; }
    .sidebar nav ul { list-style: none; padding: 0; }
    .sidebar nav a {
        display: block; padding: 15px 25px; color: #b0b8c4; text-decoration: none;
        transition: background-color 0.3s, color 0.3s; border-left: 5px solid transparent;
    }
    .sidebar nav a:hover, .sidebar nav a.active {
        background-color: #2e3a4e; color: white; border-left: 5px solid #4C6EF5;
    }
    .logout-section {
        margin-top: auto; padding: 20px; border-top: 1px solid #2e3a4e; text-align: center;
    }

    /* Main Content Area */
    .main-content {
        margin-left: 250px;
        flex-grow: 1;
        padding: 40px;
    }
    .dashboard-header {
        margin-bottom: 30px; border-bottom: 2px solid #ddd; padding-bottom: 10px;
    }
    .dashboard-header h1 { font-size: 32px; color: #1a1a1a; margin: 0; }

    /* Financial Summary Cards */
    .summary-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 25px;
        margin-top: 30px;
    }
    .summary-card {
        background-color: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        transition: transform 0.2s;
    }
    .summary-card:hover {
        transform: translateY(-3px);
    }
    .summary-card p.label {
        color: #777; font-size: 15px; margin-bottom: 5px;
    }
    .summary-card h3.value {
        font-size: 28px; margin: 0; font-weight: bold;
    }
    .balance-value { color: #00A65A; } /* Green for balance */
    .bills-value { color: #FF5A5F; } /* Red for pending bills */
    .goals-value { color: #4C6EF5; } /* Blue for goals */
</style>
</head>
<body>

<aside class="sidebar">
    <h2>Fintrack</h2>
    <nav>
        <ul>
            <li><a href="dashboard.jsp" class="active">🏠 Dashboard</a></li>
            <li><a href="viewaccounts.jsp">💳 View Accounts</a></li>
            <li><a href="viewtransactions.jsp">🧾 View Transactions</a></li>
            <li><a href="viewbills.jsp">📅 View Bills</a></li>
            <li><a href="viewgoals.jsp">🎯 View Goals</a></li>
            <hr style="border-color: #2e3a4e;">
            <li><a href="addaccount.jsp">➕ Add Account</a></li>
            <li><a href="addtransaction.jsp">➕ Add Transaction</a></li>
            <li><a href="bills.jsp">➕ Add Bill</a></li>
            <li><a href="goals.jsp">➕ Add Goal</a></li>
        </ul>
    </nav>
    <div class="logout-section">
        <a href="logout.jsp" style="color: #FF5A5F; text-decoration: none; font-weight: bold;">➡️ Logout</a>
    </div>
</aside>

<main class="main-content">
    
    <div class="dashboard-header">
        <h1>Welcome, **<%= userName %>**!</h1>
        <p style="color: #777;">Your comprehensive financial summary is below.</p>
    </div>

    <% if (dataError) { %>
        <div style="background-color: #ffe0e0; color: #c00; padding: 15px; border: 1px solid #f00; border-radius: 8px; margin-bottom: 25px;">
            ⚠️ **Data Load Error:** Unable to connect to the database or retrieve summary figures. Please check the connection details.
        </div>
    <% } %>

    <section class="summary-grid">
        
        <div class="summary-card">
            <p class="label">Total Account Balance</p>
            <h3 class="value balance-value"><%= currencyFormatter.format(totalBalance) %></h3>
            <a href="viewaccounts.jsp" style="font-size: 14px; color: #00A65A; text-decoration: none; margin-top: 10px; display: block;">View Details</a>
        </div>
        
        <div class="summary-card">
            <p class="label">Pending Bills</p>
            <h3 class="value bills-value"><%= pendingBills %></h3>
            <a href="viewbills.jsp" style="font-size: 14px; color: #FF5A5F; text-decoration: none; margin-top: 10px; display: block;">View Upcoming</a>
        </div>
        
        <div class="summary-card">
            <p class="label">Active Financial Goals</p>
            <h3 class="value goals-value"><%= goalsSet %></h3>
            <a href="viewgoals.jsp" style="font-size: 14px; color: #4C6EF5; text-decoration: none; margin-top: 10px; display: block;">View Progress</a>
        </div>
        
    </section>

    <section style="margin-top: 40px;">
        <h2>Recent Activity & Charts</h2>
        <div style="background-color: white; padding: 30px; border-radius: 12px; min-height: 300px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);">
            <p style="color: #777; text-align: center; padding-top: 50px;">
                *In a complete system, this area would display live charts, recent transactions, and goal progress bars.*
            </p>
        </div>
    </section>

</main>
</body>
</html>