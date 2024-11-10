<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>友情连接</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="youqinglianjie_add.jsp?id=<%=id%>";
}

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

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){










new CommDAO().insert(request,response,"youqinglianjie",ext,true,false,""); 

}

%>

  <body >
 <form  action="youqinglianjie_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加友情连接:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">网站名称：</td><td><input name='wangzhanmingcheng' type='text' id='wangzhanmingcheng' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelwangzhanmingcheng' /></td></tr>		<tr><td  width="200">网址：</td><td><input name='wangzhi' type='text' id='wangzhi' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelwangzhi' /></td></tr>		<tr><td  width="200">logo：</td><td><input name='logo' type='text' id='logo' size='50' value='' onblur='' class="form-control" /><div style="margin-top:16px;">&nbsp;<input type='button' value='上传' onClick="up('logo')"  /></div></td></tr>		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>



<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var wangzhanmingchengobj = document.getElementById("wangzhanmingcheng"); if(wangzhanmingchengobj.value==""){document.getElementById("clabelwangzhanmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入网站名称</font>";return false;}else{document.getElementById("clabelwangzhanmingcheng").innerHTML="  "; } 	var wangzhiobj = document.getElementById("wangzhi"); if(wangzhiobj.value==""){document.getElementById("clabelwangzhi").innerHTML="&nbsp;&nbsp;<font color=red>请输入网址</font>";return false;}else{document.getElementById("clabelwangzhi").innerHTML="  "; } 	var wangzhiobj = document.getElementById("wangzhi"); if(wangzhiobj.value!=""){ if(/^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/.test(wangzhiobj.value)){document.getElementById("clabelwangzhi").innerHTML=""; }else{document.getElementById("clabelwangzhi").innerHTML="&nbsp;&nbsp;<font color=red>必需网址格式</font>"; return false;}}      


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
