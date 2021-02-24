<%
  session.removeAttribute("app_id");
  response.sendRedirect("login.jsp");
%>
