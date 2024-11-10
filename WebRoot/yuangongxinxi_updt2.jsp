<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>员工信息</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>
<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

  <body >
<% 

String id = request.getParameter("id"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"yuangongxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmaps("yuangonggonghao",(String)request.getSession().getAttribute("username"),"yuangongxinxi"); 
%>
  <form  action="yuangongxinxi_updt2.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改员工信息:
  <br><br>
  <%
  
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
     
     <tr><td>员工工号：</td><td><input name='yuangonggonghao' type='text' id='yuangonggonghao' value='<%= mmm.get("yuangonggonghao")%>' readonly="readonly" class="form-control" /></td></tr>
     <tr><td>密码：</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' class="form-control" /></td></tr>
     <tr><td>员工姓名：</td><td><input name='yuangongxingming' type='text' id='yuangongxingming' value='<%= mmm.get("yuangongxingming")%>' class="form-control" /></td></tr>
     <tr><td>性别：</td><td><select name='xingbie' id='xingbie' class="form-control2"><option value="男">男</option><option value="女">女</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=mmm.get("xingbie")%>';</script>
     <tr><td>年龄：</td><td><input name='nianling' type='text' id='nianling' value='<%= mmm.get("nianling")%>' class="form-control" /></td></tr>
     <tr><td>电话：</td><td><input name='dianhua' type='text' id='dianhua' value='<%= mmm.get("dianhua")%>' class="form-control" /></td></tr>
     <tr><td>照片：</td><td><input name='zhaopian' style="display:none" type='text' id='zhaopian' size='50' value='' class="form-control" /><img src='<%=mmm.get("zhaopian") %>'  onClick="up('zhaopian')"  style="cursor:pointer" width=147 height=164 border=0 /></td></tr>
     <tr><td>职称：</td><td><input name='gangwei' type='text' id='gangwei' value='<%= mmm.get("gangwei")%>' readonly="readonly" class="form-control" /></td></tr>
     <tr><td>简介：</td><td><textarea name='jianjie' cols='50' rows='5' id='jianjie' class="form-control" style="width:600px;height:80px;" ><%=mmm.get("jianjie")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" class="btn btn-info btn-small" />
 </td>
    </tr>
  </table>
</form>

  </body>
</html>


