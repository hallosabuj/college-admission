<%
String password=request.getParameter("password");
String app_id=request.getParameter("app_id");
session.setAttribute("app_id",app_id);
session.setAttribute("password",password);
response.sendRedirect("loginvadidate.jsp");
%>