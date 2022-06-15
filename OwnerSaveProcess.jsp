<%@page import="java.sql.*"%>
<%
String first_name=request.getParameter("first_name");
String second_name=request.getParameter("second_name");
String gender=request.getParameter("gender");
String age=request.getParameter("age");
String mobile=request.getParameter("mobile");
String email=request.getParameter("email");
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
int i=stmt.executeUpdate("INSERT INTO owner(first_name,second_name,gender,age,mobile,email,address)VALUES('"+first_name+"','"+second_name+"','"+gender+"','"+age+"','"+mobile+"','"+email+"','"+address+"')");
if(i>0){
out.println("Record Insert Success!");
session.setAttribute("RecordInsertSuccess3","RecordInsertSuccess3");
response.sendRedirect("Owner.jsp");
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