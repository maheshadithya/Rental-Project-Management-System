<%@page import="java.sql.*"%>

<%

String jdbcDriver = "com.mysql.jdbc.Driver";
String jdbcUrl = "jdbc:mysql://localhost:3306/";
String systemDatabase = "RPMSystem";
String dbUserId = "root";
String dbUserPassword = "root";

try {
Class.forName(jdbcDriver);
} 
catch (Exception e) {
e.printStackTrace();
}
Connection conn = null;


%>

<html>
	<head>
		<title>Rental Property Management System</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
	<div class="banner1">
			<div class="navbar">
				<img src="logo2.png" class="logo">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="Owner.jsp">Owners</a></li>
					<li><a href="Tenant.jsp">Tenants</a></li>
					<li><a href="Property.jsp">Properties</a></li>
					<li><a href="RentPayment.jsp">Rent Payments</a></li>
					<li><a href="Notification.jsp">Notifications</a></li>
				</ul>
			</div>
	
		
	<div class="main">
		<div class="register">
			<h2>RENT DUE NOTI. (>30 days)</h2>
		
		</div>
	<br>
	
	</div>
<br><br>

</div>
<table class="center2" border="1">
	<tr>
		<td>Rentpayment_id</td>
		<td>Rent_payment_type</td>
		<td>Property_id</td>
		<td>Tenant_id</td>
		<td>Owner_id</td>
		<td>Employee_id</td>
		<td>Amount</td>
		<td>Date</td>
		<td>Action</td>
	<tr>
<%
try{
Statement stmt2=null; 
ResultSet resultSet2=null; 

conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
 stmt2=conn.createStatement();
String sql ="SELECT * from rentpayment where date < now() - interval 30 DAY";
 resultSet2 = stmt2.executeQuery(sql);
while(resultSet2.next()){
%>
	<tr>
		<td><%out.println(resultSet2.getString(1));%></td>
		<td><%out.println(resultSet2.getString(2));%></td>
		<td><%out.println(resultSet2.getString(3));%></td>
		<td><%out.println(resultSet2.getString(4));%></td>
		<td><%out.println(resultSet2.getString(5));%></td>
		<td><%out.println(resultSet2.getString(6));%></td>
		<td><%out.println(resultSet2.getString(7));%></td>
		<td><%out.println(resultSet2.getString(8));%></td>
		<td><a href="NotificationClearProcess.jsp?notification_id=<%=resultSet2.getString(1)%>">Clear</a></td>
	<tr>

				
<%
}
conn.close();
} 
catch (Exception e) {
e.printStackTrace();
}
%>
</table>
	</body>
	<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
</html>
<%
		
			if(session.getAttribute("RecordDeleteSuccess4")!=null){
				%>
					<script>
						alert("Notification Cleared!");  
					</script>
				<%
				session.removeAttribute("RecordDeleteSuccess4");
			}
			
			
	%>