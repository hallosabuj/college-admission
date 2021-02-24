<%@ include file="connnection.jsp" %>
<%@ page import="java.io.*" %>
<%
  if(session.getAttribute("app_id")==null){
    response.sendRedirect("login.jsp");
  }else{
%>
<%
  response.setContentType("text/html");
  PrintWriter pw=response.getWriter();
  try{
    PreparedStatement pst=con.prepareStatement("insert into student_subject values(?,?,?,?,?,?,?)");
    pst.setString(1,request.getParameter("app_id"));
    pst.setString(2,request.getParameter("dob"));
    pst.setString(3,request.getParameter("honours"));
    pst.setString(4,request.getParameter("pool1"));
    pst.setString(5,request.getParameter("pool2"));
    pst.setString(6,request.getParameter("lang"));
    pst.setString(7,request.getParameter("c_eng"));
    int res=pst.executeUpdate();
    if(res>0){
      /*PreparedStatement pst1=con.prepareStatement("select * from student_image where app_id=?");
      pst1.setString(1,request.getParameter("app_id"));
      ResultSet rs=pst1.executeQuery();
      if(rs.next())
        response.sendRedirect("imgretrive.jsp");
      else
        response.sendRedirect("photo_upload.jsp");*/
        response.sendRedirect("loginvadidate.jsp");
    }
    else
      pw.print("Unable to add subject.");
  }catch (Exception e) {
    pw.print(e);
  }
}
%>
