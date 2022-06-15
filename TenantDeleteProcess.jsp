<%@page import="java.sql.*,java.util.*"%>
<%
String tenant_id=request.getParameter("tenant_id1");

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
int i=stmt.executeUpdate("DELETE FROM tenant WHERE tenant_id="+tenant_id);
if(i>0){
out.println("Record Delete Success!");
session.setAttribute("RecordDeleteSuccess2","RecordDeleteSuccess2");
response.sendRedirect("Tenant.jsp");
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