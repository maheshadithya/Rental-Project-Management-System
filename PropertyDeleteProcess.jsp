<%@page import="java.sql.*,java.util.*"%>
<%
String property_id=request.getParameter("property_id1");

String jdbcDriver = "com.mysql.jdbc.Driver";
String jdbcUrl = "jdbc:mysql://localhost:3306/";
String systemDatabase = "rpmsystem";
String dbUserId = "root";
String dbUserPassword = "root";
Connection conn = null;
Statement stmt=null; 

try
{
Class.forName(jdbcDriver);
conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
stmt=conn.createStatement();
int i=stmt.executeUpdate("DELETE FROM property WHERE property_id="+property_id);
if(i>0){
out.println("Record Delete Success!");
session.setAttribute("RecordDeleteSuccess","RecordDeleteSuccess");
response.sendRedirect("Property.jsp");
}
else{
out.println("Record Delete Failed");
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>