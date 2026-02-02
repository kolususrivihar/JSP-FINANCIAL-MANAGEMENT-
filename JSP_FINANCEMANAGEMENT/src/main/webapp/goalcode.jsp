<%@ page import="java.sql.*" %>
<%
Integer uid = (Integer)session.getAttribute("user_id");
String goalName = request.getParameter("goal_name");
double goalAmt = Double.parseDouble(request.getParameter("goal_amt"));

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    PreparedStatement ps = con.prepareStatement("INSERT INTO goals(user_id, goal_name, goal_amt) VALUES (?, ?, ?)");
    ps.setInt(1, uid);
    ps.setString(2, goalName);
    ps.setDouble(3, goalAmt);

    int i = ps.executeUpdate();
    if(i > 0)
        out.println("<h3 style='color:green;'>Goal added successfully ✅</h3>");
    else
        out.println("<h3 style='color:red;'>Error adding goal!</h3>");

    con.close();
} catch(Exception e){
    out.println("Error: "+e.getMessage());
}
%>
<a href="dashboard.jsp">Back to Dashboard</a>
