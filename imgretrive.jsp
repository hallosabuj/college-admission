<%@include file="connnection.jsp"%>
<%@page import="java.io.*"%>
<%@page import="java.io.File" %>
<%@page import="java.io.FileOutputStream" %>
<%@page import="java.io.ObjectOutputStream" %>
<%@ include file="top.jsp"%>
<%@ include file="link_enable.jsp" %>
<%
  if(session.getAttribute("app_id")==null){
    response.sendRedirect("login.jsp");
  }else{
%>

<%
String path1="";
String path2="";
try{
String app_id=(String)session.getAttribute("app_id");//Get the application id
PreparedStatement ps=con.prepareStatement("select * from student_image where app_id=?");//where added with application id
ps.setString(1,app_id);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	Blob b=rs.getBlob(3);
	byte barr[]=b.getBytes(1,(int)b.length());
	FileOutputStream fout=new FileOutputStream("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/admission/imgretrive/p"+app_id+".jpg");
	fout.write(barr);
	Blob b1=rs.getBlob(4);
	byte barr1[]=b1.getBytes(1,(int)b1.length());
	FileOutputStream fout1=new FileOutputStream("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/admission/imgretrive/s"+app_id+".jpg");
	fout1.write(barr1);

	fout.close();
	fout1.close();
	path1="imgretrive/p"+app_id+".jpg";
	path2="imgretrive/s"+app_id+".jpg";
}
else
{
	response.sendRedirect("photo_upload.jsp");
}
con.close();
}
catch (Exception e)
{
out.println(e);
e.printStackTrace();}
%>
<html>
<head>
	<style>
		body {
		background-image: linear-gradient(#ffffff 8%, #ffad99);
		color: 002754;
	}
	h1{
		color:red;
	}
	.a{
		margin-top:40px;
	}
	</style>
</head>
</body>
<div class=a>
	<center>
		<h1> Photo and Signature Already Uploaded</h1>
<table cellpadding="30%" border=1>
<tr>
	<td><img src=<%=path1%>  height="200px" width="200px"> <br><br> Candidate Photo</td>
<td><img src=<%=path2%>  height="100px" width="200px"><br><br> Candidate Signature</td>
</tr>
</table>
</center>
</div>
</body>
</html>
<%}%>
