<%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String psw=request.getParameter("psw");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mettb","root","root");

    PreparedStatement ps=con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
    ps.setString(1,email);
    ps.setString(2,psw);

    ResultSet rs=ps.executeQuery();

    if(rs.next()) {
        session.setAttribute("user_id", rs.getInt("id"));
        session.setAttribute("user_name", rs.getString("username"));
        response.sendRedirect("dashboard.jsp");
    } else {
        out.println("<h3 style='color:red;'>Invalid credentials!</h3>");
    }

    con.close();
} catch(Exception e) {
    out.println("Error: "+e.getMessage());
}
%>
