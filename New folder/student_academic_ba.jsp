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
  <script>
    var s1m,s2m,s3m,s4m,s5m,s6m,tm;
    var s1,s2,s3,s4,s5,s6;
    var subject=["Select","Bengali","Biology","Chemistry","Computer Science","Economics","English","Hindi","Mathematics","Physics","Sanskrit",]
    window.onload=function(){
      s1=document.forms["academic"]["sub1name"];
      s2=document.forms["academic"]["sub2name"];
      s3=document.forms["academic"]["sub3name"];
      s4=document.forms["academic"]["sub4name"];
      s5=document.forms["academic"]["sub5name"];
      s6=document.forms["academic"]["sub6name"];
      s1m=document.forms["academic"]["sub1marks"];
      s2m=document.forms["academic"]["sub2marks"];
      s3m=document.forms["academic"]["sub3marks"];
      s4m=document.forms["academic"]["sub4marks"];
      s5m=document.forms["academic"]["sub5marks"];
      s6m=document.forms["academic"]["sub6marks"];
      tm=document.forms["academic"]["t_number"];
      for(i=0;i<subject.length;i++){
        var d=document.createElement("option");
        d.value=subject[i];
        d.text=subject[i];
        s1.add(d);
      }
      for(i=0;i<subject.length;i++){
        var d=document.createElement("option");
        d.value=subject[i];
        d.text=subject[i];
        s2.add(d);
      }
      for(i=0;i<subject.length;i++){
        var d=document.createElement("option");
        d.value=subject[i];
        d.text=subject[i];
        s3.add(d);
      }
      for(i=0;i<subject.length;i++){
        var d=document.createElement("option");
        d.value=subject[i];
        d.text=subject[i];
        s4.add(d);
      }
      for(i=0;i<subject.length;i++){
        var d=document.createElement("option");
        d.value=subject[i];
        d.text=subject[i];
        s5.add(d);
      }
      for(i=0;i<subject.length;i++){
        var d=document.createElement("option");
        d.value=subject[i];
        d.text=subject[i];
        s6.add(d);
      }
    }
    function calculate_total(){
      if(s1m.value=="")
        s1m.value=0;
      if(s2m.value=="")
        s2m.value=0;
      if(s3m.value=="")
        s3m.value=0;
      if(s4m.value=="")
        s4m.value=0;
      if(s5m.value=="")
        s5m.value=0;
      if(s6m.value=="")
        s6m.value=0;
      tm.value=parseInt(s1m.value)+parseInt(s2m.value)+parseInt(s3m.value)+parseInt(s4m.value)+parseInt(s5m.value)+parseInt(s6m.value);
    }
    function validate(){
      if(s1.value==(s2.value) || s1.value==(s3.value) ||s1.value==(s4.value) || s1.value==(s5.value) || s1.value==(s6.value)){
        window.alert("Two subject cannot be same!");
        return false;
      }
      if(s6.value==(s2.value) || s6.value==(s3.value) ||s6.value==(s4.value) || s6.value==(s5.value) || s6.value==(s1.value)){
        window.alert("Two subject cannot be same!");
        return false;
      }
      if(s5.value==(s2.value) || s5.value==(s3.value) ||s5.value==(s4.value) || s5.value==(s1.value) || s5.value==(s6.value)){
        window.alert("Two subject cannot be same!");
        return false;
      }
      if(s4.value==(s2.value) || s4.value==(s3.value) ||s4.value==(s1.value) || s4.value==(s5.value) || s4.value==(s6.value)){
        window.alert("Two subject cannot be same!");
        return false;
      }
      if(s3.value==(s2.value) || s3.value==(s1.value) ||s3.value==(s4.value) || s3.value==(s5.value) || s3.value==(s6.value)){
        window.alert("Two subject cannot be same!");
        return false;
      }
      if(s2.value==(s1.value) || s2.value==(s3.value) ||s2.value==(s4.value) || s2.value==(s5.value) || s2.value==(s6.value)){
        window.alert("Two subject cannot be same!");
        return false;
      }
    }
  </script>
</head>
<body>
  <center>

<form action=academicvalidate.jsp method=post name="academic" onsubmit="return validate()">
  <div class="box">
  Application No. <input type=text class="inputbox" name=app_id value=${app_id} readonly><br><br>
  Date of Birth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text class="inputbox" name=dob value=${dob} readonly>
</div>
<div class="bigtext">ACADEMIC DETAILS<br>(10+2 level)</div>

<div class="tablebox">
  <div class="offwhite">
<table>
<tr>
<td>ADMIT NUMBER:</td>
<td><input type=text size=38 class="inputbox" name=admit_no required></td>
</tr>
<tr>
<td>BOARD:</td>
<td>
<label><input type= radio name = board value=wbchse required>WBCHSE</label>
<label><input type= radio name = board value=cbse required>CBSE</label>
<label><input type= radio name = board value=isc required>ISC</label>
<label><input type= radio name = board value=oth required>OTHERS</label>
</td>
</tr>
<tr>
<td>
YEAR OF PASSING:</td>
<td>
<select class="inputbox" required name=yop><option value="">CHOOSE</option>
<option value=2019>2019</option>
<option value=2018>2018</option>
</select>
</td>
<tr>
<td>SCHOOL NAME:</td>
<td>
<input type=text class="inputbox" style="text-transform: uppercase" size=38 name=school required></td>
<tr>
<td>
SCHOOL ADDRESS:</td>
<td>
<textarea class="inputbox" style="text-transform: uppercase" name=school_add rows=4 cols=40 required></textarea></td>
</tr>
</table>
</div>

<div class=offwhite>
<p class="mid_heading">MARKS OF 10+2 EXAMINATION:</p>
<h4 class="mustbe">MARKS CAN NOT BE MODIFIED AFTER SUBMISSION</h4>

<table>
<tr>
<td><b>SUBJECT</b></td>
<td>  </td>
<td><center><b>MARKS</b></center></td>
<tr> </tr>
<tr> </tr>
<tr>
<td> Subject 1:</td>
<td>

<select class="inputbox" required name=sub1name onchange="calculate_total()">
</select>
<br>
                <div class="err">${errsub1}</div>
                <% session.removeAttribute("errsub1"); %>
</td>
<td><input type=number class="inputbox" name=sub1marks  min="0" max="100" required onchange="calculate_total()">
                </td>
</tr>
<tr>
<td> Subject 2:</td>
<td>
<select class="inputbox" required name=sub2name onchange="calculate_total()">
</select>
<br>
                <div class="err">${errsub2}</div>
                <% session.removeAttribute("errsub2"); %>
</td>
<td><input type=number class="inputbox" name=sub2marks  min="0" max="100" required onchange="calculate_total()">
</td>
</tr>

<tr>
<td> Subject 3:</td>
<td>
<select class="inputbox" required name=sub3name onchange="calculate_total()">
</select>
<br>
                <div class="err">${errsub3}</div>
                <% session.removeAttribute("errsub3"); %>
</td>
<td><input type=number class="inputbox" name=sub3marks  min="0" max="100" required onchange="calculate_total()">
</td>
</tr>

<tr>
<td> Subject 4:</td>
<td>
<select class="inputbox" required name=sub4name onchange="calculate_total()">
</select>
<br>
                <div class="err">${errsub4}</div>
                <% session.removeAttribute("errsub4"); %>
</td>
<td><input type=number class="inputbox" name=sub4marks  min="0" max="100"required onchange="calculate_total()">
</td>
</tr>

<tr>
<td> Subject 5:</td>
<td>
<select class="inputbox" required name=sub5name onchange="calculate_total()">
</select>
<br>
                <div class="err">${errsub5}</div>
                <% session.removeAttribute("errsub5"); %>
</td>
<td><input type=number class="inputbox" name=sub5marks  min="0" max="100"required onchange="calculate_total()"></td>
</tr>
<tr>
<td> Subject 6:</td>
<td>
<select class="inputbox" name=sub6name onchange="calculate_total()">
</select>
<br>
                <div class="err">${errsub6}</div>
                <% session.removeAttribute("errsub6"); %>
</td>
<td><input type=number class="inputbox" name=sub6marks pattern= "[0-9]{1,3}"  title= "MARKS OPTAIN OUT OF 100"  min="0" max="100" onchange="calculate_total()">

                </td>
</tr>

</table>
<br><br>
TOTAL MARKS:<input type=number class="inputbox"  name=t_number>
<br>
<br>
</div>
<input class="button red" type = reset value = RESET>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input class="button green" type = submit value = SUBMIT>
</form>
</div>
</center>
</body>
</html>
</body>
<%}%>
