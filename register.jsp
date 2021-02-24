<%@ page language="java" contentType="text/html"%>

<html>
  <%@include file="top.jsp"%>
<head>
    <style>
    body {
        background-image: linear-gradient(#ffffff 15%, #ff8566);
    }
    .red{
        color:red;
    }
    .err{
        color: red;
        font-size: 15px;
    }
.h_red:hover{
    background-color: red;
}
.h_green:hover{
    background-color: green;
}
    .box{
        width: 450px;
        border-radius: 15px;
      border: 2px solid black;
      padding: 10px;
      margin: 25px;
        font-family: Arial;
    }
    .inputbox{
        border-radius: 5px;
        border-width: 0.5px;
        border-color: black;
        padding: 2px;
    }
    .x{
        border-radius: 5px;
        border-width: 0.5px;
        border-color: black;
        padding: 2px;
    }
    .button{
        width: auto;
        padding: 12px;
        margin: 12px;
        width: 120px;
        color:white;
        border: 0px;
        border-radius: 15px;
        background-color: #00244d;
        font-family: Arial;
        font-size: 105%;
    }
    .subbox{
        width:440px;
        height: 68px;
        background-color: #ffc2b3;
        border-radius: 15px;
    }
    </style>
</head>

<body>

    <center>
            <div class="box">
                <form action="registervalid.jsp" method=post>
                    <table cellpadding="10%">
                        <tr>
                            <td>Application Catagory<span class="red">*</span></td>

                            <td>
                                <select required name=ac class="inputbox">
                                    <option value="">Select Application Catagory</option>
                                    <option value="BA" >B.A</option>
                                     <option value="BSC">B.Sc</option>
                                 </select>

                             </td>
            </tr>
            <tr> <td>Application Name<span class="red">*</span></td>
                <td> <input type=text class="inputbox" style="text-transform:uppercase" name=nm required></td>
            </tr>
         <tr>
                <td>Date Of Birth<span class="red">*</span></td>
                <td> <input type=date class="inputbox" name=dob required></td>
         </tr>
          <tr>
                <td>Email Id<span class="red">*</span></td>
                <td> <input type=email class="inputbox" style="text-transform:lowercase" name=email required><br>
                <div class="err">${errama}</div>
            <% session.removeAttribute("errama"); %></td>
         </tr>
          <tr>
            <td>Mobile Number<span class="red">*</span></td>
            <td>+<input type=text class="x" value=91 size="1" required>&nbsp;<input class="inputbox" type=text pattern= "[0-9]{10}" title= "10 DIGIT MOBILE NUMBER" name=mob required></td>
            ${errmob}
            </tr>
                </table>
                <div class="subbox">
                <table>
            <tr>
                        <td><center><input class="button h_red" type=submit value=Reset></center></td>
                <td><center><input class="button h_green" type=submit value=Register></center></td>
                    </tr>
                </table></div>
 </form>
</div>
</body>
</html>
