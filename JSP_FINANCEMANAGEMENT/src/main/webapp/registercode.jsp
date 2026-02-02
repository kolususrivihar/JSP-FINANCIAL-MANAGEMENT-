<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("uname");
String email=request.getParameter("email");
String psw=request.getParameter("psw");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    PreparedStatement ps=con.prepareStatement("INSERT INTO users(username,email,password) VALUES(?,?,?)");
    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,psw);

    int i=ps.executeUpdate();
    if(i>0)
        out.println("<h3 style='color:green;'>Registration Successful!</h3><a href='login.jsp'>Go to Login</a>");
    else
        out.println("<h3 style='color:red;'>Error while registering.</h3>");

    con.close();
} catch(Exception e) {
    out.println("Error: "+e.getMessage());
}
%>
