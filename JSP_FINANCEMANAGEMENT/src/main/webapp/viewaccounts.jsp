<%@ page import="java.sql.*" %>
<%
int uid = (Integer)session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html>
<head><title>View Accounts</title></head>
<body>
<center>
<h2>Accounts</h2>
<table border="1" cellpadding="5">
<tr><th>Account No</th><th>Type</th><th>Balance</th></tr>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    PreparedStatement ps=con.prepareStatement("SELECT * FROM accounts WHERE user_id=?");
    ps.setInt(1,uid);
    ResultSet rs=ps.executeQuery();

    while(rs.next()){
        out.println("<tr><td>"+rs.getInt("acc_no")+"</td><td>"+rs.getString("acc_type")+"</td><td>"+rs.getDouble("balance")+"</td></tr>");
    }

    con.close();
} catch(Exception e) {
    out.println("Error: "+e.getMessage());
}
%>
</table>
</table>
<br>
<a href="dashboard.jsp">Back to Dashboard</a>
</center>
</body>
</html>
