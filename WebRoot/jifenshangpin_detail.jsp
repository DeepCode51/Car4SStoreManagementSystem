<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>积分商品详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"jifenshangpin");
     %>
  积分商品详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%' height=44>商品编号：</td><td width='39%'><%=m.get("shangpinbianhao")%></td>
<td  rowspan=6 align=center><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr>
<td width='11%' height=44>商品名称：</td><td width='39%'><%=m.get("shangpinmingcheng")%></td>
</tr><tr>
<td width='11%' height=44>商品类别：</td><td width='39%'><%=m.get("shangpinleibie")%></td>
</tr><tr>
<td width='11%' height=44>品牌：</td><td width='39%'><%=m.get("pinpai")%></td>
</tr><tr>
<td width='11%' height=44>所需积分：</td><td width='39%'><%=m.get("suoxujifen")%></td>
</tr><tr>
<td width='11%' height=47>销量：</td>
<td width='39%'><%=m.get("xiaoliang")%></td>
</tr>
<tr>


<td width='11%' height=100  >商品简介：</td><td width='39%' colspan=2 height=100 ><%=m.get("shangpinjianjie")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
  </table>

  </body>
</html>



