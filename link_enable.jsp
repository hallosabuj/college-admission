<div class="topnav">
<%
	try{
		String app_id=(String)session.getAttribute("app_id");
		Statement s1=con.createStatement();
		Statement s2=con.createStatement();
		Statement s3=con.createStatement();
		Statement s4=con.createStatement();
		String q1="select * from student_details where app_id='"+app_id+"'";
		String q2="select * from student_academic where app_id='"+app_id+"'";
		String q3="select * from student_subject where app_id='"+app_id+"'";
		String q4="select * from student_image where app_id='"+app_id+"'";
		ResultSet rs1=s1.executeQuery(q1);
		ResultSet rs2=s2.executeQuery(q2);
		ResultSet rs3=s3.executeQuery(q3);
		ResultSet rs4=s4.executeQuery(q4);
		String uri=request.getRequestURI();
		String pagename=uri.substring(uri.lastIndexOf("/")+1);
		if(rs4.next()){//image present
			if(pagename.equals("student_details.jsp") || pagename.equals("sdetails.jsp")){
				%><a class="active" href="sdetails.jsp">Student Details</a><%
			}else{
				%><a href="sdetails.jsp">Student Details</a><%
			}
			if(pagename.equals("student_academic_ba.jsp") || pagename.equals("student_academic_bsc.jsp") || pagename.equals("sacademic_ba.jsp") || pagename.equals("sacademic_bsc.jsp")){
				%><a class="active" href="checksub.jsp">Academic Details</a><%
			}else{
				%><a href="checksub.jsp">Academic Details</a><%
			}
			if(pagename.equals("fetch_stream_marks.jsp")){
				%><a class="active" href="fetch_stream_marks.jsp">Subject Selection</a><%
			}else{
				%><a href="fetch_stream_marks.jsp">Subject Selection</a><%
			}
			if(pagename.equals("photo_upload.jsp") || pagename.equals("imgretrive.jsp")){
				%><a class="active" href="imgretrive.jsp">Image Upload</a><%
			}else{
				%><a href="imgretrive.jsp">Image Upload</a><%
			}
			if(pagename.equals("payment.jsp")){
				%><a class="active" href="payment.jsp">Payment</a><%
			}else{
				%><a href="payment.jsp">Payment</a><%
			}
		}else if(rs3.next()){//subject_present
			if(pagename.equals("student_details.jsp") || pagename.equals("sdetails.jsp")){
				%><a class="active" href="sdetails.jsp">Student Details</a><%
			}else{
				%><a href="sdetails.jsp">Student Details</a><%
			}
			if(pagename.equals("student_academic_ba.jsp") || pagename.equals("student_academic_bsc.jsp") || pagename.equals("sacademic_ba.jsp") || pagename.equals("sacademic_bsc.jsp")){
				%><a class="active" href="checksub.jsp">Academic Details</a><%
			}else{
				%><a href="checksub.jsp">Academic Details</a><%
			}
			if(pagename.equals("fetch_stream_marks.jsp")){
				%><a class="active" href="fetch_stream_marks.jsp">Subject Selection</a><%
			}else{
				%><a href="fetch_stream_marks.jsp">Subject Selection</a><%
			}
			if(pagename.equals("photo_upload.jsp") || pagename.equals("imgretrive.jsp")){
				%><a class="active" href="photo_upload.jsp">Image Upload</a><%
			}else{
				%><a href="photo_upload.jsp">Image Upload</a><%
			}
			%><a>Payment</a><%
		}else if(rs2.next()){//academic present
			if(pagename.equals("student_details.jsp") || pagename.equals("sdetails.jsp")){
				%><a class="active" href="sdetails.jsp">Student Details</a><%
			}else{
				%><a href="sdetails.jsp">Student Details</a><%
			}
			if(pagename.equals("student_academic_ba.jsp") || pagename.equals("student_academic_bsc.jsp") || pagename.equals("sacademic_ba.jsp") || pagename.equals("sacademic_bsc.jsp")){
				%><a class="active" href="checksub.jsp">Academic Details</a><%
			}else{
				%><a href="checksub.jsp">Academic Details</a><%
			}
			if(pagename.equals("fetch_stream_marks.jsp")){
				%><a class="active" href="fetch_stream_marks.jsp">Subject Selection</a><%
			}else{
				%><a href="fetch_stream_marks.jsp">Subject Selection</a><%
			}
			%><a>Image Upload</a>
			<a>Payment</a><%
		}else if(rs1.next()){//student details present
			if(pagename.equals("student_details.jsp") || pagename.equals("sdetails.jsp")){
				%><a class="active" href="sdetails.jsp">Student Details</a><%
			}else{
				%><a href="sdetails.jsp">Student Details</a><%
			}
			if(pagename.equals("student_academic_ba.jsp") || pagename.equals("student_academic_bsc.jsp")){
				%><a class="active" href="checksub.jsp">Academic Details</a><%
			}else{
				%><a href="checksub.jsp">Academic Details</a><%
			}
			%><a>Subject Selection</a>
			<a>Image Upload</a>
			<a>Payment</a><%
		}else{
			%><a class="active" href="student_details.jsp">Student Details</a>
			<a>Academic Details</a>
			<a>Subject Selection</a>
			<a>Image Upload</a>
			<a>Payment</a><%
		}
		%><a href="logout.jsp">Log Out</a><%
	}catch(Exception e){out.println(e);}
%>
</div>
