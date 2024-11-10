<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=zijiayou.xls");
%>
<html>
  <head>
    <title>自驾游</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有自驾游列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>编号</td>
    <td bgcolor='#E6E6E6'>路线名称</td>
    <td bgcolor='#E6E6E6'>报名费用</td>
    <td bgcolor='#E6E6E6'>路线里程</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>图片</td>
    <td bgcolor='#E6E6E6'>报名人数</td>
    
    
    <td width="138" align="center" bgcolor='#E6E6E6'>添加时间</td>
    

  </tr>
  <% 

    String url = "zijiayou_list.jsp?1=1"; 
    String sql =  "select * from zijiayou where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("bianhao") %></td>
    <td><%=map.get("luxianmingcheng") %></td>
    <td><%=map.get("baomingfeiyong") %></td>
    <td><%=map.get("luxianlicheng") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    <td><%=map.get("baomingrenshu") %></td>
    
    
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

