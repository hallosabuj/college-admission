<%@include file="connnection.jsp" %>
<%@ include file="top.jsp"%>
<%@ include file="link_enable.jsp" %>

<html>
<head>
  <title></title>
  <style>
  body {
  	background-image: linear-gradient(#ffffff 15%, #ff8566);
  }
  .mustbe{
    color:red;
    border-radius: 8px;
    background-color: white;
    padding:3px;
    width:300px;
  }
  .offwhite{
    height:auto;
    width: auto;
    border-radius: 15px;
    padding-top:0.5px;
    padding-left:8px;
    padding-right:8px;
    margin-bottom: 10px;
    background-color: #e6e6e6;
  }
  .box{
    height:60px;
    width:600px;
    border-radius: 15px;
    border:2px solid black;
    padding:14px;
    margin:5px;
  }
  .inputbox{
  	border-radius: 5px;
  	border-width: 0.5px;
  	border-color: black;
  	padding: 2px;
  }
.mid_heading{
  height: auto;
  width: auto;
  border-radius: 10px;
  padding: 6px;
  margin: 2px;
  background-color: #002754;
  color:white;
  font-family: Arial;
  font-size: 110%;
  letter-spacing: 1.5px;
  margin-top: 15px;
}
  .bigtext{
    height: auto;
    width: 600px;
    border-radius: 10px;
    padding: 6px;
    margin: 2px;
    background-color: #002754;
    color:white;
    font-family: Arial;
    font-size: 110%;
    letter-spacing: 1.5px;
    margin-top: 15px;
  }
  .tablebox{
    width:600px;
    border: 1px solid black;
    border-radius: 15px;
    padding: 10px;
    background-color: white;
    margin: 20px;
  }
  .err{
        color: red;
        font-size: 15px;
    }
  .button{
		width: 90px;
		padding: 9px;
		height: 35px;
		color: white;
		border-width: 0px;
		border-radius: 15px;
		background-color: #00244d;
		margin-top: 10px;
		margin-left: 20px;
		margin-right: 20px;
	}

	.red:hover{background-color: red;}
	.green:hover{background-color: green;}
  </style>
</head>
<body>
  <%!
      String app_id;
      String dob;
      String admit_no;
      String sub1name;
      String sub2name;
      String sub3name;
      String sub4name;
      String sub5name;
      String sub6name;
      String sub1marks;
      String sub2marks;
      String sub3marks;
      String sub4marks;
      String sub5marks;
      String sub6marks;
      String school;
      String school_add;
      String board;
      String yop;
      String t_number;
  %>
   <%
    if(session.getAttribute("app_id")==null)
    {
      response.sendRedirect("login.jsp");
    }
    else
    {
      try
      {
        app_id=(String)session.getAttribute("app_id");
        Statement stm=con.createStatement();
        String qu="select nvl(sub6name,' '),nvl(sub6marks,' ') from student_academic where app_id='"+app_id+"'";
        ResultSet rs5=stm.executeQuery(qu);
        if(rs5.next())
        {
          sub6name=rs5.getString(1);
          sub6marks=rs5.getString(2);
        }
        Statement stmt2=con.createStatement();
        String que="select * from student_academic where app_id='"+app_id+"'";
        ResultSet rs=stmt2.executeQuery(que);
        if(rs.next())
        {
          dob=rs.getString(2);
          admit_no=rs.getString(3);
          sub1name=rs.getString(4);
          sub2name=rs.getString(5);
          sub3name=rs.getString(6);
          sub4name=rs.getString(7);
          sub5name=rs.getString(8);
          sub1marks=rs.getString(10);
          sub2marks=rs.getString(11);
          sub3marks=rs.getString(12);
          sub4marks=rs.getString(13);
          sub5marks=rs.getString(14);
          school=rs.getString(16);
          school_add=rs.getString(17);
          board=rs.getString(18);
          yop=rs.getString(19);
          t_number=rs.getString(20);
  %>
  <center>

<form>
  <div class="box">
  Application No. <input type=text class="inputbox" name=app_id value="<%=app_id%>" readonly><br><br>
  Date of Birth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text class="inputbox" name=dob value="<%=dob%>" readonly>
</div>
<div class="bigtext">ACADEMIC DETAILS<br>(10+2 level)</div>

<div class="tablebox">
  <div class="offwhite">
<table>
<tr>
<td>ADMIT NUMBER:</td>
<td><input type=text size=38 class="inputbox" name=admit_no value="<%=admit_no%>" disabled></td>
</tr>
<tr>
<td>BOARD:</td>
<td>
<% if(board.equals("wbchse"))
  %><label><input type= radio name = board checked>WBCHSE</label><%
else
  %><label><input type= radio name = board disabled>WBCHSE</label>
<% if(board.equals("cbse"))
  %><label><input type= radio name = board checked>CBSE</label><%
else
  %><label><input type= radio name = board disabled>CBSE</label>
<% if(board.equals("isc"))
  %><label><input type= radio name = board checked>ISC</label><%
else
  %><label><input type= radio name = board disabled>ISC</label>
<% if(board.equals("others"))
  %><label><input type= radio name = board checked>OTHERS</label><%
else
  %><label><input type= radio name = board disabled>OTHERS</label>
</td>
</tr>
<tr>
<td>
YEAR OF PASSING:</td>
<td>
<select class="inputbox" disabled name=yop><option value="">
<option selected><%=yop%></option>
</select>
</td>
<tr>
<td>SCHOOL NAME:</td>
<td>
<input type=text class="inputbox" style="text-transform: uppercase" size=38 name=school value="<%=school%>" disabled></td>
<tr>
<td>
SCHOOL ADDRESS:</td>
<td>
<textarea class="inputbox" style="text-transform: uppercase" name=school_add rows=4 cols=40  disabled><%=school_add%></textarea></td>
</tr>
</table>
</div>

<div class=offwhite>
<p class="mid_heading">MARKS OF 10+2 EXAMINATION:</p>
<table>
<tr>
<td><b>SUBJECT</b></td>
<td>  </td>
<td><center><b>MARKS</b></center></td>
<tr> </tr>
<tr> </tr>
<tr>
<td> Compulsory 1:</td>
<td>

<select class="inputbox" disabled name=sub1name>
<option selected><%=sub1name%></option>
</select>
<br>
</td>
<td><input type=number class="inputbox" name=sub1marks value="<%=sub1marks%>" min="0" max="100" disabled></td>
</tr>
<tr>
<td> Elective 1:</td>
<td>
<select class="inputbox" disabled name=sub2name>
<option selected><%=sub2name%></option>
</select>
<br>
</td>
<td><input type=number class="inputbox" name=sub2marks value="<%=sub2marks%>" min="0" max="100" disabled>
</td>
</tr>

<tr>
<td> Elective 2:</td>
<td>
<select class="inputbox" disabled name=sub3name>
<option selected><%=sub3name%></option>
</select>
<br>
</td>
<td><input type=number class="inputbox" name=sub3marks value="<%=sub3marks%>" min="0" max="100" disabled>
</td>
</tr>

<tr>
<td> Elective 3 :</td>
<td>
<select class="inputbox" disabled name=sub4name>
<option selected><%=sub4name%></option>
</select>
<br>
</td>
<td><input type=number class="inputbox" name=sub4marks value="<%=sub4marks%>" min="0" max="100"disabled>
</td>
</tr>
<tr>
<td> Elective 4:</td>
<td>
<select class="inputbox" disabled name=sub5name>
<option selected><%=sub5name%></option>
</select>
<br>
</td>
<td><input type=number class="inputbox" name=sub5marks  value="<%=sub5marks%>" min="0" max="100"disabled></td>
</tr>
<tr>
<td> Elective 5:</td>
<td>
<select class="inputbox" name=sub6name disabled>
<option selected><%=sub6name%></option>
</select>
<br>
</td>
<td><input type =number class="inputbox" name=sub6marks value="<%=sub6marks%>"  min="0" max="100" disabled></td>
</tr>
</table>
<br><br>
TOTAL MARKS:<input type=number class="inputbox" value="<%=t_number%>" name=t_number min="0" max="600" disabled>
<br>
<br>
</div>
</form>
</div>
</center>
</body>
</html>
<%
 }
      else
      {
         con.close();
        response.sendRedirect("student_academic.jsp");
      }

       con.close();
    }
    catch(Exception e)
    {
    out.println(e);
    }
  }
%>
