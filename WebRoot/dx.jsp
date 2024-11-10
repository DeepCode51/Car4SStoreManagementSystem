<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>javascript:alert('对不起，请您先登录！');history.back();</script>");
	out.close();
}
%>
<html>
  <head>
    
    <title>dx</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor_a5/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
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

  <body >
  <%
  String lb=request.getParameter("lb");
   %>
 
  编辑<%=lb%>:
  <br><br>
  <%
  
  String url="dx.jsp?lb="+lb;
  HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"dx",ext,true,false,""); 

String sql="select * from dx where leibie='"+lb+"'";
ArrayList<HashMap> list = PageManager.getPages(url,20,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	}
	if(i==0)
	{
		sql="insert into dx(leibie,content) values('"+lb+"','"+lb+"')";
		 new CommDAO().commOper(sql); 
		 	out.print("<script>javascript:location.href='dx.jsp?lb="+lb+"';</script>");
	}
	else
	{
	
HashMap m = new CommDAO().getmaps("leibie",lb,"dx");
  
 
  
  
   %>
  <form  action="dx.jsp?f=f&id=<%=m.get("id")%>&lb=<%=lb%>"  method="post" name="f1" >
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
     
     <tr><td>内容：</td><td><textarea name="content" cols="100" rows="8" style="width:700px;height:400px;visibility:hidden;"><%=m.get("content")%></textarea>
			<input name="lb" type="hidden" id="lb" value="<%=m.get("leibie")%>"></td></tr>
     
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="确定编辑" class="btn btn-info btn-small" onClick="return check();" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>
<%
}
%>
  </body>
</html>


