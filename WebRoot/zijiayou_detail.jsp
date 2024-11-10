<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>自驾游详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"zijiayou");
     %>
  自驾游详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%' height=44>编号：</td><td width='39%'><%=m.get("bianhao")%></td><td  rowspan=5 align=center><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>路线名称：</td><td width='39%'><%=m.get("luxianmingcheng")%></td></tr><tr><td width='11%' height=44>报名费用：</td><td width='39%'><%=m.get("baomingfeiyong")%></td></tr><tr><td width='11%' height=44>路线里程：</td><td width='39%'><%=m.get("luxianlicheng")%></td></tr><tr><td width='11%' height=44>报名人数：</td><td width='39%'><%=m.get("baomingrenshu")%></td></tr><tr><td width='11%' height=100  >简介：</td><td width='39%' colspan=2 height=100 ><%=m.get("jianjie")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



