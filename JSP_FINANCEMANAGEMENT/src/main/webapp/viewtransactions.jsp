<%@ page import="java.sql.*" %>
<%
Integer uid = (Integer)session.getAttribute("user_id");
if(uid == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head><title>View Transactions</title></head>
<body>
<center>
<h2>View Transactions</h2>

<form action="" method="get">
Select Account:
<select name="acc_no" required>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");
    PreparedStatement ps = con.prepareStatement("SELECT acc_no, acc_name FROM accounts WHERE user_id=?");
    ps.setInt(1, uid);
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
        out.println("<option value='"+rs.getInt("acc_no")+"'>"+rs.getInt("acc_no")+" - "+rs.getString("acc_name")+"</option>");
    }
    con.close();
} catch(Exception e) {
    out.println("Error: "+e.getMessage());
}
%>
</select>
<input type="submit" value="Show">
</form>

<br><br>
<table border="1" cellpadding="5">
<tr>
<th>ID</th><th>Type</th><th>Amount</th><th>Note</th><th>Date</th>
</tr>
<%
String accStr = request.getParameter("acc_no");
if(accStr != null && !accStr.isEmpty()){
    int acc = Integer.parseInt(accStr);
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE acc_no=? ORDER BY date DESC");
        ps.setInt(1, acc);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            out.println("<tr>");
            out.println("<td>"+rs.getInt("id")+"</td>");
            out.println("<td>"+rs.getString("type")+"</td>");
            out.println("<td>"+rs.getDouble("amount")+"</td>");
            out.println("<td>"+rs.getString("note")+"</td>");
            out.println("<td>"+rs.getTimestamp("date")+"</td>");
            out.println("</tr>");
        }
        con.close();
    }catch(Exception e){
        out.println("Error: "+e.getMessage());
    }
}
%>
</table>
<br>
<a href="dashboard.jsp">Back to Dashboard</a>
</center>
</body>
</html>
