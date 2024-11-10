<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=julebuxinxi.xls");
%>
<html>
  <head>
    <title>俱乐部信息</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有俱乐部信息列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>俱乐部名称</td>
    <td bgcolor='#E6E6E6'>创办人</td>
    <td bgcolor='#E6E6E6' width='65' align='center'>创办时间</td>
    <td bgcolor='#E6E6E6'>联系电话</td>
    <td bgcolor='#E6E6E6'>车友人数</td>
    <td bgcolor='#E6E6E6'>地点</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>车队LOGO</td>
    
    
    <td width="138" align="center" bgcolor='#E6E6E6'>添加时间</td>
    

  </tr>
  <% 

    String url = "julebuxinxi_list.jsp?1=1"; 
    String sql =  "select * from julebuxinxi where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("julebumingcheng") %></td>
    <td><%=map.get("chuangbanren") %></td>
    <td><%=map.get("chuangbanshijian") %></td>
    <td><%=map.get("lianxidianhua") %></td>
    <td><%=map.get("cheyourenshu") %></td>
    <td><%=map.get("didian") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("cheduiLOGO") %>' target='_blank'><img src='<%=map.get("cheduiLOGO") %>' width=88 height=99 border=0 /></a></td>
    
    
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

