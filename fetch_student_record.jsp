<%@include file="connnection.jsp" %>
<%
		// IF WANT ACCESS THE SEQUIRE PAGE OF WEBSITE -- TO STOP IT THIS BELOW CHECKING IS REQUIRE//
		if(session.getAttribute("app_id")==null)
		{
			response.sendRedirect("login.jsp");
		}
		else
			{
			try{
					String app_id=(String)session.getAttribute("app_id");
					Statement stmt1=con.createStatement();
					String que="select * from student_record where app_id='"+app_id+"'";
					ResultSet rs=stmt1.executeQuery(que);
					if(rs.next())
					{
						String name=rs.getString(2);
						String email=rs.getString(3);
						String dob=rs.getString(5);
						Long mob=rs.getLong(4);
					
						session.setAttribute("name",name);
						session.setAttribute("email",email);
						session.setAttribute("dob",dob);
						session.setAttribute("mob",mob);
					}
					con.close();
					response.sendRedirect("student_details.jsp");
	  			}
	  			catch(Exception e)
				{
					out.println(e);
				}
			}
			
%>