<%@ page import="java.sql.*" %>
<%
Integer uid = (Integer)session.getAttribute("user_id");
if(uid == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head><title>View Bills</title></head>
<body>
<center>
<h2>Upcoming Bills</h2>
<table border="1" cellpadding="5">
<tr><th>Bill ID</th><th>Bill Name</th><th>Amount</th><th>Due Date</th></tr>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM bills WHERE user_id=? ORDER BY due_date ASC");
    ps.setInt(1, uid);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
        out.println("<tr><td>"+rs.getInt("id")+"</td><td>"+rs.getString("bill_name")+"</td><td>"+rs.getDouble("bill_amt")+"</td><td>"+rs.getString("due_date")+"</td></tr>");
    }

    con.close();
} catch(Exception e){
    out.println("Error: "+e.getMessage());
}
%>
</table>
<a href="dashboard.jsp">Back to Dashboard</a>
</center>
</body>
</html>
