<%@include file="connnection.jsp" %>
<%
			try{
					String password=(String)session.getAttribute("password");
					String app_id=(String)session.getAttribute("app_id");
					
					Statement stmt1=con.createStatement();
					String que="select * from student_record where app_id='"+app_id+"'";
					ResultSet rs=stmt1.executeQuery(que);
					if(rs.next())
					{
						String dob=rs.getString(5);
						session.setAttribute("dob",dob);
						String pass=rs.getString(6);
						if(pass.equals(password))
						{
							Statement stmt2=con.createStatement();
							String que1="select * from student_details where app_id='"+app_id+"'";
							ResultSet rs1=stmt2.executeQuery(que1);
							if(rs1.next())
							{
								Statement stmt3=con.createStatement();
								String que2="select * from student_academic where app_id='"+app_id+"'";
								ResultSet rs2=stmt3.executeQuery(que2);
								if(rs2.next())
								{
									Statement stmt4=con.createStatement();
									String que3="select * from student_subject where app_id='"+app_id+"'";
									ResultSet rs3=stmt4.executeQuery(que3);
									if(rs3.next())
									{
										Statement stmt5=con.createStatement();
										String que4="select * from student_image where app_id='"+app_id+"'";
										ResultSet rs4=stmt5.executeQuery(que4);
										if(rs4.next())
										{
											response.sendRedirect("payment.jsp");
										}
										else
										{
											response.sendRedirect("photo_upload.jsp");
										}
									}
									else
									{
										response.sendRedirect("fetch_stream_marks.jsp");	
									}
								}
								else
								{
									response.sendRedirect("student_academic.jsp");	
								}
							}
							else
							{
								response.sendRedirect("fetch_student_record.jsp");	
							}
						}
						else
						{
							String errpas="Invalid Password";
							session.setAttribute("errpas",errpas);
			     			response.sendRedirect("login.jsp");	
						}
					}
					else
					{
						String errapp="Application ID is not Present";
						session.setAttribute("errapp",errapp);
		     			response.sendRedirect("login.jsp");
		     		}
				
				con.close();
			}
			catch(Exception e)
			{
				out.println(e);
			}
%>
