<%@ include file="connnection.jsp" %>
<%@ page import="java.io.*" %>
<%@ include file="top.jsp"%>
<%@ include file="link_enable.jsp" %>
<%
  if(session.getAttribute("app_id")==null){
    response.sendRedirect("login.jsp");
  }else{
%>
<%
  response.setContentType("text/html");
  PrintWriter pw=response.getWriter();
  String app_id=(String)session.getAttribute("app_id");//Get the application id
  String dob=(String)session.getAttribute("dob");//Get the dob
  String stream=null;
  try{
    PreparedStatement pst=con.prepareStatement("select app_category from student_record where app_id=? and dob=?");
    pst.setString(1,app_id);
    pst.setString(2,dob);
    ResultSet rs=pst.executeQuery();
    if(rs.next())
      stream=rs.getString(1);
  }catch(Exception e){pw.print(e);}
  String sub1name=null,sub2name=null,sub3name=null,sub4name=null,sub5name=null,sub6name=null;
  String sub1marks=null,sub2marks=null,sub3marks=null,sub4marks=null,sub5marks=null,sub6marks=null;
  try{
    PreparedStatement pst1=con.prepareStatement("select * from student_academic where app_id=?");
    pst1.setString(1,app_id);
    //pst1.setString(2,dob);
    ResultSet rs1=pst1.executeQuery();
    if(rs1.next()){
      sub1name=rs1.getString(4);
      sub1marks=rs1.getString(10);
      sub2name=rs1.getString(5);
      sub2marks=rs1.getString(11);
      sub3name=rs1.getString(6);
      sub3marks=rs1.getString(12);
      sub4name=rs1.getString(7);
      sub4marks=rs1.getString(13);
      sub5name=rs1.getString(8);
      sub5marks=rs1.getString(14);
      sub6name=rs1.getString(9);
      sub6marks=rs1.getString(15);
    }
  }catch(Exception e){pw.print(e);}
  String selectedhns[]=new String[5],selectedpool1[]=new String[5],selectedpool2[]=new String[5],selectedlang[]=new String[5];
  try{
    PreparedStatement pst2=con.prepareStatement("select * from student_subject where app_id=? and dob=?");
    pst2.setString(1,app_id);
    pst2.setString(2,dob);
    ResultSet rs2=pst2.executeQuery();
    int i=0;
    while(rs2.next()){
      selectedhns[i]=rs2.getString(3);
      selectedpool1[i]=rs2.getString(4);
      selectedpool2[i]=rs2.getString(5);
      selectedlang[i]=rs2.getString(6);
      i++;
    }
  }catch(Exception e){pw.print(e);}
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<script>
	var sn=["<%=sub1name%>","<%=sub2name%>","<%=sub3name%>","<%=sub4name%>","<%=sub5name%>","<%=sub6name%>"];
	var sm=[<%=sub1marks%>,<%=sub2marks%>,<%=sub3marks%>,<%=sub4marks%>,<%=sub5marks%>,<%=sub6marks%>];
  var temp_m=[<%=sub1marks%>,<%=sub2marks%>,<%=sub3marks%>,<%=sub4marks%>,<%=sub5marks%>,<%=sub6marks%>];
	var chem_p1=["Physics","Economics","Pol SC","Philosophy","Statistics","Computer","Bengali"];
	var chem_p1_flag=["true","false","false","false","true","true","false"];
	var chem_p2=["Mathematics"];
	var chem_p2_flag=["true"];
	var comp_p1=["Mathematics"];
	var comp_p1_flag=["true"];
	var comp_p2=["Physics","Statistics","Electronics"];
	var comp_p2_flag=["true","true","true"];
	var eco_p1=["Mathematics"];
	var eco_p1_flag=["true"];
	var eco_p2=["Physics","Chemistry","Sanskrit","Pol Sc","Electronics","Philosophy","Statistics","Computer Science","Bengali"];
	var eco_p2_flag=["true","true","false","false","true","false","true","true","false"];
	var eng_p1=["Physics","Pol Sc","Electronics","Philosophy","Bengali","Computer Science","Economics","History","Mathematics","Chemistry","Sanskrit"];
	var eng_p1_flag=["false","true","false","true","true","false","false","true","false","false","true"];
	var eng_p2=["Philosophy","Economics","Bengali","Computer Science","History","Mathematics","Sanskrit","Chemistry","Physics"];
	var eng_p2_flag=["true","false","true","false","true","false","true","false","false"];
	var hist_p1=["Chemistry","Sanskrit","Philosophy","Bengali","Computer Science","Physics","Statistics","Economics"];
	var hist_p1_flag=["false","true","true","true","false","false","false","false"];
	var hist_p2=["Pol Sc","Electronics","Philosophy","Sanskrit","Chemistry","Physics","Statistics","Economics","Bengali","Computer Science"];
	var hist_p2_flag=["true","false","true","true","false","false","false","false","true","false"];
	var math_p1=["Bengali","Computer Science","Physics","Pol Sc","Electronics","Chemistry","Sanskrit","Economics","Philosophy","Statistics"];
	var math_p1_flag=["false","true","true","false","true","true","false","true","false","true"];
	var math_p2=["Chemistry","Sanskrit","Economics","Philosophy","Statistics","Computer Science","Bengali","Pol Sc","Electronics","Physics"];
	var math_p2_flag=["true","false","true","false","true","true","false","false","true","true"];
	var phy_p1=["Mathematics"];
	var phy_p1_flag=["true"];
	var phy_p2=["Chemistry","Sanskrit","Economics","Pol Sc","Electronics","Philosophy","Statistics","Computer Science","Bengali"];
	var phy_p2_flag=["true","false","true","false","true","false","true","true","false"];
	var sans_p1=["Bengali","Computer Science","Pol Sc","Electronics","History","Mathematics","Philosophy","Physics","Economics","Statistics"];
	var sans_p1_flag=["true","false","true","false","true","false","true","false","false","false"];
	var sans_p2=["History","Mathematics","Philosophy","Bengali","Computer Science","Physics","Economics","Statistics"];
	var sans_p2_flag=["true","false","true","true","false","false","false","false"];
	var stat_p1=["Physics","Chemistry","Sanskrit","Economics","Pol Sc","Electronics","Philosophy","Computer Science","Bengali"];
	var stat_p1_flag=["true","true","false","true","false","true","false","true","false"];
	var stat_p2=["Mathematics"];
	var stat_p2_flag=["true"];
	var hons_sub;
	var honours;
	var pool1;
	var pool2;
	var submit;
  var c_eng;
  var lang;
	function on_load(){
		if(document.getElementById("stream").value=="BSC"){
      hons_sub=["Chemistry","Computer Science","Economics","Mathematics","Physics","Statistics"];
    }else{
      //Select honours for BA
      hons_sub=["English","History","Sanskrit","Bengali"];
    }
    document.getElementById("tb").style.display="none";
		honours=document.forms["select_sub"]["honours"];
    pool1=document.forms["select_sub"]["pool1"];
  	pool2=document.forms["select_sub"]["pool2"];
    c_eng=document.forms["select_sub"]["c_eng"];
    lang=document.forms["select_sub"]["lang"];
		submit=document.forms["select_sub"]["submit"];
		pool1.style.visibility="hidden";
   	pool2.style.visibility="hidden";
		submit.style.visibility="hidden";
    c_eng.style.visibility="hidden";
    lang.style.visibility="hidden";
		document.forms["select_sub"].style.display="none";
		selecting_honours();
		display_selected();
	}
	function display_selected(){
		if("<%=selectedhns[0]%>"!="null"){
      document.getElementById("tb").style.display="block";
      var table=document.getElementById("tb");
      var row=table.insertRow(-1);
      var c1=row.insertCell(0).innerHTML="<%=selectedhns[0]%>";
      c1=row.insertCell(1).innerHTML="<%=selectedpool1[0]%>";
      c1=row.insertCell(2).innerHTML="<%=selectedpool2[0]%>";
      c1=row.insertCell(3).innerHTML="Compulsory English";
      c1=row.insertCell(4).innerHTML="<%=selectedlang[0]%>";
		}else{
      document.forms["select_sub"].style.display="visible";
    }
		if("<%=selectedhns[1]%>"!="null"){
      var table=document.getElementById("tb");
      var row=table.insertRow(-1);
      var c1=row.insertCell(0).innerHTML="<%=selectedhns[1]%>";
      c1=row.insertCell(1).innerHTML="<%=selectedpool1[1]%>";
      c1=row.insertCell(2).innerHTML="<%=selectedpool2[1]%>";
      c1=row.insertCell(3).innerHTML="Compulsory English";
      c1=row.insertCell(4).innerHTML="<%=selectedlang[1]%>";
		}
		if("<%=selectedhns[2]%>"!="null"){
      var table=document.getElementById("tb");
      var row=table.insertRow(-1);
      var c1=row.insertCell(0).innerHTML="<%=selectedhns[2]%>";
      c1=row.insertCell(1).innerHTML="<%=selectedpool1[2]%>";
      c1=row.insertCell(2).innerHTML="<%=selectedpool2[2]%>";
      c1=row.insertCell(3).innerHTML="Compulsory English";
      c1=row.insertCell(4).innerHTML="<%=selectedlang[2]%>";
		}
		if("<%=selectedhns[3]%>"!="null"){
      var table=document.getElementById("tb");
      var row=table.insertRow(-1);
      var c1=row.insertCell(0).innerHTML="<%=selectedhns[3]%>";
      c1=row.insertCell(1).innerHTML="<%=selectedpool1[3]%>";
      c1=row.insertCell(2).innerHTML="<%=selectedpool2[3]%>";
      c1=row.insertCell(3).innerHTML="Compulsory English";
      c1=row.insertCell(4).innerHTML="<%=selectedlang[3]%>";
		}
		if("<%=selectedhns[4]%>"!="null"){
      var table=document.getElementById("tb");
      var row=table.insertRow(-1);
      var c1=row.insertCell(0).innerHTML="<%=selectedhns[4]%>";
      c1=row.insertCell(1).innerHTML="<%=selectedpool1[4]%>";
      c1=row.insertCell(2).innerHTML="<%=selectedpool2[4]%>";
      c1=row.insertCell(3).innerHTML="Compulsory English";
      c1=row.insertCell(4).innerHTML="<%=selectedlang[4]%>";
		}
	}
	function selecting_honours(){
      var d1=document.createElement("option");
      d1.text="Select Honours";
      honours.add(d1);
      for(i=0;i<hons_sub.length;i++){
        d1=document.createElement("option");
        d1.text=hons_sub[i];
        d1.value=hons_sub[i];
				if("<%=selectedhns[0]%>"==hons_sub[i] || "<%=selectedhns[1]%>"==hons_sub[i] || "<%=selectedhns[2]%>"==hons_sub[i] ||"<%=selectedhns[3]%>"==hons_sub[i] ||"<%=selectedhns[4]%>"==hons_sub[i]){
					d1.disabled="true";
				}
        honours.add(d1);
  		}
  }
	function selectPool1(){
		if(honours.selectedIndex==0){
			pool1.style.visibility="hidden";
			pool2.style.visibility="hidden";
      c_eng.style.visibility="hidden";
      lang.style.visibility="hidden";
			submit.style.visibility="hidden";
      document.getElementById("show").innerHTML="";
		}else if(!validate()){
      pool1.style.visibility="hidden";
      pool2.style.visibility="hidden";
      c_eng.style.visibility="hidden";
      lang.style.visibility="hidden";
      submit.style.visibility="hidden";
      document.getElementById("show").innerHTML="<font color=red>Selected Subject is not available for you</font>"
    }else{
      submit.style.visibility="hidden";
      document.getElementById("show").innerHTML="";
			var h=honours.selectedIndex;
			if(honours.options[h].value=="Chemistry"){
				pool1.style.visibility="visible";
				createPool1(chem_p1);
			}else if(honours.options[h].value=="Physics"){
				pool1.style.visibility="visible";
				createPool1(phy_p1);
			}else if(honours.options[h].value=="Mathematics"){
				pool1.style.visibility="visible";
				createPool1(math_p1);
			}else if(honours.options[h].value=="Statistics"){
				pool1.style.visibility="visible";
				createPool1(stat_p1);
			}else if(honours.options[h].value=="Computer Science"){
				pool1.style.visibility="visible";
				createPool1(comp_p1);
			}else if(honours.options[h].value=="Economics"){
				pool1.style.visibility="visible";
				createPool1(eco_p1);
			}else if(honours.options[h].value=="History"){
				pool1.style.visibility="visible";
				createPool1(hist_p1);
			}else if(honours.options[h].value=="Sanskrit"){
				pool1.style.visibility="visible";
				createPool1(sans_p1);
			}else if(honours.options[h].value=="English"){
				pool1.style.visibility="visible";
				createPool1(eng_p1);
			}
		}
	}
	function createPool1(subject){
		for(i=0;i<=10;i++){
    			pool1.remove(0);
    }
		var d1=document.createElement("option");
  	d1.text="Select Pool1";
    pool1.add(d1);
    for(i=0;i<subject.length;i++){
      d1=document.createElement("option");
      d1.text=subject[i];
      d1.value=subject[i];
      pool1.add(d1);
    }
	}
	function selectPool2(){
		if(pool1.selectedIndex==0){
			submit.style.visibility="hidden";
			pool2.style.visibility="hidden";
      c_eng.style.visibility="hidden";
      lang.style.visibility="hidden";
		}else{
			var h=honours.selectedIndex;
			if(honours.options[h].value=="Chemistry"){
				pool2.style.visibility="visible";
				createPool2(chem_p2,chem_p2_flag,chem_p1_flag);
			}else if(honours.options[h].value=="Physics"){
				pool2.style.visibility="visible";
				createPool2(phy_p2,phy_p2_flag,phy_p1_flag);
			}else if(honours.options[h].value=="Mathematics"){
				pool2.style.visibility="visible";
				createPool2(math_p2,math_p2_flag,math_p1_flag);
			}else if(honours.options[h].value=="Statistics"){
				pool2.style.visibility="visible";
				createPool2(stat_p2,stat_p2_flag,stat_p1_flag);
			}else if(honours.options[h].value=="Computer Science"){
				pool2.style.visibility="visible";
				createPool2(comp_p2,comp_p2_flag,comp_p1_flag);
			}else if(honours.options[h].value=="Economics"){
				pool2.style.visibility="visible";
				createPool2(eco_p2,eco_p2_flag,eco_p1_flag);
			}else if(honours.options[h].value=="History"){
				pool2.style.visibility="visible";
				createPool2(hist_p2,hist_p2_flag,hist_p1_flag);
			}else if(honours.options[h].value=="Sanskrit"){
				pool2.style.visibility="visible";
				createPool2(sans_p2,sans_p2_flag,sans_p1_flag);
			}else if(honours.options[h].value=="English"){
				pool2.style.visibility="visible";
				createPool2(eng_p2,eng_p2_flag,eng_p1_flag);
			}
      submit.style.visibility="hidden";
		}
	}
	function createPool2(subject,p2_flag,p1_flag){
		for(i=0;i<=10;i++){
    			pool2.remove(0);
    }
		var d1=document.createElement("option");
    d1.text="Select Pool2";
    pool2.add(d1);
		var ss=pool1.options[pool1.selectedIndex].value;
		var f=p1_flag[pool1.selectedIndex-1];
    for(i=0;i<subject.length;i++){
      d1=document.createElement("option");
      d1.text=subject[i];
      d1.value=subject[i];
      pool2.add(d1);
			if((f=="false" && p2_flag[i]=="false") || ss==subject[i]){
				pool2.options[i+1].disabled=true;
			}
    }
	}
  function selectLang(){
    if(pool2.selectedIndex==0){
      c_eng.style.visibility="hidden";
      lang.style.visibility="hidden";
      submit.style.visibility="hidden";
      return;
    }
    c_eng.style.visibility="visible";
    lang.style.visibility="visible";
    submit.style.visibility="visible";
  }

	function add_subject(){
		document.forms["select_sub"].style.display="block";
	}
  //Code for validation
	function calculate_aggregate(){
		for(i=0;i<5;i++){
      for(j=i+1;j<6;j++){
        if(temp_m[i]<temp_m[j]){
          var temp=temp_m[i];
          temp_m[i]=temp_m[j]
          temp_m[j]=temp;
        }
      }
    }
    return (temp_m[0]+temp_m[1]+temp_m[2]+temp_m[3])/4;
	}
	function check_subject(subject,marks){
		var return_value=false;
		for(i=0;i<sn.length;i++){
      if(sn[i]==subject && sm[i]>=marks){
        return_value=true;
      }
    }

		return return_value;
	}
	function validate(){
		var value=false;
		var agg=calculate_aggregate();
		var hns=honours.options[honours.selectedIndex].value;
		if(hns=="English" && check_subject("English",70) && agg>=65)
			value=true;
    if(hns=="Sanskrit" && agg>=50)
			value=true;
		if(hns=="History" && agg>=60)
			value=true;
    if(hns=="Physics" && check_subject("Mathematics",70) && agg>=70 && check_subject("Physics",70))
			value=true;
		if(hns=="Chemistry" && check_subject("Mathematics",60) && agg>=75 && check_subject("Chemistry",70))
			value=true;
		if(hns=="Mathematics" && check_subject("Mathematics",75) && agg>=70)
			value=true;
		if(hns=="Statistics" && check_subject("Mathematics",80) && agg>=70)
			value=true;
		if(hns=="Computer Science" && check_subject("Mathematics",60) && agg>=60)
			value=true;
		if(hns=="Economics" && check_subject("Mathematics",60) && agg>=55)
			value=true;
    return value;
	}
</script>
<style>
.bg{
  background-image: linear-gradient(#ffffff 15%, #ff5c33);
  background-position: center;
  background-size: cover;
  height:750px;
}
#tb{
    border:0px solid black;
    width:650px;
}
th{
  border-radius: 10px;
  text-align: center;
  font-family: Arial;
  padding: 8px;
  background-color: #00244d;
  color:white;
}
td{
  border: 1px solid black;
  border-radius: 10px;
  text-align: center;
  font-family: Arial;
  font-weight: bold;
  text-align: center;
  background-color: #f2f2f2;
  color: black;

  padding: 8px;
}
#button_style{
    width: auto;
    padding: 9px;
    height: 35px;
    color:white;
    border: 0px;
    border-radius: 15px;
    background-color: #00244d;
    box-shadow:3px 3px 6px #000000;
}
#button_style:hover{
    width: auto;
    padding: 9px;
    height: 35px;
    color:white;
    border: 0px;
    border-radius: 15px;
    background-color: #00244d;
    box-shadow:6px 6px 8px #000000;
}
#stream{
  width: 90px;
	padding: 10px;
	height: 35px;
	color:white;
	border: 0px;
	border-radius: 15px;
	background-color: #00244d;
  text-align: center;
  font-weight: bold;
  margin: 20px;
}
.select1{
  border: 1px solid black;
  height: 30px;
  width: 125px;
  color: black;
  background-color: #f2f2f2;
  border-radius: 10px;
}
.submit{
  width: auto;
  padding: 9px;
  height: 35px;
  color:white;
  border: 0px;
  border-radius: 15px;
  background-color: #00244d;
}
.box{
  background-color: white;
  border-radius: 10px;
  border: 1px solid #00244d;
  padding: 5px;
  height: auto;
  width:650px;
}
</style>
</head>
<body onLoad="on_load()"><div class="bg">
	<center><input type="text" id="stream" value="<%=stream%>" disabled>
  <table id="tb">
    <tr><td colspan="5"><center>You Applied For</center></td></tr>
    <tr>
      <th>Honours</th>
      <th>Pool I</th>
      <th>Pool II</th>
      <th>Compulsory</th>
      <th>Language</th>
    </tr>
  </table>
  </center>
		<center><form name="select_sub" action="insert_sub.jsp">
			<input type="text" name="app_id" hidden value="<%=app_id%>">
      <input type="text" name="dob" hidden value="<%=dob %>">
<br>
<div class="box">
			<select class="select1" name="honours" onChange="selectPool1()">
			</select><div id="show" style="display:inline;"></div>
			<select class="select1" name="pool1" onChange="selectPool2()">
			</select>
			<select class="select1" name="pool2" onChange="selectLang()">
			</select>
      <select class="select1" name="c_eng">
        <option>Compulsory English</option>
      </select>
      <select class="select1" name="lang">
        <option>evs</option>
      </select>
			<br><br><input class="submit" type="submit" name="submit" value="Submit Subject">
</div>

		</form>
    <br>
		<button id="button_style" onclick="add_subject()">Add Another Subject</button></center>
</div></body>
</html>
<%}%>
