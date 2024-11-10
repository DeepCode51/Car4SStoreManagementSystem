<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆信息详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"cheliangxinxi");
     %>
  车辆信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%' height=44>品牌：</td><td width='39%'><%=m.get("pinpai")%></td><td  rowspan=7 align=center><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>车辆名称：</td><td width='39%'><%=m.get("cheliangmingcheng")%></td></tr><tr><td width='11%' height=44>车型：</td><td width='39%'><%=m.get("chexing")%></td></tr><tr><td width='11%' height=44>驱动方式：</td><td width='39%'><%=m.get("qudongfangshi")%></td></tr><tr><td width='11%' height=44>排量：</td><td width='39%'><%=m.get("pailiang")%></td></tr><tr><td width='11%' height=44>价格：</td><td width='39%'><%=m.get("jiage")%></td></tr><tr><td width='11%' height=44>换档方式：</td><td width='39%'><%=m.get("huandangfangshi")%></td></tr><tr><td width='11%' height=100  >车辆简介：</td><td width='39%' colspan=2 height=100 ><%=m.get("cheliangjianjie")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



