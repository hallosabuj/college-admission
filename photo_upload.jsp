<%@ include file="top.jsp"%>
<%@ include file="connnection.jsp"%>
<%@ include file="link_enable.jsp" %>
<%
  if(session.getAttribute("app_id")==null){
    response.sendRedirect("login.jsp");
  }else{
%>
<html>
  <head>
    <style>
    .bg{
  background-image: linear-gradient(#ffffff 15%, #ff5c33);
  background-position: center;
  background-size: cover;
  height:750px;
}
.upload{
  font-weight: bold;
  font-family: Arial;
  height:130px;
  width:700px;
  background-color: #f2f2f2;
  border: 3px solid #00244d;
  margin:10px;
  border-radius: 10px;
}
.button{
  width: auto;
padding: 9px;
height: 35px;
color:white;
border: 0px;
border-radius: 15px;
background-color: #00244d;
font-weight: bold;
}
.color{
  color: #00244d;
}
.red{
  color: red;
  font-weight: lighter;
}
    </style>
  </head>
<body><div class="bg">
  <center>
<form enctype="multipart/form-data" action="upload_database.jsp" method=post>
<div class="upload">Upload Picture<br><span class="red">(image size must be within 5mb and .jpg format)</span><hr class="color"><br><input type=file name=pic id="pic" required></div><br><br>
<div class="upload">Upload Signature<br><span class="red">(image size must be within 5mb and .jpg format)</span><hr class="color"><br><input type=file name=sign id="sign" required></div><br><br>
<input class="button" type=submit value="Final Upload">
</form>
</center>
</div>
</body>
</html>
<%}%>
