<%@page import="java.sql.*"%>

<%
String admin_id = request.getParameter("admin_id");
String admin_password = request.getParameter("admin_password");

String jdbcDriver = "com.mysql.jdbc.Driver";
String jdbcUrl = "jdbc:mysql://localhost:3306/";
String systemDatabase = "rpmsystem";
String dbUserId = "root";
String dbUserPassword = "root";

Connection conn = null;
Statement stmt = null;
ResultSet resultSet = null;

try {
Class.forName(jdbcDriver);
conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
stmt=conn.createStatement();
String sql ="SELECT * from admin WHERE admin_id='"+admin_id+"' and  admin_password='"+admin_password+"'";
resultSet = stmt.executeQuery(sql);
if(resultSet.next()){
out.println("success");
response.sendRedirect("index.jsp");
}
else{
	session.setAttribute("LoginFailed","LoginFailed");
	response.sendRedirect("Login.jsp");	
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>