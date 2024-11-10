<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>俱乐部活动详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"julebuhuodong");
     %>
  俱乐部活动详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>活动名称：</td><td width='39%'><%=m.get("huodongmingcheng")%></td><td width='11%'>俱乐部名称：</td><td width='39%'><%=m.get("julebumingcheng")%></td></tr><tr><td width='11%'>联系电话：</td><td width='39%'><%=m.get("lianxidianhua")%></td><td width='11%'>活动时间：</td><td width='39%'><%=m.get("huodongshijian")%></td></tr><tr><td width='11%'>活动地点：</td><td width='39%'><%=m.get("huodongdidian")%></td><td width='11%'>活动简介：</td><td width='39%'><%=m.get("huodongjianjie")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



