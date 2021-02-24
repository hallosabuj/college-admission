<%@ include file="top.jsp"%>
<%@ include file="connnection.jsp"%>
<%@ include file="link_enable.jsp" %>

<html>
<head>
	<style>
	body {
		background-image: linear-gradient(#ffffff 8%, #ffad99);
		color: 002754;
	}
	.bigtext{
		height: auto;
		width: 500px;
		border-radius: 10px;
		padding: 6px;
		margin: 2px;
		background-color: #002754;
		color:white;
		font-family: Arial;
		letter-spacing: 1.5px;
		margin-top: 15px;
	}
	.table_box{
		border-radius: 15px;
		padding: 10px;
		background-color: white;
		margin-left: 20px;
		margin-right: 20px;
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
		margin-left: 80px;
		margin-right: 80px;
	}
	.red:hover{background-color: red;}
	.green:hover{background-color: green;}
	</style>

</head>
<style>
.coloured{
	color:red;
}
</style>
<body>
<%
		//IF WANT ACCESS THE SEQUIRE PAGE OF WEBSITE -- TO STOP IT THIS BELOW CHECKING IS REQUIRE//
		if(session.getAttribute("app_id")==null)
		{
			response.sendRedirect("login.jsp");
		}
	%>

	<center>

<form action=enter_studetails.jsp method=post>
<table class="table_box" border="1">
	<div class="bigtext">Student's Information (Only male students can apply)</div>
	<tr>
		<td>Name<span class="coloured">*</span></td>
		<td><input type=text name=name size=35 value="${name}" readonly></td>
	</tr>
	<tr>
		<td>Gender<span class="coloured">*</span></td>
		<td><label><input type=radio name=gender value=male required checked>Male
		    <label><input type=radio name=gender value=female disabled>Female
	<tr>
		<td>Father's Name<span class="coloured">*</span></td>
		<td><input type=text size=35 name=fname style="text-transform: uppercase"placeholder="Enter Father's Name" required></td>
	</tr>

	<tr>
		<td>Mother's Name<span class="coloured">*</span></td>
		<td><input type=text size=35 name=mname style="text-transform: uppercase" placeholder="Enter Mother's Name" required></td>
	</tr>

	<tr>
		<td>Gurdian's Name<span class="coloured">*</span></td>
		<td><input type=text size=35 name=gname style="text-transform: uppercase" placeholder="Enter Gurdian's Name" required></td>
	</tr>

	<tr>
		<td>Relationship with candidate<span class="coloured">*</span></td>
		<td><input type=text size=35 name=rwg style="text-transform: uppercase" placeholder="Give your relationship with gurdian" cols=50 required></td>
	</tr>
	<tr>
		<td>Local Gurdian Name<span class="coloured">*</span></td>
		<td><input type=text size=35  name=l_gurdian placeholder="Enter local gurdian name" required></td>
	</tr>
	<tr>
		<td>Mother Tongue<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase" name=mt required></td>
	</tr>
	<tr>
		<td>Religion<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase" name=religion required></td>
	</tr>
		<td>Nationality<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase" name=nationality required></td>
	</tr>

	<tr>
		<td>Height(cm)<span class="coloured">*</span></td>
		<td><input type=text name=height pattern= "[0-9]{2,3}"  title= "IN CENTE METER" required></td>
	</tr>
	<tr>
		<td>Weight(kg)<span class="coloured">*</span></td>
		<td><input type=text name=weight pattern= "[0-9]{2,3}"  title= "IN KG" required></td>
	</tr>
		<td>Blood Group<span class="coloured">*</span></td>
		<td><input type=text name=b_group style="text-transform: uppercase" required></td>
	</tr>

	<tr>
		<td>Email address of the candidate<span class="coloured">*</span></td>
		<td><input type=text size=35 name=email value="${email}" readonly></td>
	</tr>
	<tr>
		<td>Resi Phone<span class="coloured">*</span></td>
		<td><input type=text size=35 pattern= "[0-9]{10}"  title= "10 DIGIT MOBILE NUMBER" name=resi_phone required></td>
	</tr>
	<tr>
		<td>Mobile No. of the candidate<span class="coloured">*</span></td>
		<td>+91<input type=text size=30 name=candi_phone value=${mob} readonly></td>
	</tr>

	<tr>
		<td>Category<span class="coloured">*</span></td>
		<td>
		<select required name=category ><option value="">Select</option>
		<option value=gen>General</option>
		<option value=sc>SC</option>
		<option value=st>ST</option>
		<option value=obc>OBC</option>
		</select>

	</td>
	</tr>
	<tr>
		<td> Physical Handicap<span class="coloured">*</span></td>
		<td>
			<label><input type=radio name=phd value=yes required>Yes
		    <label><input type=radio name=phd value=no> NO
		 </td>
		</tr>
	<tr>
		<td>Date Of Birth<span class="coloured">*</span></td>
		<td><input type=input name=dob value="${dob}" readonly></td>

	</tr>
	<tr>
		<td>Father's Education<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase" name=f_edu required></td>
	</tr>
	<tr>
		<td>Father's Occupation<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase" name=f_occu required></td>
	</tr>
	<tr>
		<td>Total Monthly Income<span class="coloured">*</span></td>
		<td><input type=text size=35 placeholder="100000" name=income required></td>
	</tr>
</table>

<table class="table_box" border="1">
	<div class="bigtext">Father's/Gurdian's Present Contact Details</div>
	<tr>
		<td width="60%">Address<span class="coloured">*</span></td>
		<td width="90%"><textarea name=g_add style="text-transform: uppercase" rows=4 cols=80 required></textarea></td>
	</tr>
	<tr>
		<td>Email address</td>
		<td><input type=text size=50 style="text-transform: lowercase" name=g_email placeholder="yourname@abc.com"></td>
	</tr>
	<tr>
		<td>Contact No.<span class="coloured">*</span></td>
		<td><input type=text size=50 pattern= "[0-9]{10}"  title= "10 DIGIT MOBILE NUMBER" name=g_phone required></td>
	</tr>
</table>

<table class="table_box" border="1">
	<div class="bigtext">Father's/Gurdian's Permanent Contact Details</div>
	<tr>
		<td width="60%">Address<span class="coloured">*</span></td>
		<td><textarea name=s_add rows=4 cols=80 style="text-transform: uppercase" required></textarea></td>
	</tr>
	<tr>
		<td>Village/City<span class="coloured">*</span></td>
		<td><input size=50 type=text style="text-transform: uppercase" name=s_vil required></td>
	</tr>
	<tr>
		<td>Police Station<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase"  name=s_ps required></td>
	</tr>
	<tr>
		<td>Post Office<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" name=s_po required></td>
	</tr>
	<tr>
		<td>District<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" name=s_dist required></td>
	</tr>
	<tr>
		<td>Pincode No.<span class="coloured">*</span></td>
		<td><input type=text pattern= "[0-9]{6}"  title= "6 DIGIT PINCODE"size=50  name=s_pin required></td>
	</tr>
	<tr>
		<td>Country<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" name=s_con required></td>
	</tr>
	<tr>
		<td>State<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" name=s_state required></td>
	</tr>
</table>

<table class="table_box" border="1">
	<div class="bigtext">Local Gurdian's Contact Details</div>
	<tr>
		<td width="60%">Address<span class="coloured">*</span></td>
		<td><textarea name=lg_add style="text-transform: uppercase" rows=4 cols=80 required></textarea></td>
	</tr>
	<tr>
		<td>Email address</td>
		<td><input type=text size=50 style="text-transform: lowercase" name=lg_email placeholder="yourname@abc.com"></td>
	</tr>
	<tr>
		<td>Contact No.<span class="coloured">*</span></td>
		<td><input type=text pattern= "[0-9]{10}"  title= "10 DIGIT MOBILE NUMBER" size=50 name=lg_phone required></td>
	</tr>
</table>
	<center><input type=reset class="button red" value=RESET>
	<input type=submit class="button green" value=SUBMIT>

</form>
</center>
</body>
</html>
