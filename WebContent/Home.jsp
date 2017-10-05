<%@ page import="java.sql.*" %>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Home</title>

</head>

<body>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/record";

String user = "root";

String password = "root";



String sql = "select usertype from userdetail";



try {

Class.forName(driverName);

con = DriverManager.getConnection(url, user, password);

ps = con.prepareStatement(sql);

rs = ps.executeQuery(); 

%>

<form method="post" action="Login.jsp">

<center><h2 style="color:blue
">LOGIN</h2></center>
<h2>Name:
<input type="text" name="name" placeholder="Enter your name" class="button"></h2>
<h2>Password:
<input type="password" name="password" placeholder="Enter password" class="button"></h2>


<h2>
Select UserType:
<td><select name="usertype">

<option value="select">select</option>

</h2>



<%

while(rs.next())

{

String usertype = rs.getString("usertype");

%>

<option value=<%=usertype%>><%=usertype%></option>

<% 

}

}

catch(SQLException sqe)

{

out.println("home"+sqe);

}

%>

</select>

</td>

</tr>

<tr>

<td></td>

<td><input type="submit" value="submit"/></td>

</table>

</form>

</body>

</html>