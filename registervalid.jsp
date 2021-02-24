<%@include file="connnection.jsp" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.BufferedReader,java.io.InputStreamReader,java.io.OutputStreamWriter,java.net.*" %>
<%@ page import = "java.net.URLConnection,java.net.URLEncoder" %>

<%
	 	Random rand = new Random();
    int randnumber = rand.nextInt(100000);
    String pass = Integer.toString( randnumber);
		String sendermail="duttas051@gmail.com";
		String username="duttas051";
		String password="10971097";
	try{
			boolean c=false;
			String app_cate=request.getParameter("ac");
			String name=request.getParameter("nm").toUpperCase();
			String dob=request.getParameter("dob");
			String email=request.getParameter("email");
			long phno=Long.parseLong(request.getParameter("mob"));
			Statement stmt1=con.createStatement();
			String que="select email from student_record where email='"+email+"'";
	   		ResultSet rs=stmt1.executeQuery(que);
	   			if(rs.next())
	  			 {
	   	 			c=true;
	   			 }
	   			if(c==false)
	   			{
	   					String arrSplit[] = email.split("@");
	   					String app_id=arrSplit[0]+"2019";
	   					String mesg="DEAR "+name+" your Applicant id is "+app_id+" and your password is "+pass+".Keep this with you for future login";

	   					//EMAIL SENDING CODE
						/*Properties properties = System.getProperties();
						properties.setProperty("mail.smtp.host", "smtp.gmail.com");
						properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
						properties.setProperty("mail.smtp.auth", "true");
						properties.setProperty("mail.smtp.port", "465");
						properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
						properties.setProperty("mail.smtp.socketFactory.port", "465");
						properties.setProperty("mail.smtp.socketFactory.fallback", "false");
						Session sess = Session.getInstance(properties,new javax.mail.Authenticator()
						{
						protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(sendermail,password);
						}
						});
						sess.setDebug(true);
						Message message = new MimeMessage(sess);
						message.setFrom(new InternetAddress(sendermail));
						message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
						message.setSubject("REGISTRATION OF RKMRC");
						message.setContent(mesg,"text/html");
						Transport tr=sess.getTransport("smtp");
						tr.connect("smtp.gmail.com",username,password);
						tr.sendMessage(message,message.getAllRecipients());
						//EMAIL SENDING CODE END HERE

						// OTP SENDING IN MOBILE CODE

						/*String apiKey = "apikey=" + "Fd4DaxAbRWc-NcofzAEEhqS6Y06tamJ0rj7HuLEwO2";
						String mess = "&message=" + "DEAR "+name+" your Applicant id is "+app_id+" and your password is "+pass+".Keep this with you for future login";
						String sender = "&sender="+"TXTLCL";
						String numbers = "&numbers="+phno;
						// Send data
						HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
						String data = apiKey + numbers + mess + sender;
						conn.setDoOutput(true);
						nn.getOutputStream().write(data.getBytes("UTF-8"));
						final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
						final StringBuffer stringBuffer = new StringBuffer();
						String line;
						while ((line = rd.readLine()) != null)
						 {
								stringBuffer.append(line);
						}
						rd.close();*/
						//OTP SENDING CODE END HERE
				   		Statement stmt2=con.createStatement();
						String que1="insert into student_record values('"+app_id+"','"+name+"','"+email+"',"+phno+",'"+dob+"','"+pass+"','"+app_cate+"')";
						int t=stmt2.executeUpdate(que1);
					     if(t>0)
					     {
					     	session.setAttribute("name",name);
					     	session.setAttribute("app_id",app_id);
					     	response.sendRedirect("loginmessage.jsp");
							}
				}
	   			else
	    		{
	    			String errema="Already registered";
		     		session.setAttribute("errama",errema);
		     		response.sendRedirect("register.jsp");
	    		}
			con.close();
		}
	catch(Exception e)
	{
		out.println(e);
	}

%>
