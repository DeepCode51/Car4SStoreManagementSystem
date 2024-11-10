<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>俱乐部信息</title>
	
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

new CommDAO().update(request,response,"julebuxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"julebuxinxi"); 

%>
  <form  action="julebuxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改俱乐部信息:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
          <tr><td>俱乐部名称：</td><td><input name='julebumingcheng' type='text' id='julebumingcheng' value='<%= mmm.get("julebumingcheng")%>' class="form-control" /></td></tr>     <tr><td>创办人：</td><td><input name='chuangbanren' type='text' id='chuangbanren' value='<%= mmm.get("chuangbanren")%>' class="form-control" /></td></tr>     <tr><td>创办时间：</td><td><input name='chuangbanshijian' type='text' id='chuangbanshijian' value='<%= mmm.get("chuangbanshijian")%>' onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly='readonly' class="form-control"  /></td></tr>     <tr><td>联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='<%= mmm.get("lianxidianhua")%>' class="form-control" /></td></tr>     <tr><td>车友人数：</td><td><input name='cheyourenshu' type='text' id='cheyourenshu' value='<%= mmm.get("cheyourenshu")%>' class="form-control" /></td></tr>     <tr><td>地点：</td><td><input name='didian' type='text' id='didian' class="form-control"  style="width:600px;" value='<%=mmm.get("didian")%>' /></td></tr>     <tr><td>车队LOGO：</td><td><input name='cheduiLOGO' type='text' id='cheduiLOGO' size='50' value='<%= mmm.get("cheduiLOGO")%>' class="form-control" /> <div style="margin-top:16px;">&nbsp;<input type='button' value='上传' onClick="up('cheduiLOGO')"/></div></td></tr>     <tr><td>俱乐部简介：</td><td><textarea name='julebujianjie' cols='50' rows='5' id='julebujianjie' class="form-control" style="width:600px;height:80px;" ><%=mmm.get("julebujianjie")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


