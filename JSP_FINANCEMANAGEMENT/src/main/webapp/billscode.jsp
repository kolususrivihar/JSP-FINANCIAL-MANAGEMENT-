<%@ page import="java.sql.*" %>
<%
Integer uid = (Integer)session.getAttribute("user_id");
String billName = request.getParameter("bill_name");
double billAmt = Double.parseDouble(request.getParameter("bill_amt"));
String dueDate = request.getParameter("due_date");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb", "root", "root");

    PreparedStatement ps = con.prepareStatement("INSERT INTO bills(user_id, bill_name, bill_amt, due_date) VALUES (?, ?, ?, ?)");
    ps.setInt(1, uid);
    ps.setString(2, billName);
    ps.setDouble(3, billAmt);
    ps.setString(4, dueDate);

    int i = ps.executeUpdate();
    if (i > 0)
        out.println("<h3 style='color:green;'>Bill added successfully ✅</h3>");
    else
        out.println("<h3 style='color:red;'>Error adding bill!</h3>");

    con.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
<a href="dashboard.jsp">Back to Dashboard</a>
