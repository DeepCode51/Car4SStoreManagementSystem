<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>服务订单详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"fuwudingdan");
     %>
  服务订单详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>订单号：</td><td width='39%'><%=m.get("dingdanhao")%></td><td width='11%'>订单类型：</td><td width='39%'><%=m.get("dingdanleixing")%></td></tr><tr><td width='11%'>车牌号：</td><td width='39%'><%=m.get("chepaihao")%></td><td width='11%'>品牌：</td><td width='39%'><%=m.get("pinpai")%></td></tr><tr><td width='11%'>车辆名称：</td><td width='39%'><%=m.get("cheliangmingcheng")%></td><td width='11%'>车型：</td><td width='39%'><%=m.get("chexing")%></td></tr><tr><td width='11%'>用户名：</td><td width='39%'><%=m.get("yonghuming")%></td><td width='11%'>姓名：</td><td width='39%'><%=m.get("xingming")%></td></tr><tr><td width='11%'>联系电话：</td><td width='39%'><%=m.get("lianxidianhua")%></td><td width='11%'>员工工号：</td><td width='39%'><%=m.get("yuangonggonghao")%></td></tr><tr><td width='11%'>员工姓名：</td><td width='39%'><%=m.get("yuangongxingming")%></td><td width='11%'>明细表：</td><td width='39%'><a href="<%=m.get("mingxibiao")%>">点此下载</a></td></tr><tr><td width='11%'>总费用：</td><td width='39%'><%=m.get("zongfeiyong")%></td><td width='11%'>备注：</td><td width='39%'><%=m.get("beizhu")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



