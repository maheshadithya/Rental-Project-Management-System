<%@page import="java.sql.*,java.util.*"%>
<%
String owner_id=request.getParameter("owner_id1");

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
int i=stmt.executeUpdate("DELETE FROM owner WHERE owner_id="+owner_id);
if(i>0){
out.println("Record Delete Success!");
session.setAttribute("RecordDeleteSuccess3","RecordDeleteSuccess3");
response.sendRedirect("Owner.jsp");
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