<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>°æ¿é</title>
	<!--bixanjxiqxi-->
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

<!--hxsglxiangdxongjxs-->
  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 
//wxfladd
new CommDAO().update(request,response,"bankuai",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"bankuai"); 
//lixanxdoxngcxhaxifxen
%>
  <form  action="bankuai_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  ÐÞ¸Ä°æ¿é:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
     <tr><td>Ãû³Æ£º</td><td><input name='mingcheng' type='text' id='mingcheng' value='<%= mmm.get("mingcheng")%>' class="form-control" /></td></tr>
     <tr><td>¼ò½é£º</td><td><textarea name='jianjie' cols='50' rows='5' id='jianjie' class="form-control"><%=mmm.get("jianjie")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Ìá½»" onClick="return check();" />
      <input type="reset" name="Submit2" value="ÖØÖÃ" class="btn btn-info btn-small"/></td>
    </tr>
  </table>
</form>

  </body>
</html>


