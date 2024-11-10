<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
	<div class="top"> 
	<div class="container">
		<p class="fl">欢迎访问：杭州4s店管理系统</p>
        <p class="fl" style="font-size:15px">
        &nbsp;&nbsp;&nbsp;
		  <%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
        <a href="userlog.jsp" >登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="huiyuanxinxiadd.jsp" >会员注册</a>
		  <%}else{ %>
	  <%=request.getSession().getAttribute("username")%>,[<%=request.getSession().getAttribute("cx")%>]&nbsp; <a href="logout.jsp" onclick="return confirm('确定要退出？')" >退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="main.jsp" >后台</a>
	    <%} %>
        
		<div class="fr">
			<ul> </li>
			</ul>
		</div>
	</div>
</div>
<div class="head">
	<div class="container">
		<div class="logo fl">
			<a href="index.jsp"><h1 style="float:left"><img src="qtimages/gg.jpg" height="50" width="128" ></h1>
			</a>
         <p style="margin-top:10px; float:left; margin-left:20px; font-size:18px; color:#900">杭州4s店管理系统</p>
		</div>
		 
	</div>
</div>
<div class="nav">
	<div class="container c">
		<div class="nav-list fr">
    			<ul id="nav">
					<li ><a href="index.jsp">网站首页</a></li>
					<li><a href='fuwuyuyueadd.jsp'>服务预约</a></li>
 <li><a style="cursor:pointer">商城活动</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='shangpinxinxilisttp.jsp'>在线商城</a></em> 	<em><a href='jifenshangpinlisttp.jsp'>积分兑换</a></em>  <em><a href='zijiayoulist.jsp'>自驾游</a></em> 
							</dl>
					</li>

		 			<li><a style="cursor:pointer">俱乐部</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='julebuxinxilist.jsp'>俱乐部信息</a></em>  <em><a href='julebuhuodonglist.jsp'>俱乐部活动</a></em> 
							</dl>
					</li>  <li><a style="cursor:pointer">车型信息</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='cheliangxinxilist.jsp'>车辆信息</a></em> 
							</dl>
					</li><li><a style="cursor:pointer">优秀员工</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='yuangongxinxilist.jsp'>优秀员工</a></em> 
							</dl>
					</li><li><a style="cursor:pointer">新闻资讯</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='news.jsp?lb=新闻资讯'>新闻资讯</a></em> 
							</dl>
					</li><li><a style="cursor:pointer">系统概要</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='dx_detail.jsp?lb=公司介绍'>公司介绍</a></em> <em><a href='dx_detail.jsp?lb=联系我们'>联系我们</a></em> 
							</dl>
					</li>
					<li><a style="cursor:pointer">在线论坛</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='bbs.jsp'>在线论坛</a></em>  
							</dl>
					</li>
					<!--yoxulixuyaxn-->
					<li><a href="login.jsp">后台管理</a></li>
				</ul>
		</div>
	</div>
</div>
<script>
	jQuery("#nav li:has(dl)").hover(function(){  
	   jQuery(this).children("dl").stop(true,true).slideDown(400); 
	  },function(){  
	   jQuery(this).children("dl").stop(true,true).slideUp("fast");  
	});
</script>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("验证码错误");
 <%}%>
 </script>
