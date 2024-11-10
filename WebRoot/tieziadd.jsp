<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>在线论坛</title>
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>
	<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
	 <link rel="stylesheet" href="./qtimages/sl_common_form.css">
	 
</head>
<script type="text/javascript" src="js/popup.js"></script>

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

 <% 
 if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
	return;
}
 String bk=request.getParameter("bk");
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
ext.put("fid",0);
}
new CommDAO().insert(request,response,"tiezi",ext,true,false,"bbs.jsp"); 
%>
<body>

<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			
			<div class="line">
				<h3>在线论坛<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				   <div class="content-form">
				 <table width="96%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" class="newsline" style="border-collapse:collapse">
                          <tr>
                            <td height="104" valign="top">
							
							  <form  action="tieziadd.jsp?f=f&bk=<%=bk%>"  method="post" name="form1"  onsubmit="return checkform();">
							<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                             
                                  <tr style="display:none">
                                    <td width="10%">板块：</td>
                                    <td width="90%"><input name='bankuai' type='text' id='bankuai' value="<%=bk%>" readonly="readonly" />
                                      &nbsp;* <label id='clabelbankuai' /></td>
                                  </tr>
                                  <tr>
                                    <td>标题：</td>
                                    <td><input name='biaoti' type='text' id='biaoti'  style="height:26px; width:350px;border-color: #333333;  background-color:#FFFFFF;  border-style:solid; border-width:1px;  border-radius:4px; " value='' size='50'  onblur='checkform()' />                                      &nbsp;* 
                                    <label id='clabelbiaoti' /></td>
                                  </tr>
                                  <tr>
                                    <td>类型：</td>
                                    <td><input name="leixing" type="radio" value="putong" checked>
                                        <img src="bbs/putong.gif" width="18" height="18"> 普通
                                      <input type="radio" name="leixing" value="jiaji">
                                        <img src="bbs/jiaji.gif" width="18" height="18"> 加急
                                      <input type="radio" name="leixing" value="qiuzhu">
                                        <img src="bbs/qiuzhu.gif" width="18" height="18"> 求助
                                      <input type="radio" name="leixing" value="tuijian">
                                        <img src="bbs/tuijian.gif" width="15" height="17"> 推荐</td>
                                  </tr>
                                  <tr>
                                    <td>内容：</td>
                                    <td><textarea name="neirong" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
                                    <label id='clabelneirong' /></td>
                                  </tr>
                                  <tr style="display:none">
                                    <td>附件：</td>
                                    <td><input name="fujian" type="text" id="fujian" size="50">
                                     <input type='button' value='上传' onClick="up('fujian')" style='border:solid 1px #000000; color:#666666'/></td>
                                  </tr>
                                  <tr style="display:none">
                                    <td>发帖人：</td>
                                    <td><input name='faburen' type='text' id='faburen' value='<%=request.getSession().getAttribute("username")%>' /></td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td><input type="hidden" name="addnew" value="1" />
									
									<input type="hidden" name="cx" value="<%=request.getSession().getAttribute("cx")%>" />
                                        <input type="submit" name="Submit" value="发布" class='hsgqiehuanshitu' onClick="return checkform();" />
                                 </td>
                                  </tr>
                              
                            </table>
							  </form>
							</td>
                          </tr>
                          <tr>
                            <td align="right"><input type=button name=Submit52 value=返回 class='hsgqiehuanshitu'  onClick="javascript:location.href='bbs.jsp';"  /></td>
                          </tr>
                        </table>
					</div>
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>
</body></html>
<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var bankuaiobj = document.getElementById("bankuai"); if(bankuaiobj.value==""){document.getElementById("clabelbankuai").innerHTML="&nbsp;&nbsp;<font color=red>请输入版块</font>";return false;}else{document.getElementById("clabelbankuai").innerHTML="  "; } 
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 
	var neirongobj = document.getElementById("neirong"); if(neirongobj.value==""){document.getElementById("clabelneirong").innerHTML="&nbsp;&nbsp;<font color=red>请输入内容</font>";return false;}else{document.getElementById("clabelneirong").innerHTML="  "; } 


return true;   
}   
popheight=450;
</script>  

