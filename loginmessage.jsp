<html>
	<head>
<style>

body {
	background-image: linear-gradient(#ffffff 15%, #ff8566);
}
.button{
	width: 240px;
	padding: 9px;
	height: 35px;
	margin-top:25px;
	border: 0px;
	border-radius: 15px;
	background-color: #00244d;
}
.total
{
	 border: 2px solid black;
	 border-radius: 15px;
	 width: 800px;
	padding: 35px;
	height: 230px;
	margin-top:50px;
	font-size: 25px;
	 font-family: Arial;
}
a{
	text-decoration:none;
	color:white;
}
span{
	color:red;
}
.mess{
	margin: 13px;
	margin-bottom: -15px;
	text-align:left;
}
</style>
</head>
<body>
	<center>
	<img src="rkmrc.jpg" >
	<%
		if(session.getAttribute("app_id")==null)
		{
		response.sendRedirect("login.jsp");
		}
	%>
	<div class="total">
		<div class="mess">
		DEAR <b><span>${name}</span>,</b>	</div><br>YOU HAVE SUCCESSFULLY COMPLETED YOUR REGISTRATION.<BR>YOUR APPLICATION-ID AND PASSWORD HAVE BEEN SENT TO YOUR REGISTERED MOBILE MUNBER AND EMAIL-ID.

	<div class="button">
		<a href="login.jsp"> click here to login </a>
	</div>
	</div>
	</center>
</body>
</html>
