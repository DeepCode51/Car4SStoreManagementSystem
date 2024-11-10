<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>用户注册</title>
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
 <% 
HashMap ext = new HashMap(); 
ext.put("issh","是"); 
new CommDAO().insert(request,response,"yonghuzhuce",ext,true,false,"index.jsp"); 
%>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>专业的服务 一流的水平</em>
			<div class="line">
				<h3>用户注册<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  
				  <div class="content-form">
				<form  action="userreg.jsp?f=f"  method="post" name="f1"  onsubmit="return checkform();">
					<table width="98%" height="667" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#58AC22" style="border-collapse:collapse" class="newsline">
                         
                            <tr>
                              <td width="15%" align="center">用户名：</td>
                              <td colspan="2" align="left"><input name='yonghuming' type='text' id='yonghuming' value='' onblur='checkform()'  class="user" style="width:200px;" /><label id='clabelyonghuming' />
                              &nbsp;*</td>
                            </tr>
                            <tr>
                              <td align="center">密码：</td>
                              <td width="27%" align="left"><input name='mima' type='password' id='mima' value='' onblur='checkform()' class="password" /><label id='clabelmima' />
                                &nbsp;* 
                              </td>
                              <td width="58%" align="left">确认密码：
                              <input name='mima2' type='password' id='mima2' value='' onblur='checkform()' class="password" >  <label id='clabelmima2' /> </td>
                            </tr>
                            <tr>
                              <td align="center">姓名：</td>
                              <td colspan="2" align="left"><input name='xingming' type='text' id='xingming' value='' onblur='checkform()' class="user"  style="width:200px;"  /><label id='clabelxingming' />
                              &nbsp;*</td>
                            </tr>
                            <tr>
                              <td align="center">性别：</td>
                              <td colspan="2" align="left"><select name='xingbie' id='xingbie' class="xingbie">
                                  <option value="男">男</option>
                                  <option value="女">女</option>
                              </select></td>
                            </tr>
                            <tr>
                              <td align="center">出生年月：</td>
                              <td colspan="2" align="left"><input name='chushengnianyue' type='text' id='chushengnianyue' value='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})"  class="user" style="width:160px;" /></td>
                            </tr>
                            <tr>
                              <td align="center">QQ：</td>
                              <td colspan="2" align="left"><input name='QQ' type='text' id='QQ' value='' onblur='checkform()' class="user" style="width:200px;" /> <label id='clabelQQ' /></td>
                            </tr>
                            <tr>
                              <td align="center">邮箱：</td>
                              <td colspan="2" align="left"><input name='youxiang' type='text' id='youxiang' value='' onblur='checkform()' class="user" style="width:200px;" /> <label id='clabelyouxiang' /></td>
                            </tr>
                            <tr>
                              <td align="center">手机：</td>
                              <td colspan="2" align="left"><input name='dianhua' type='text' id='dianhua' value='' onblur='checkform()' class="user" style="width:200px;" /> <label id='clabeldianhua' /></td>
                            </tr>
                            <tr>
                              <td align="center">身份证：</td>
                              <td colspan="2" align="left"><input name='shenfenzheng' type='text' id='shenfenzheng' value='' onblur='checkform()' class="user" /> <label id='clabelshenfenzheng' /> </td>
                            </tr>
                            <tr>
                              <td align="center">头像：</td>
                              <td colspan="2" align="left"><input name='touxiang' type='text' id='touxiang' size='50' value='' class="user" />
                                &nbsp;
                              <input name="button" type='button' onClick="up('touxiang')" value='上传' class='hsgqiehuanshitu'  /></td>
                            </tr>
                            <tr>
                              <td align="center">地址：</td>
                              <td colspan="2" align="left"><input name='dizhi' type='text' id='dizhi' value='' size='50' class="user" /></td>
                            </tr>
                            <tr>
                              <td align="center">备注：</td>
                              <td colspan="2" align="left"><textarea name='beizhu' cols='50' rows='5' id='beizhu' class="user" ></textarea></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2" align="left"><input type="submit" name="Submit5" value="提交" onClick="return checkform();" class='hsgqiehuanshitu'  />
                              <input type="reset" name="Submit22" value="重置" class='hsgqiehuanshitu'  /></td>
                            </tr>
							
        </table>
				   </form>	
					  
					</div>
					
					
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>
</body></html>
<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script type="text/javascript" src="js/popup.js"></script>
<script language=javascript src='js/ajax.js'></script>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<script language=javascript >  
 function checkform(){  
var yonghumingobj = document.getElementById("yonghuming");  
if(yonghumingobj.value==""){  
document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";  
return false;  
}else{
document.getElementById("clabelyonghuming").innerHTML="  ";  
}  
  
var yonghumingobj = document.getElementById("yonghuming");  
if(yonghumingobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=yonghuzhuce&col=yonghuming&value="+yonghumingobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";  
return false;
}else{document.getElementById("clabelyonghuming").innerHTML="  ";  
}  
}  
var mimaobj = document.getElementById("mima");  
if(mimaobj.value==""){  
document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";  
return false;  
}else{
document.getElementById("clabelmima").innerHTML="  ";  
}  

var mima2obj = document.getElementById("mima2");  
if(mima2obj.value==""){  
document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>请再次输入密码</font>";  
return false;  
}else{
document.getElementById("clabelmima2").innerHTML="  ";  
}

if(mima2obj.value!=mimaobj.value){  
document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>两次密码输入不一致</font>";  
return false;  
}else{
document.getElementById("clabelmima2").innerHTML="  ";  
}
 
  
var xingmingobj = document.getElementById("xingming");  
if(xingmingobj.value==""){  
document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";  
return false;  
}else{
document.getElementById("clabelxingming").innerHTML="  ";  
}  


var QQobj = document.getElementById("QQ");  
if(QQobj.value!=""){  
if(QQobj.value.length>12||isNaN(QQobj.value)){ 
document.getElementById("clabelQQ").innerHTML="&nbsp;&nbsp;<font color=red>联系QQ必须为12位以内数字</font>";  
return false;
}else{  
document.getElementById("clabelQQ").innerHTML="";  
}  
}  

var youxiangobj = document.getElementById("youxiang");  
if(youxiangobj.value!=""){  
if(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(youxiangobj.value))
{ 
document.getElementById("clabelyouxiang").innerHTML="";  
}else{  
document.getElementById("clabelyouxiang").innerHTML="&nbsp;&nbsp;<font color=red>必需邮箱格式</font>";  
return false;
}  
}  
  
var dianhuaobj = document.getElementById("dianhua");  
if(dianhuaobj.value!=""){  
if(/^1[3|4|5|6|7|8|9][0-9]\d{4,8}$/.test(dianhuaobj.value) ||  /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(dianhuaobj.value))
{ 
document.getElementById("clabeldianhua").innerHTML="";  
}else{  
document.getElementById("clabeldianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需手机(11位)或电话(7或8位数)格式</font>";  
return false;
}  
}

var shenfenzhengobj = document.getElementById("shenfenzheng");  
if(shenfenzhengobj.value!=""){  
if(/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(shenfenzhengobj.value))
{ 
document.getElementById("clabelshenfenzheng").innerHTML="";  
}else{  
document.getElementById("clabelshenfenzheng").innerHTML="&nbsp;&nbsp;<font color=red>必需身份证格式</font>";  
return false;
}  
}  
return true;   
}   
popheight=850;
</script>  
