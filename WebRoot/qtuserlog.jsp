 <%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
 <%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
	  <form action="jspmhz4sdglxthsg5684ANCE?ac=login&amp;a=a" method="post" name="f11" id="f11" style="display: inline">
 <table width='100%' height='302' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF' class='newsline'>
                              <tr>
                                <td height='48' colspan='4' style='padding-left:30px; font-size:20px;'><strong>用户登陆</strong></td>
                              </tr>
                              <tr>
                                <td width='40' height='28'>&nbsp;</td>
                                <td width='240' height='28'>用户名:</td>
                                <td height='28' colspan='2'><input name='username' type='text' id='username' placeholder='请输入用户名' class="user"  /></td>
                              </tr>
                              <tr>
                                <td height='28'>&nbsp;</td>
                             <td height='28'>密码:</td>
                                <td height='28' colspan='2'><input name='pwd1' type='password' id='pwd1' placeholder='请输入密码' class="user" /></td>
                              </tr>
                              <tr >
                                <td height='28'>&nbsp;</td>
                                <td height='28'>权限:</td>
                                <td height='28' colspan='2'><select name='cx' id='cx' class="xingbie" >
                                 
<option value='会员'>会员</option> 
                                </select></td>
                              </tr>
                              <tr >
                                <td height='28'>&nbsp;</td>
                                <td height='28'>验证码:</td>
                                <td width='67' height='28'><input name="pagerandom" type="text" id="pagerandom" class="password" /></td>
                                <td width='653'><a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle" /></a></td>
                              </tr>
                              <tr>
                                <td height='38' align='center'>&nbsp;</td>
                                <td height='38' align='center'>&nbsp;</td>
                                <td height='38' colspan='2'><input type='submit' name='Submit' value='登陆'  onclick='return checklog();' class='hsgqiehuanshitu'   />
                                  <input type='reset' name='Submit2' value='重置' class='hsgqiehuanshitu'   /></td>
                              </tr>
                            </table>
							 </form>
							 <script type="text/javascript">
 function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
function checklog()
{
	if(document.f11.username.value=="" || document.f11.pwd1.value=="" || document.f11.pagerandom.value=="")
	{
		alert("请输入完整");
		return false;
	}
}
  </script>
								  
<%}else{ %>

<table width='100%' height='300' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>
                            <tr>
                              <td height='28' align='left' style='padding-left:20px; font-size:20px;'>当前用户：<%=request.getSession().getAttribute("username")%></td>
                            </tr>
							 <tr>
                              <td height='28' align='left' style='padding-left:20px; font-size:20px;'>您的权限：<%=request.getSession().getAttribute("cx")%></td>
                            </tr>
                            <tr>
                              <td height='28' align='left' style='padding-left:20px; font-size:20px;'>欢迎您的到来!!!</td>
                            </tr>
                            <tr>
                              <td height='28' align='center'><input type='button' name='Submit3' value='退出' onclick="javascript:location.href='logout.jsp';"  />
                                  <input type='button' name='Submit22' value='个人后台' onclick="javascript:location.href='main.jsp';"  /></td>
                            </tr>
                          </table>
<%
}
%>
