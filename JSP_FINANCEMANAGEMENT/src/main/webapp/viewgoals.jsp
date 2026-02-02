<%@ page import="java.sql.*" %>
<%
Integer uid = (Integer)session.getAttribute("user_id");
if(uid == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head><title>View Goals</title></head>
<body>
<center>
<h2>Financial Goals</h2>
<table border="1" cellpadding="5">
<tr><th>Goal ID</th><th>Goal Name</th><th>Target Amount</th></tr>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM goals WHERE user_id=?");
    ps.setInt(1, uid);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
        out.println("<tr><td>"+rs.getInt("id")+"</td><td>"+rs.getString("goal_name")+"</td><td>"+rs.getDouble("goal_amt")+"</td></tr>");
    }

    con.close();
}catch(Exception e){
    out.println("Error: "+e.getMessage());
}
%>
</table>
<a href="dashboard.jsp">Back to Dashboard</a>
</center>
</body>
</html>
