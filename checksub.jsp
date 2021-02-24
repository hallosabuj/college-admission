<%@include file="connnection.jsp" %>
<%
    if(session.getAttribute("app_id")==null)
      {
      response.sendRedirect("login.jsp");
      }
      else
      {
        try
        {
          Statement stmt3=con.createStatement();
          String app_id=(String)session.getAttribute("app_id");
          String que2="select app_category from student_record where app_id='"+app_id+"'";
          ResultSet rs=stmt3.executeQuery(que2);
          if(rs.next())
          {
              response.sendRedirect("sacademic.jsp");
         }else{
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

       con.close();

    }
    catch(Exception e)
    {
    out.println(e);
    }
  }
%>
