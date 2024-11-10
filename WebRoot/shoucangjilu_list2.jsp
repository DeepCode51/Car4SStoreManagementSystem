<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的收藏</title>
<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
</head>

<body>

<p>我的收藏：</p>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr height="30px">
    <td width="25" height="76" bgcolor="#E6E6E6">序号</td>
    <td width="790" bgcolor="#E6E6E6">标题 </td>
    <td width="135" align="center" bgcolor="#E6E6E6">收藏时间</td>
    <td width="75" align="center" bgcolor="#E6E6E6">操作</td>
  </tr>
 <% 
 new CommDAO().delete(request,"shoucangjilu"); 
    String url = "shoucangjilu_list2.jsp?1=1"; 
    String sql =  "select * from shoucangjilu where username='"+request.getSession().getAttribute("username")+"'";

    sql+=" order by id desc";
	//out.print(sql);
	ArrayList<HashMap> list = PageManager.getPages(url,20,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>  <tr >
    <td width="25"><%=i %></td>
    <td height="44"><%
	 HashMap m = new CommDAO().getmap((String)map.get("xwid"),(String)map.get("biao"));
	 out.print(m.get((String)map.get("ziduan")));
	%></td>
    <td width="135" align="center"><%=map.get("addtime")%></td>
    <td width="75" align="center"><a class="btn btn-info btn-small" href="shoucangjilu_list2.jsp?scid=<%=map.get("id")%>" onclick="return confirm('真的要删除？')" >删除</a>
	<%
	if (map.get("biao").equals("xinwentongzhi"))
	{
	%>
	 <a class="btn btn-info btn-small" href="gg_detail.jsp?id=<%=map.get("xwid")%>" target="_blank">详细</a>
	 <%
	}
	else
	{
	%>
	 <a class="btn btn-info btn-small" href="<%=map.get("biao")%>detail.jsp?id=<%=map.get("xwid")%>" target="_blank">详细</a>
	 <%
	 }
	 %>
    </td>
  </tr>
  <%
  }
   %>
</table>

  <p class="fy">${page.info } </p> 


</body>
</html>

