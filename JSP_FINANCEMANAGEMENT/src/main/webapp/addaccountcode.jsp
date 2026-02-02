<%@ page import="java.sql.*" %>
<%
int uid = (Integer)session.getAttribute("user_id");
String name=request.getParameter("acc_no");
String type=request.getParameter("acctype");
double bal=Double.parseDouble(request.getParameter("bal"));

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    PreparedStatement ps=con.prepareStatement("INSERT INTO accounts(user_id,acc_no,acc_type,balance) VALUES(?,?,?,?)");
    ps.setInt(1,uid);
    ps.setString(2,name);
    ps.setString(3,type);
    ps.setDouble(4,bal);

    int i=ps.executeUpdate();
    if(i>0)
        out.println("<h3 style='color:green;'>Account Added Successfully!</h3><a href='dashboard.jsp'>Go to Dashboard</a>");
    else
        out.println("<h3 style='color:red;'>Error adding account!</h3>");

    con.close();
} catch(Exception e) {
    out.println("Error: "+e.getMessage());
}
%>
