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
			<h2>Property</h2>
			<form id="register" method="post">
			<label>Select ID to Search &nbsp; &nbsp; &nbsp;</label>
			<select name="property_id" id="select" onchange="SelectFunction()">
				<option value="select">Select</option>
			
			
<%
try{
	
Statement stmt = null;
ResultSet resultSet = null;
conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
stmt=conn.createStatement();
String sql ="SELECT * from Property";
resultSet = stmt.executeQuery(sql);
while(resultSet.next()){
%>
				<option value="<%out.println(resultSet.getString("property_id"));%>"><%out.println(resultSet.getString("property_id"));%></option>									
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
					window.location.replace("Property.jsp?property_id="+id_selected)
				}
				</script>
				

<%
String property_id=request.getParameter("property_id");

try{
	
Statement stmt1 = null;
ResultSet resultSet1 = null;	
	
conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
stmt1=conn.createStatement();
String sql1 ="SELECT * from Property WHERE property_id='"+property_id+"'";
resultSet1 = stmt1.executeQuery(sql1);
if(resultSet1.next()){
%>			
			<br>
			<br>
			<input type="hidden" value="<%out.println(resultSet1.getString(1));%>" name="property_id1">
			<label>Property Type</label>
			<br>
			<input type="text" value="<%out.println(resultSet1.getString(2));%>"  name="property_type" id="name" placeholder="" >
			<br><br>
			<label>No. of Rooms</label>
			<br>
			<input type="text" value="<%out.println(resultSet1.getString(3));%>"  name="no_of_rooms" id="name" placeholder="" >
			<br><br>
			<label>Area in Sq. Feet</label>
			<br>
			<input type="text" value="<%out.println(resultSet1.getString(4));%>"  name="area_in_sqfeet" id="name" placeholder="" >
			<br><br>
			<label>Owner ID</label>
			<br>
			<input type="text" value="<%out.println(resultSet1.getString(5));%>"  name="owner_id" id="name" placeholder="" >
			<br><br>
			<label>Price</label>
			<br>
			<input type="text" value="<%out.println(resultSet1.getString(6));%>"  name="price" id="name" placeholder="" >
			<br><br>
			<label>Address</label>
			<br>
			<input type="text" value="<%out.println(resultSet1.getString(7));%>"  name="address" id="name" placeholder="" >	
<%
}
else{
	%>
			<br>
			<br>
			<label>Property Type</label>
			<br>
			<input type="text" name="property_type" id="name" placeholder="" required>
			<br><br>
			<label>No. of Rooms</label>
			<br>
			<input type="number" name="no_of_rooms" id="name" placeholder="" required>
			<br><br>
			<label>Area in Sq. Feet</label>
			<br>
			<input type="number" name="area_in_sqfeet" id="name" placeholder="" required>
			<br><br>
			<label>Owner ID</label>
			<br>
			<input type="number" name="owner_id" id="name" placeholder="" required>
			<br><br>
			<label>Price</label>
			<br>
			<input type="text" name="price" id="name" placeholder="" required step="0.01">
			<br><br>
			<label>Address</label>
			<br>
			<input type="text" name="address" id="name" placeholder="" required>	
	
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
				<td><input type="submit" value="Save" name="submit" id="submit" formaction="PropertySaveProcess.jsp"></td><td>&nbsp;</td>
				<td><input type="submit" value="Delete" name="submit" id="submit" formaction="PropertyDeleteProcess.jsp"></td><td>&nbsp;</td>
				
	</form>
				<form>
					<td><input type="submit" value="New" name="submit" id="submit" formaction="Property.jsp"></td><td>&nbsp;</td>
				<td><input type="submit" value="Cancel" name="submit" id="submit" formaction="Property.jsp"></td><td>&nbsp;</td>
					<td><input type="submit" value="Exit" name="submit" id="submit" formaction="Login.jsp"></td>
				</form>
				<tr>
	</table>
	</div>
<br><br>

</div>
<table class="center1" border="1">
	<tr>
		<td>Property_id</td>
		<td>Property_type</td>
		<td>No_of_rooms</td>
		<td>Area_in_sqfeet</td>
		<td>Owner_id</td>
		<td>Price</td>
		<td>Address</td>
	<tr>
<%
try{
Statement stmt2=null; 
ResultSet resultSet2=null; 

conn = DriverManager.getConnection(jdbcUrl+systemDatabase, dbUserId, dbUserPassword);
 stmt2=conn.createStatement();
String sql ="SELECT * from Property";
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
			if(session.getAttribute("RecordInsertSucess")!=null){
				%>
					<script>
						alert("Record Insert Sucess!");  
					</script>
				<%
				session.removeAttribute("RecordInsertSucess");
			}
			if(session.getAttribute("RecordDeleteSuccess")!=null){
				%>
					<script>
						alert("Record Delete Sucess!");  
					</script>
				<%
				session.removeAttribute("RecordDeleteSuccess");
			}
			
			
	%>
