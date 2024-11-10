<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>自驾游报名详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"zijiayoubaoming");
     %>
  自驾游报名详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>订单号：</td><td width='39%'><%=m.get("dingdanhao")%></td><td width='11%'>编号：</td><td width='39%'><%=m.get("bianhao")%></td></tr><tr><td width='11%'>路线名称：</td><td width='39%'><%=m.get("luxianmingcheng")%></td><td width='11%'>报名费用：</td><td width='39%'><%=m.get("baomingfeiyong")%></td></tr><tr><td width='11%'>路线里程：</td><td width='39%'><%=m.get("luxianlicheng")%></td><td width='11%'>用户名：</td><td width='39%'><%=m.get("yonghuming")%></td></tr><tr><td width='11%'>姓名：</td><td width='39%'><%=m.get("xingming")%></td><td width='11%'>性别：</td><td width='39%'><%=m.get("xingbie")%></td></tr><tr><td width='11%'>电话：</td><td width='39%'><%=m.get("dianhua")%></td><td width='11%'>车牌号：</td><td width='39%'><%=m.get("chepaihao")%></td></tr><tr><td width='11%'>车辆型号：</td><td width='39%'><%=m.get("cheliangxinghao")%></td><td width='11%'>备注：</td><td width='39%'><%=m.get("beizhu")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



