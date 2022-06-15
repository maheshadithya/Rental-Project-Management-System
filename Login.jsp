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
	<div class="banner1">
			<div class="navbar">
				<img src="logo2.png" class="logo">
			
			</div>
	
		
	<div class="main">
		<div class="register">
			<h2>LOGIN</h2>
			<form>
			<br>
			<input type="text" name="admin_id" id="login" placeholder="Enter ID" required>
			<br>
			<br>
			<input type="password" name="admin_password" id="login" placeholder="Enter Password" required>
			<br>
			<br>
			<br>
			<input type="submit" value="Login" name="submit" id="loginsubmit" formaction="LoginProcess.jsp">
			<br>
			<br>
			</form>	
		</div>
	
	
	</div>

</div>

	</body>

</html>
	<%
		
			if(session.getAttribute("LoginFailed")!=null){
				%>
					<script>
						alert("Login Failed!");  
					</script>
				<%
				session.removeAttribute("LoginFailed");
			}
			
			
	%>