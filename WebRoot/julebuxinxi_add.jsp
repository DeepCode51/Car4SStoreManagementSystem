<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>俱乐部信息</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
  
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="julebuxinxi_add.jsp?id=<%=id%>";
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












new CommDAO().insert(request,response,"julebuxinxi",ext,true,false,""); 

}

%>

  <body >
 <form  action="julebuxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加俱乐部信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">俱乐部名称：</td><td><input name='julebumingcheng' type='text' id='julebumingcheng' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabeljulebumingcheng' /></td></tr>		<tr><td  width="200">创办人：</td><td><input name='chuangbanren' type='text' id='chuangbanren' value='' onblur='' class="form-control" /></td></tr>		<tr><td width="200">创办时间：</td><td><input name='chuangbanshijian' type='text' id='chuangbanshijian' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" class="form-control"  /></td></tr>		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabellianxidianhua' />必需电话格式[7或8位电话，或11位手机]</td></tr>		<tr><td  width="200">车友人数：</td><td><input name='cheyourenshu' type='text' id='cheyourenshu' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabelcheyourenshu' />必需数字型</td></tr>		<tr><td  width="200">地点：</td><td><input name='didian' type='text' id='didian' value='' onblur='' class="form-control" style="width:600px;" /></td></tr>		<tr><td  width="200">车队LOGO：</td><td><input name='cheduiLOGO' type='text' id='cheduiLOGO' size='50' value='' onblur='' class="form-control" /><div style="margin-top:12px;">&nbsp;<input type='button' value='上传' onClick="up('cheduiLOGO')"  /></div></td></tr>		<tr><td  width="200">俱乐部简介：</td><td><textarea name='julebujianjie'  id='julebujianjie' onblur='' class="form-control" style="width:600px;height:80px;" ></textarea></td></tr>		
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
 
	var julebumingchengobj = document.getElementById("julebumingcheng"); if(julebumingchengobj.value==""){document.getElementById("clabeljulebumingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入俱乐部名称</font>";return false;}else{document.getElementById("clabeljulebumingcheng").innerHTML="  "; } 	var lianxidianhuaobj = document.getElementById("lianxidianhua"); if(lianxidianhuaobj.value!=""){ if(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(lianxidianhuaobj.value) || /^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(lianxidianhuaobj.value)){document.getElementById("clabellianxidianhua").innerHTML=""; }else{document.getElementById("clabellianxidianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需电话格式[7或8位电话，或11位手机]</font>"; return false;}}      var cheyourenshuobj = document.getElementById("cheyourenshu"); if(cheyourenshuobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(cheyourenshuobj.value)){document.getElementById("clabelcheyourenshu").innerHTML=""; }else{document.getElementById("clabelcheyourenshu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}      


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
