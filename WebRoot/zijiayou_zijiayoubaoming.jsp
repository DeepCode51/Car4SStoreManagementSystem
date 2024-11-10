<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>自驾游</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有自驾游列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  路线名称：<input name="luxianmingcheng" type="text" id="luxianmingcheng" class="form-control2"  />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='zijiayou_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" height="50" align="center" bgcolor="#E6E6E6">序号</td>
    <td bgcolor='#E6E6E6'>编号</td>
    <td bgcolor='#E6E6E6'>路线名称</td>
    <td bgcolor='#E6E6E6'>报名费用</td>
    <td bgcolor='#E6E6E6'>路线里程</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>图片</td>
    <td bgcolor='#E6E6E6'>报名人数</td>
    
    
	<td width="90" align="center" bgcolor="#E6E6E6">评论管理</td>
    <td width="138" height="50" align="center" bgcolor="#E6E6E6">添加时间</td>
    
    <td width="60" height="50" align="center" bgcolor="#E6E6E6">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"zijiayou"); 
    String url = "zijiayou_list.jsp?1=1"; 
    String sql =  "select * from zijiayou where 1=1";
	
if(request.getParameter("luxianmingcheng")=="" ||request.getParameter("luxianmingcheng")==null ){}else{sql=sql+" and luxianmingcheng like '%"+request.getParameter("luxianmingcheng")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr <%
  	if((i % 2)==0)
	{
		out.print("bgcolor='#F0F0F0'");
	}
	else
	{
		out.print("bgcolor='#FFFFFF'");
	}
	
	if((i % 2)==0)
	{
		%> onmouseover="this.style.backgroundColor='#F9DFEB'" onmouseout="this.style.backgroundColor='#F0F0F0'" <%
	}
	else
	{
		%> onmouseover="this.style.backgroundColor='#F9DFEB'" onmouseout="this.style.backgroundColor='#FFFFFF'" <%
	}
	
  %>>
    <td width="30" height="50" align="center"><%=i %></td>
    <td><%=map.get("bianhao") %></td>
    <td><%=map.get("luxianmingcheng") %></td>
    <td><%=map.get("baomingfeiyong") %></td>
    <td><%=map.get("luxianlicheng") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    <td><%=map.get("baomingrenshu") %></td>
    
    
	<td width="90" align="center"><a class="btn btn-info btn-small" href="pinglun_list.jsp?id=<%=map.get("id")%>&biao=zijiayou">评论管理</a></td>
    <td width="138" height="50" align="center"><%=map.get("addtime") %></td>
    <td width="60" height="50" align="center"><a class="btn btn-info btn-small" href='zijiayoubaoming_add.jsp?id=<%=map.get("id")%>'>添加自驾游报名</a> <a class="btn btn-info btn-small" href="zijiayoudetail.jsp?id=<%=map.get("id")%>" target="_blank"> <i class="glyphicon glyphicon-random" > </i> 详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>


