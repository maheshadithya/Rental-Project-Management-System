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
	<div class="banner">
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
			<h2>RENT PAYMENT</h2>
			<form id="register" method="post">
			<label>Select ID to Search &nbsp; &nbsp; &nbsp;</label>
			<select name="rentpayment_id" id="select" onchange="SelectFunction()">
				<option value="select">Select</option>
			
			
<%
try{
	
Statement stmt = null;
ResultSet resultSet = null;
conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
stmt=conn.createStatement();
String sql ="SELECT * from rentpayment";
resultSet = stmt.executeQuery(sql);
while(resultSet.next()){
%>
				<option value="<%out.println(resultSet.getString("rentpayment_id"));%>"><%out.println(resultSet.getString("rentpayment_id"));%></option>									
<%
}
conn.close();
} 
catch (Exception e) {
e.printStackTrace();
}
%>		
			</select>
			
				<script>
				function SelectFunction() {
					var id_selected=document.getElementById("select").value; 
					window.location.replace("RentPayment.jsp?rentpayment_id="+id_selected)
				}
				</script>
				

<%
String rentpayment_id=request.getParameter("rentpayment_id");

try{
	
Statement stmt1 = null;
ResultSet resultSet1 = null;	
	
conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
stmt1=conn.createStatement();
String sql1 ="SELECT * from rentpayment WHERE rentpayment_id='"+rentpayment_id+"'";
resultSet1 = stmt1.executeQuery(sql1);
if(resultSet1.next()){
%>			
			
			
			<input type="hidden" value="<%out.println(resultSet1.getString(1));%>" name="rentpayment_id1">
			<br>
			<br>
			<label>Rent Payment Type</label>
			<br>
			<input type="text" name="rent_payment_type" id="name" placeholder=""  value="<%out.println(resultSet1.getString(2));%>" >
			<br><br>
			<label>Property ID</label>
			<br>
			<input type="text" name="property_id1" id="name" placeholder=""  value="<%out.println(resultSet1.getString(3));%>" >
			<br><br>
			<label>Tenant ID</label>
			<br>
			<input type="text" name="tenant_id" id="name" placeholder=""  value="<%out.println(resultSet1.getString(4));%>" >
			<br><br>
			<label>Owner ID</label>
			<br>
			<input type="text" name="owner_id" id="name" placeholder=""  value="<%out.println(resultSet1.getString(5));%>" >
			<br><br>
			<label>Employee ID</label>
			<br>
			<input type="text" name="employee_id" id="name" placeholder=""  value="<%out.println(resultSet1.getString(6));%>" >
			<br><br>
			<label>Amount</label>
			<br>
			<input type="text" name="amount" id="name" placeholder=""  step="0.01" value="<%out.println(resultSet1.getString(7));%>" >	
			<br><br>
			<label>Date</label>
			<br>
			<input type="text" name="date" id="name" placeholder="" value="<%out.println(resultSet1.getString(8));%>" >	
<%
}
else{
	%>
			<br>
			<br>
			<label>Rent Payment Type</label>
			<br>
			<input type="text" name="rent_payment_type" id="name" placeholder="" required>
			<br><br>
			<label>Property ID</label>
			<br>
			<input type="number" name="property_id1" id="name" placeholder="" required>
			<br><br>
			<label>Tenant ID</label>
			<br>
			<input type="number" name="tenant_id" id="name" placeholder="" required>
			<br><br>
			<label>Owner ID</label>
			<br>
			<input type="number" name="owner_id" id="name" placeholder="" required>
			<br><br>
			<label>Employee ID</label>
			<br>
			<input type="number" name="employee_id" id="name" placeholder="" required>
			<br><br>
			<label>Amount</label>
			<br>
			<input type="number" name="amount" id="name" placeholder="" required step="0.01">	
			<br><br>
			<label>Date</label>
			<br>
			<input type="date" name="date" id="name" placeholder="" required>	
	<%
}
conn.close();
} 
catch (Exception e) {
e.printStackTrace();
}

%>

			
		
		</div>
	<br>
	<table class="center">
			<tr>
				<td><input type="submit" value="Save" name="submit" id="submit" formaction="RentPaymentSaveProcess.jsp"></td><td>&nbsp;</td>
				<td><input type="submit" value="Delete" name="submit" id="submit" formaction="RentPaymentDeleteProcess.jsp"></td><td>&nbsp;</td>
				
	</form>
				<form>
					<td><input type="submit" value="New" name="submit" id="submit" formaction="RentPayment.jsp"></td><td>&nbsp;</td>
				<td><input type="submit" value="Cancel" name="submit" id="submit" formaction="RentPayment.jsp"></td><td>&nbsp;</td>
					<td><input type="submit" value="Exit" name="submit" id="submit" formaction="Login.jsp"></td>
				</form>
				<tr>
	</table>
	</div>
<br><br>

</div>
<table class="center1" border="1">
	<tr>
		<td>Rentpayment_id</td>
		<td>Rent_payment_type</td>
		<td>Property_id</td>
		<td>Tenant_id</td>
		<td>Owner_id</td>
		<td>Employee_id</td>
		<td>Amount</td>
		<td>Date</td>
	<tr>
<%
try{
Statement stmt2=null; 
ResultSet resultSet2=null; 

conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
 stmt2=conn.createStatement();
String sql ="SELECT * from rentpayment";
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
			if(session.getAttribute("RecordInsertSucess1")!=null){
				%>
					<script>
						alert("Record Insert Sucess!");  
					</script>
				<%
				session.removeAttribute("RecordInsertSucess1");
			}
			if(session.getAttribute("RecordDeleteSuccess1")!=null){
				%>
					<script>
						alert("Record Delete Sucess!");  
					</script>
				<%
				session.removeAttribute("RecordDeleteSuccess1");
			}
			
			
	%>
