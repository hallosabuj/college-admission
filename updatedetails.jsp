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
			String que1="update student_details set app_id='"+app_id+"',dob='"+dob+"',name='"+name+"',fname='"+fname+"',mname='"+mname+"',gname='"+gname+"',rwg='"+rwg+"',l_gurdian='"+l_gurdian+"',mt='"+mt+"',religion='"+religion+"',nationality='"+nationality+"',height="+height+",weight="+weight+",b_group='"+b_group+"',email='"+email+"',resi_phone="+resi_phone+",candi_phone="+candi_phone+",category='"+category+"',phd='"+phd+"',f_edu='"+f_edu+"',f_occu='"+f_occu+"',income='"+income+"',g_add='"+g_add+"',g_email='"+g_email+"',g_phone="+g_phone+",s_add='"+s_add+"',s_vil='"+s_vil+"',s_ps='"+s_ps+"',s_po='"+s_po+"',s_dist='"+s_dist+"',s_pin='"+s_pin+"',s_con='"+s_con+"',lg_add='"+lg_add+"',lg_email='"+lg_email+"',lg_phone="+lg_phone+" where app_id='"+app_id+"'";
			int t=stmt2.executeUpdate(que1);
		     if(t>0)
		     {
		     	session.setAttribute("app_id",app_id);

		     	response.sendRedirect("loginvadidate.jsp");

		     }



		     con.close();

		}
		catch(Exception e)
		{
		out.println(e);
		}
	}
%>
