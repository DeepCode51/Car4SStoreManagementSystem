<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
 String lb=request.getParameter("lb");
  //String lb=new String(request.getParameter("lb").getBytes("8859_1"));

HashMap ext = new HashMap(); 
//ext.put("issh","否"); 
new CommDAO().insert(request,response,"xinwentongzhi",ext,true,false,"xinwentongzhi_add.jsp?lb="+lb); 
%>
<html>
  <head>
    
    <title>新闻通知</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor_a5/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="neirong"]', {
				cssPath : 'kindeditor_a5/plugins/code/prettify.css',
				uploadJson : 'kindeditor_a5/jsp/upload_json.jsp',
				fileManagerJson : 'kindeditor_a5/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
	
  </head>
<script language="javascript">
function check()
{
	if(document.form1.biaoti.value==""){bootbox.alert("请输入标题");document.form1.biaoti.focus();return false;}
	if(document.form1.leibie.value==""){bootbox.alert("请输入类别");document.form1.leibie.focus();return false;}
	if(document.form1.tianjiaren.value==""){bootbox.alert("请输入添加人");document.form1.tianjiaren.focus();return false;}
	if(document.form1.dianjilv.value==""){bootbox.alert("请输入点击率");document.form1.dianjilv.focus();return false;}
}

</script>
 <%
 
%>
  <body >
 <form  action="xinwentongzhi_add.jsp?f=f"  method="post" name="f1"  onsubmit="return checkform();">
  添加<%=lb%>:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
    <tr><td>标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' placeholder="请输入标题" class="form-control" style="width:600px;" /><div style="margin-top:16px;">&nbsp;*</div></td></tr>
	<tr><td>类别：</td>
	  <td><input name="leibie" type="text" id="leibie" value="<%=lb%>" class="form-control">	    <input name="lb" type="hidden" id="lb" value="<%=lb%>">	 
      &nbsp;* </td>
	</tr>
	<tr><td>内容：</td><td><textarea name="neirong" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea></td></tr>
	<tr><td>添加人：</td><td><input name='tianjiaren' type='text' id='tianjiaren' class="form-control" value='<%=request.getSession().getAttribute("username")%>' /><div style="margin-top:16px;">&nbsp;*</div></td></tr>
	<tr><td>首页图片：</td><td><input name='shouyetupian' type='text' id='shouyetupian' size='50' value='' class="form-control" /><div style="margin-top:16px;">&nbsp;<input type='button' value='上传' onClick="up('shouyetupian')"/></div></td></tr>
	<tr><td>点击率：</td><td><input name='dianjilv' type='text' id='dianjilv' value='1' class="form-control" /><div style="margin-top:16px;">&nbsp;*</div></td></tr>
    <tr>
      <td height="45">&nbsp;</td>
      <td height="45"><input type="submit" name="Submit" value="提交" onClick="return check();" class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>
<script type="text/javascript" src="js/popup.js"></script>
