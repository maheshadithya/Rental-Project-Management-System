<%@page import="java.sql.*"%>
<%
String property_type=request.getParameter("property_type");
String no_of_rooms=request.getParameter("no_of_rooms");
String area_in_sqfeet=request.getParameter("area_in_sqfeet");
String owner_id=request.getParameter("owner_id");
String price=request.getParameter("price");
String address=request.getParameter("address");

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
int i=stmt.executeUpdate("INSERT INTO property(property_type,no_of_rooms,area_in_sqfeet,owner_id,price,address)VALUES('"+property_type+"','"+no_of_rooms+"','"+area_in_sqfeet+"','"+owner_id+"','"+price+"','"+address+"')");
if(i>0){
out.println("Record Insert Success!");
session.setAttribute("RecordInsertSucess","RecordInsertSuccess");
response.sendRedirect("Property.jsp");
}
else{
out.println("Record Insert Failed!");
}
}
catch(Exception e)
{
System.out.print(e);
}
%>