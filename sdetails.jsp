<%@include file="connnection.jsp" %>
<%@ include file="top.jsp"%>
<%@ include file="link_enable.jsp" %>
<head>
	<style>
	.coloured{
		color:red;
	}
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

<body>
<%!
String dob="";
String name="";
String fname="";
String mname="";
String gname="";
String gender="";
String rwg="";
String l_gurdian="";
String mt="";
String nationality="";
int height,weight;
String b_group="";
String email="";
String category="";
String phd="";
String f_edu="";
String f_occu="";
String income="";
String g_add="";
String g_email="";
String religion="";
long resi_phone,candi_phone,g_phone,lg_phone;
String s_con="";
String s_add="";
String s_vil="";
String s_ps="";
String s_po="";
String s_dist="";
String s_pin="";
String s_state="";
String lg_add="";
String lg_email="";

%>
<%
	// IF WANT ACCESS THE SEQUIRE PAGE OF WEBSITE -- TO STOP IT THIS BELOW CHECKING IS REQUIRE//
	if(session.getAttribute("app_id")==null)
	{
	response.sendRedirect("login.jsp");
	}
	else
	{
		try
		{
		String app_id=(String)session.getAttribute("app_id");
		Statement stm=con.createStatement();
		String qu="select nvl(s_vil,' '),nvl(g_email,' '),nvl(lg_email,' ') from student_details where app_id='"+app_id+"'";
		ResultSet rs5=stm.executeQuery(qu);
		if(rs5.next())
		{
			g_email=rs5.getString(2);
			s_vil=rs5.getString(1);
			lg_email=rs5.getString(3);
		}
		Statement stmt2=con.createStatement();
		String que="select * from student_details where app_id='"+app_id+"'";
		ResultSet rs=stmt2.executeQuery(que);
		if(rs.next())
		{
			dob=rs.getString(2);
			name=rs.getString(3);
			fname=rs.getString(4);
			mname=rs.getString(5);
			gname=rs.getString(6);
			gender=rs.getString(7);
			rwg=rs.getString(8);
			l_gurdian=rs.getString(9);
			mt=rs.getString(10);
			religion=rs.getString(11);
			nationality=rs.getString(12);
			height=Integer.parseInt(rs.getString(13));
			weight=Integer.parseInt(rs.getString(14));
			b_group=rs.getString(15);
			email=rs.getString(16);
			resi_phone=Long.parseLong(rs.getString(17));
			candi_phone=Long.parseLong(rs.getString(18));
			category=rs.getString(19);
			phd=rs.getString(20);
			f_edu=rs.getString(21);
			f_occu=rs.getString(22);
			income=rs.getString(23);
			g_add=rs.getString(24);

			g_phone=Long.parseLong(rs.getString(26));
			s_add=rs.getString(27);

			s_ps=rs.getString(29);
			s_po=rs.getString(30);
			s_dist=rs.getString(31);
			s_pin=rs.getString(32);
			s_con=rs.getString(33);
			s_state=rs.getString(34);
			lg_add=rs.getString(35);

			lg_phone=Long.parseLong(rs.getString(37));

%>
<center>
<form action=updatedetails.jsp method=post>
<table class="table_box" border="1">
	<div class="bigtext">Student&#39s Information (Only male students can apply)</div>
	<tr>
		<td>Name<span class="coloured">*</span></td>
		<td><input type=text name=name size=35 value="<%=name%>" readonly></td>
	</tr>
	<tr>
		<td>Gender<span class="coloured">*</span></td>
		<% if(gender.equalsIgnoreCase("male"))
		{
			%>
		<td><input type=radio name=gender value=male checked>Male
			<input type=radio name=gender value=female disabled>Female</td>
		<%
		}
		else
			{
				%>
			<td><input type=radio name=gender value=male >Male
		    <input type=radio name=gender value=female checked>Female</td>
		    	<%
		    }
		    %>
	<tr>
		<td>Father&#39s Name<span class="coloured">*</span></td>
		<td><input type=text size=35 name=fname  style="text-transform: uppercase" value="<%=fname%>"   placeholder="Enter Father&#39s Name" required></td>
	</tr>

	<tr>
		<td>Mother&#39s Name<span class="coloured">*</span></td>
		<td><input type=text size=35 name=mname style="text-transform: uppercase" value="<%=mname%>"  placeholder="Enter Mother&#39s Name" required></td>
	</tr>

	<tr>
		<td>Gurdian&#39s Name<span class="coloured">*</span></td>
		<td><input type=text size=35 name=gname style="text-transform: uppercase" value="<%=gname%>"  placeholder="Enter Gurdian&#39s Name" required></td>
	</tr>

	<tr>
		<td>Relationship with candidate<span class="coloured">*</span></td>
		<td><input type=text size=35 name=rwg style="text-transform: uppercase" value="<%=rwg%>"  placeholder="Give your relationship with gurdian" cols=50 required></td>
	</tr>
	<tr>
		<td>Local Gurdian Name<span class="coloured">*</span></td>
		<td><input type=text size=35 value="<%=l_gurdian%>" name=l_gurdian required></td>
	</tr>
	<tr>
		<td>Mother Tongue<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase"  value="<%=mt%>" name=mt required></td>
	</tr>
	<tr>
		<td>Religion<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase"  value="<%=religion%>" name=religion required></td>
	</tr>
		<td>Nationality<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase"  value="<%=nationality%>" name=nationality required></td>
	</tr>

	<tr>
		<td>Height(cm)<span class="coloured">*</span></td>
		<td><input type=text name=height pattern= "[0-9]{2,3}"   value="<%=height%>" title= "IN CENTE METER" required></td>
	</tr>
	<tr>
		<td>Weight(kg)<span class="coloured">*</span></td>
		<td><input type=text name=weight pattern= "[0-9]{2,3}"  title= "IN KG"  value="<%=weight%>" required></td>
	</tr>
	<tr>
		<td>Blood Group<span class="coloured">*</span></td>
		<td><input type=text name=b_group style="text-transform: uppercase"  value="<%=b_group%>" required></td>
	</tr>

	<tr>
		<td>Email address of the candidate<span class="coloured">*</span></td>
		<td><input type=text size=35 name=email  value="<%=email%>" readonly></td>
	</tr>
	<tr>
		<td>Resi Phone<span class="coloured">*</span></td>
		<td><input type=text size=35 pattern= "[0-9]{10}"  title= "10 DIGIT MOBILE NUMBER" name=resi_phone  value="<%=resi_phone%>" required></td>
	</tr>
	<tr>
		<td>Mobile No. of the candidate<span class="coloured">*</span></td>
		<td>+91<input type=text size=30 name=candi_phone  value="<%=candi_phone%>" readonly></td>
	</tr>

	<tr>
		<td>Category<span class="coloured">*</span></td>
		<td>

			<select required name=category ><option value="">Select</option>
			<% if(category.equalsIgnoreCase("gen"))
				{
					%>
						<option value=gen selected>General</option>
						<option value=sc>SC</option>
						<option value=st>ST</option>
						<option value=obc>OBC</option>
					<%
				}
				else if (category.equalsIgnoreCase("sc"))
				{
					%>
						<option value=gen>General</option>
						<option value=sc selected>SC</option>
						<option value=st>ST</option>
						<option value=obc>OBC</option>
					<%
				}
				else if (category.equalsIgnoreCase("st"))
				{
					%>
						<option value=gen>General</option>
						<option value=sc>SC</option>
						<option value=st selected>ST</option>
						<option value=obc>OBC</option>
					<%
				}
				else
				{
					%>
						<option value=gen >General</option>
						<option value=sc>SC</option>
						<option value=st>ST</option>
						<option value=obc selected>OBC</option>
					<%
				}
					%>
			</select>
			</td>
			</tr>
			<tr>
		<td> Physical Handicap<span class="coloured">*</span></td>
		<td>
			<% if(phd.equalsIgnoreCase("phd"))
		{
			%>
					<label><input type=radio name=phd value=yes checked >Yes
					<label><input type=radio name=phd value=no> NO
				<%
		}
		else
			{
				%>
		    		<label><input type=radio name=phd value=yes >Yes
					<label><input type=radio name=phd value=no checked > NO
		    	<%
		    }
		    %>
		 </td>
		</tr>
			<tr>
		<td>Date Of Birth<span class="coloured">*</span></td>
		<td><input type=input name=dob  value="<%=dob%>" readonly></td>


	</tr>
	<tr>
		<td>Father&#39s Education<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase" name=f_edu  value="<%=f_edu%>" required></td>
	</tr>
	<tr>
		<td>Father&#39s Occupation<span class="coloured">*</span></td>
		<td><input type=text size=35 style="text-transform: uppercase" name=f_occu  value="<%=f_occu%>" required></td>
	</tr>
	<tr>
		<td>Total Monthly Income<span class="coloured">*</span></td>
		<td><input type=text size=35 placeholder="100000" name=income  value="<%=income%>" required></td>
	</tr>
</table>

<table class="table_box" border="1">
	<div class="bigtext">Father&#39s/Gurdian&#39s Present Contact Details</div>
	<tr>
		<td width="60%">Address<span class="coloured">*</span></td>
		<td width="90%"><textarea name=g_add style="text-transform: uppercase" rows=4 cols=80   required><%=g_add%></textarea></td>
	</tr>
	<tr>
		<td>Email address</td>
		<td><input type=text size=50 style="text-transform: lowercase" name=g_email  value="<%=g_email%>" placeholder="yourname@abc.com"></td>
	</tr>
	<tr>
		<td>Contact No.<span class="coloured">*</span></td>
		<td><input type=text size=50 pattern= "[0-9]{10}"  title= "10 DIGIT MOBILE NUMBER" name=g_phone  value="<%=g_phone%>" required></td>
	</tr>
</table>

<table class="table_box" border="1">
	<div class="bigtext">Father&#39s/Gurdian&#39s Permanent Contact Details</div>
	<tr>
		<td width="60%">Address<span class="coloured">*</span></td>
		<td><textarea name=s_add rows=4 cols=80 style="text-transform: uppercase" required><%=s_add%></textarea></td>
	</tr>
	<tr>
		<td>Village/City<span class="coloured">*</span></td>
		<td><input size=50 type=text style="text-transform: uppercase" value="<%=s_vil%>" name=s_vil required></td>
	</tr>
	<tr>
		<td>Police Station<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase"  value="<%=s_ps%>" name=s_ps required></td>
	</tr>
	<tr>
		<td>Post Office<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" value="<%=s_po%>" name=s_po required></td>
	</tr>
	<tr>
		<td>District<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" value="<%=s_dist%>" name=s_dist required></td>
	</tr>
	<tr>
		<td>Pincode No.<span class="coloured">*</span></td>
		<td><input type=text pattern= "[0-9]{6}"  title= "6 DIGIT PINCODE"size=50 value="<%=s_pin%>"  name=s_pin required></td>
	</tr>
	<tr>
		<td>Country<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" value="<%=s_con%>" name=s_con required></td>
	</tr>
	<tr>
		<td>State<span class="coloured">*</span></td>
		<td><input type=text size=50 style="text-transform: uppercase" value="<%=s_state%>" name=s_state required></td>
	</tr>
</table>

<table class="table_box" border="1">
	<div class="bigtext">Local Gurdian&#39s Contact Details</div>
	<tr>
		<td width="60%">Address<span class="coloured">*</span></td>
		<td><textarea name=lg_add style="text-transform: uppercase" rows=4 cols=80 required><%=lg_add%></textarea></td>
	</tr>
	<tr>
		<td>Email address</td>
		<td><input type=text size=50 style="text-transform: lowercase" name=lg_email value="<%=lg_email%>" placeholder="yourname@abc.com"></td>
	</tr>
	<tr>
		<td>Contact No.<span class="coloured">*</span></td>
		<td><input type=text pattern= "[0-9]{10}"  title= "10 DIGIT MOBILE NUMBER" size=50 value="<%=lg_phone%>" name=lg_phone required></td>
	</tr>
</table>
	<center><input type=reset class="button red" value=RESET>
	<input type=submit class="button green" value=SUBMIT>

</form>
</center>
</body>
</html>
<%
			}
			else
			{
				 con.close();
				response.sendRedirect("student_details.jsp");
			}

			 con.close();
		}
		catch(Exception e)
		{
		out.println(e);
		}
	}
%>
