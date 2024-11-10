<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>留言板</title>
     <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

<body >
  <p>已有留言板列表：</p>


<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
  <tr>
    <td width="4%" height="30" bgcolor='#E6E6E6'>序号</td>
    <td width="12%" height="30" bgcolor='#E6E6E6'>昵称</td>
    <td width="4%" height="30" bgcolor='#E6E6E6'>头像</td>
    <td width="10%" height="30" bgcolor='#E6E6E6'>QQ</td>
    <td width="11%" height="30" bgcolor='#E6E6E6'>邮箱</td>
    <td width="16%" height="30" bgcolor='#E6E6E6'>电话</td>
    <td width="12%" height="30" bgcolor='#E6E6E6'>内容</td>
    <td width="12%" height="30" bgcolor='#E6E6E6'>添加时间</td>
    
    <td width="11%" height="30" bgcolor='#E6E6E6'>回复内容</td>
    <td width="150" height="30" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
  <% 
   new CommDAO().delete(request,"liuyanban"); 
    String url = "liuyanban_list.jsp?1=1"; 
    String sql =  "select * from liuyanban where 1=1 ";
    sql+=" order by id desc";
	//out.print(sql);
	ArrayList<HashMap> list = PageManager.getPages(url,10,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
  <tr>
    <td height="45"><%=i %></td>
    <td height="45"><%=map.get("cheng") %></td><td height="45"><%= map.get("xingbie") %></td><td height="45"><%= map.get("QQ") %></td><td height="45"><%= map.get("youxiang") %></td><td height="45"><%= map.get("dianhua") %></td>
    <td height="45"><%= map.get("neirong") %></td>
    <td height="45"><%= map.get("addtime") %></td>
    <td height="45"><%= map.get("huifuneirong") %></td>
    <td width="150" height="45" align="center">  <a class="btn btn-info btn-small"  href="liuyanban_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a class="btn btn-info btn-small"  href="hf.jsp?id=<%=map.get("id")%>">回复</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条,<a class="btn btn-info btn-small"  style="cursor:pointer" onClick="javascript:window.print();">打印本页</a>
</body>
</html>

