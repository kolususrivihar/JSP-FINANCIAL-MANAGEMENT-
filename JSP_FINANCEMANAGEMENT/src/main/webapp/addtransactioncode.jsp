<%@ page import="java.sql.*" %>
<%
int acc_no = Integer.parseInt(request.getParameter("acc_no"));
String type = request.getParameter("type");
double amount = Double.parseDouble(request.getParameter("amount"));
String note = request.getParameter("note");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    // Get current balance
    PreparedStatement ps = con.prepareStatement("SELECT balance FROM accounts WHERE acc_no=?");
    ps.setInt(1, acc_no);
    ResultSet rs = ps.executeQuery();

    if(rs.next()) {
        double balance = rs.getDouble("balance");

        if(type.equalsIgnoreCase("DEBIT") && balance < amount) {
            out.println("<h3 style='color:red;'>Insufficient balance!</h3>");
        } else {
            if(type.equalsIgnoreCase("CREDIT")) {
                balance += amount;
            } else {
                balance -= amount;
            }

            // Update balance
            PreparedStatement ps2 = con.prepareStatement("UPDATE accounts SET balance=? WHERE acc_no=?");
            ps2.setDouble(1, balance);
            ps2.setInt(2, acc_no);
            ps2.executeUpdate();

            // Insert into transactions
            PreparedStatement ps3 = con.prepareStatement("INSERT INTO transactions(acc_no, type, amount, note) VALUES(?, ?, ?, ?)");
            ps3.setInt(1, acc_no);
            ps3.setString(2, type);
            ps3.setDouble(3, amount);
            ps3.setString(4, note);
            ps3.executeUpdate();

            out.println("<h3 style='color:green;'>Transaction Successful ✅</h3>");
            out.println("<p>Account No: " + acc_no + "</p>");
            out.println("<p>Transaction Type: " + type + "</p>");
            out.println("<p>Amount: ₹" + amount + "</p>");
            out.println("<p>Updated Balance: ₹" + balance + "</p>");
        }
    } else {
        out.println("<h3 style='color:red;'>Account not found!</h3>");
    }

    con.close();
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

<br><a href="dashboard.jsp">Back to Dashboard</a>
