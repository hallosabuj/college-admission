<%@include file="connnection.jsp" %>
<%
	if(session.getAttribute("app_id")==null)
	{
		response.sendRedirect("login.jsp");
	}else{
	try
	{
		String app_id=request.getParameter("app_id");
		String dob=request.getParameter("dob");
		String admit_no=request.getParameter("admit_no");
		String board=request.getParameter("board");
		String yop=request.getParameter("yop");
		String school=request.getParameter("school");
		String school_add=request.getParameter("school_add");
		String sub1name=request.getParameter("sub1name");
		String sub2name=request.getParameter("sub2name");
		String sub3name=request.getParameter("sub3name");
		String sub4name=request.getParameter("sub4name");
		String sub5name=request.getParameter("sub5name");
		String sub6name=request.getParameter("sub6name");
		String sub1marks=request.getParameter("sub1marks");
		String sub2marks=request.getParameter("sub2marks");
		String sub3marks=request.getParameter("sub3marks");
		String sub4marks=request.getParameter("sub4marks");
		String sub5marks=request.getParameter("sub5marks");
		String sub6marks=request.getParameter("sub6marks");
		String t_number=request.getParameter("t_number");
		Statement stmt2=con.createStatement();
		String que1="insert into student_academic values('"+app_id+"','"+dob+"','"+admit_no+"','"+sub1name+"','"+sub2name+"','"+sub3name+"','"+sub4name+"','"+sub5name+"','"+sub6name+"','"+sub1marks+"','"+sub2marks+"','"+sub3marks+"','"+sub4marks+"','"+sub5marks+"','"+sub6marks+"','"+school+"','"+school_add+"','"+board+"','"+yop+"','"+t_number+"')";
		int t=stmt2.executeUpdate(que1);
		out.print(t_number);
		if(t>0){
			session.setAttribute("app_id",app_id);
			session.setAttribute("dob",dob);
			response.sendRedirect("fetch_stream_marks.jsp");
		}
		con.close();
	}catch(Exception e){out.println(e);}
%>
<%}%>
