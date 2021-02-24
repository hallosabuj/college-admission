<%@include file="connnection.jsp" %>
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
			String name=request.getParameter("name");
			String gender=request.getParameter("gender");
			String fname=request.getParameter("fname");
			String mname=request.getParameter("mname");
			String gname=request.getParameter("gname");
			String rwg=request.getParameter("rwg");
			String l_gurdian=request.getParameter("l_gurdian");
			String mt=request.getParameter("mt");
			String religion=request.getParameter("religion");
			String nationality=request.getParameter("nationality");
			double height=Double.parseDouble(request.getParameter("height"));
			double weight=Double.parseDouble(request.getParameter("weight"));
			String b_group=request.getParameter("b_group");
			String email=request.getParameter("email");
			long resi_phone=Long.parseLong(request.getParameter("resi_phone"));
			long candi_phone=Long.parseLong(request.getParameter("candi_phone"));
			String category=request.getParameter("category");
			String phd=request.getParameter("phd");
			String dob =request.getParameter("dob");
			String f_edu=request.getParameter("f_edu");
			String f_occu=request.getParameter("f_occu");
			String income=request.getParameter("income");
			String g_add=request.getParameter("g_add");
			String g_email=request.getParameter("g_email");
			long g_phone=Long.parseLong(request.getParameter("g_phone"));
			String s_add=request.getParameter("s_add");
			String s_vil=request.getParameter("s_vil");
			String s_ps=request.getParameter("s_ps");
			String s_po=request.getParameter("s_po");
			String s_dist=request.getParameter("s_dist");
			String s_pin=request.getParameter("s_pin");
			String s_con=request.getParameter("s_con");
			String s_state=request.getParameter("s_state");
			String lg_add=request.getParameter("lg_add");
			String lg_email=request.getParameter("lg_email");
			long lg_phone=Long.parseLong(request.getParameter("lg_phone"));
			String app_id=(String)session.getAttribute("app_id");
			Statement stmt2=con.createStatement();
			String que1="insert into student_details values('"+app_id+"','"+dob+"','"+name+"','"+fname+"','"+mname+"','"+gname+"','"+gender+"','"+rwg+"','"+l_gurdian+"','"+mt+"','"+religion+"','"+nationality+"',"+height+","+weight+",'"+b_group+"','"+email+"',"+resi_phone+","+candi_phone+",'"+category+"','"+phd+"','"+f_edu+"','"+f_occu+"','"+income+"','"+g_add+"','"+g_email+"',"+g_phone+",'"+s_add+"','"+s_vil+"','"+s_ps+"','"+s_po+"','"+s_dist+"','"+s_pin+"','"+s_con+"','"+s_state+"','"+lg_add+"','"+lg_email+"',"+lg_phone+")";
			int t=stmt2.executeUpdate(que1);
		     if(t>0)
		     {
		     	session.setAttribute("app_id",app_id);
		     	Statement stmt3=con.createStatement();
		     	String que2="select app_category from student_record where app_id='"+app_id+"'";
		     	ResultSet rs=stmt3.executeQuery(que2);
		     	if(rs.next())
		     	{
		     		String cat=rs.getString(1);

		     	if(cat.equalsIgnoreCase("BSC"))
		     	{
		     		response.sendRedirect("student_academic_bsc.jsp");
		     	}
		     	else
		     	{
		     		response.sendRedirect("student_academic_ba.jsp");
		     	}
		     }


		     }
		     con.close();

		}
		catch(Exception e)
		{
		out.println(e);
		}
	}
%>
