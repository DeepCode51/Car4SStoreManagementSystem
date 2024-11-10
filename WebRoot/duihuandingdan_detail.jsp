<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>兑换订单详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"duihuandingdan");
     %>
  兑换订单详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>商品编号：</td><td width='44%'><%=m.get("shangpinbianhao")%></td>
<td width="45%" colspan="2" rowspan="11" align="center"><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr>
<td width='11%'>商品名称：</td><td width='44%'><%=m.get("shangpinmingcheng")%></td>
</tr><tr>
<td width='11%'>品牌：</td><td width='44%'><%=m.get("pinpai")%></td>
</tr><tr>
<td width='11%'>所需积分：</td><td width='44%'><%=m.get("suoxujifen")%></td>
</tr><tr>
<td width='11%'>兑换数量：</td><td width='44%'><%=m.get("shuliang")%></td>
</tr>
<tr>
  <td>共计积分：</td>
  <td><%=m.get("gongjijifen")%></td>
  </tr>
<tr>
  <td>用户名：</td>
  <td><%=m.get("yonghuming")%></td>
  </tr>
<tr>
  <td>姓名：</td>
  <td><%=m.get("xingming")%></td>
  </tr>
<tr>
  <td>积分：</td>
  <td><%=m.get("jifen")%></td>
  </tr>
<tr>
  <td>手机：</td>
  <td><%=m.get("shouji")%></td>
  </tr>
<tr>
  <td>地址：</td>
  <td><%=m.get("dizhi")%></td>
  </tr>
<tr>
  <td>备注;</td>
  <td colspan="3"><%=m.get("beizhu")%></td>
  </tr>
<tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
  </table>

  </body>
</html>



