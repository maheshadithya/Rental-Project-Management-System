<%@page import="java.sql.*"%>
<%
String rent_payment_type=request.getParameter("rent_payment_type");
String property_id=request.getParameter("property_id1");
String tenant_id=request.getParameter("tenant_id");
String owner_id=request.getParameter("owner_id");
String employee_id=request.getParameter("employee_id");
String amount=request.getParameter("amount");
String date1=request.getParameter("date");


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
int i=stmt.executeUpdate("INSERT INTO rentpayment(rent_payment_type,property_id,tenant_id,owner_id,employee_id,amount,date)VALUES('"+rent_payment_type+"','"+property_id+"','"+tenant_id+"','"+owner_id+"','"+employee_id+"','"+amount+"','"+date1+"')");
if(i>0){
out.println("Record Insert Success!");
session.setAttribute("RecordInsertSucess1","RecordInsertSuccess1");
response.sendRedirect("RentPayment.jsp");
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