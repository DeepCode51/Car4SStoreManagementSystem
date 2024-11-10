<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>购物车详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"gouwuche");
     %>
  购物车详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>编号：</td><td width='39%'><%=m.get("bianhao")%></td><td width='11%'>商品编号：</td><td width='39%'><%=m.get("shangpinbianhao")%></td></tr><tr><td width='11%'>商品名称：</td><td width='39%'><%=m.get("shangpinmingcheng")%></td><td width='11%'>商品类别：</td><td width='39%'><%=m.get("shangpinleibie")%></td></tr><tr><td width='11%'>品牌：</td><td width='39%'><%=m.get("pinpai")%></td><td width='11%'>库存：</td><td width='39%'><%=m.get("kucun")%></td></tr><tr><td width='11%'>销售价格：</td><td width='39%'><%=m.get("xiaoshoujiage")%></td><td width='11%'>数量：</td><td width='39%'><%=m.get("shuliang")%></td></tr><tr><td width='11%'>总金额：</td><td width='39%'><%=m.get("zongjine")%></td><td width='11%'>用户名：</td><td width='39%'><%=m.get("yonghuming")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



