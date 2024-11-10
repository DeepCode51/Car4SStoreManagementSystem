<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>服务预约详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"fuwuyuyue");
     %>
  服务预约详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>预约单号：</td><td width='39%'><%=m.get("yuyuedanhao")%></td><td width='11%'>预约日期：</td><td width='39%'><%=m.get("yuyueriqi")%></td></tr><tr><td width='11%'>预约类型：</td><td width='39%'><%=m.get("yuyueleixing")%></td><td width='11%'>车牌号：</td><td width='39%'><%=m.get("chepaihao")%></td></tr><tr><td width='11%'>品牌：</td><td width='39%'><%=m.get("pinpai")%></td><td width='11%'>车辆名称：</td><td width='39%'><%=m.get("cheliangmingcheng")%></td></tr><tr><td width='11%'>车型：</td><td width='39%'><%=m.get("chexing")%></td><td width='11%'>驱动方式：</td><td width='39%'><%=m.get("qudongfangshi")%></td></tr><tr><td width='11%'>换挡方式：</td><td width='39%'><%=m.get("huandangfangshi")%></td><td width='11%'>用户名：</td><td width='39%'><%=m.get("yonghuming")%></td></tr><tr><td width='11%'>姓名：</td><td width='39%'><%=m.get("xingming")%></td><td width='11%'>联系电话：</td><td width='39%'><%=m.get("lianxidianhua")%></td></tr><tr><td width='11%'>状态：</td><td width='39%'><%=m.get("zhuangtai")%></td><td width='11%'>情况备注：</td><td width='39%'><%=m.get("qingkuangbeizhu")%></td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



