<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>订单信息详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"dingdanxinxi");
     %>
  订单信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>订单号：</td><td width='39%'><%=m.get("dingdanhao")%></td>
     <td>用户名：</td>
     <td><%=m.get("yonghuming")%></td>
   </tr>
   <tr>
<td width='11%'>总金额：</td><td width='39%'><%=m.get("zongjine")%></td>
<td width='11%'>&nbsp;</td>
<td width='39%'>&nbsp;</td>
   </tr><tr>
<td width='11%'>姓名：</td><td width='39%'><%=m.get("xingming")%></td>
<td width='11%'>手机：</td><td width='39%'><%=m.get("shouji")%></td></tr><tr>
<td width='11%'>收货地址：</td><td width='39%'><%=m.get("shouhuodizhi")%></td>
<td width='11%'>状态：</td><td width='39%'><%=m.get("zhuangtai")%></td></tr><tr>
<td width='11%'>备注：</td><td width='39%'><%=m.get("beizhu")%></td>
<td>订单内容：</td>
<td><%=m.get("dingdanneirong")%></td>
</tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
  </table>

  </body>
</html>



