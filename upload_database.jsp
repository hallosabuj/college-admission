<%@include file="top.jsp"%>

<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D" %>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="java.io.IOException" %>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics2D" %>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="java.io.File" %>
<%@page import="java.io.IOException" %>
<%@page import="javax.imageio.ImageIO" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.FileUploadException"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.*"%>
<%@ include file="connnection.jsp"%>

<html>
  <head>
    <style>
    body{
  background-image: linear-gradient(#ffffff 15%, #ff5c33);
  background-position: center;
  background-size: cover;
  height:750px;
  width: auto;
}
.sen{
  height:50px;
  width:500px;
  border: 2px solid black;
  border-radius: 10px;
  font-weight: bold;
  padding:30px;
  font-family: Arial;
  background-color: #f2f2f2;
  font-size: 130%;

}
    </style>
  </head>
</html>
<%!
  public static long resize(File f,String outputImagePath, int scaledWidth, int scaledHeight)throws IOException {
        // reads input image
        File inputFile = f;
        BufferedImage inputImage = ImageIO.read(inputFile);

        // creates output image
        BufferedImage outputImage = new BufferedImage(scaledWidth,scaledHeight, inputImage.getType());

        // scales the input image to the output image
        Graphics2D g2d = outputImage.createGraphics();
        g2d.drawImage(inputImage, 0, 0, scaledWidth, scaledHeight, null);
        g2d.dispose();

        // extracts extension of output file
        String formatName = outputImagePath.substring(outputImagePath
                .lastIndexOf(".") + 1);

        // writes to output file
        ImageIO.write(outputImage, formatName, new File(outputImagePath));
	return inputFile.length();
    }
%>

<%
try{
  String app_id=(String)session.getAttribute("app_id");//Get the application id
  String dob=(String)session.getAttribute("dob");//Get the dob
  String index=app_id;
  String picture="";
	String sign="";
	File stdir=new File("webapps/admission/img/"+index);//here application id will place in place of index
	stdir.mkdirs();
	String path2="C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/admission/img/"+index;
	MultipartRequest m=new MultipartRequest(request,path2,1024*1024*10);
	picture=m.getOriginalFileName("pic");
	sign=m.getOriginalFileName("sign");
	resize(m.getFile("pic"), "C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/admission/imgresize/p"+index+".jpg", 200, 200);//this pic will be saved with appid
	resize(m.getFile("sign"), "C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/admission/imgresize/s"+index+".jpg", 300, 200);

	PreparedStatement ps=con.prepareStatement("insert into student_image values(?,?,?,?)");
	ps.setString(1,index);
	ps.setString(2,dob);
	FileInputStream fin=new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/admission/imgresize/p"+index+".jpg");
	ps.setBinaryStream(3,fin,fin.available());
	FileInputStream sin=new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/admission/imgresize/s"+index+".jpg");
	ps.setBinaryStream(4,sin,sin.available());
	int i=ps.executeUpdate();
  out.println("<br><br>");
	if(i>0)
	 response.sendRedirect("payment.jsp");//if properly uploaded
	else
	out.println("<br><br><center><div class='sen'>Document Not Properly Uploaded</div></center>");
	 con.close();
}
catch(IOException e)
{
	out.println("<br><br><center><div class='sen'>More than 5 mb image size,please give lessthan 5 mb image</div></center>");
}
catch(Exception e)
{
	out.println("<br><br><center><div class='sen'>Already Uploaded..</div></center>");
}
out.println("<br><br>");
%>
