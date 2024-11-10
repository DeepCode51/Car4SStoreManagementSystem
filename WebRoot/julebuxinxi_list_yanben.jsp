<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>俱乐部信息</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有俱乐部信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  俱乐部名称：<input name="julebumingcheng" type="text" id="julebumingcheng" class="form-control2"  />  地点：<input name="didian" type="text" id="didian" class="form-control2"  />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='julebuxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" height="50" align="center" bgcolor="#E6E6E6">序号</td>
    <td bgcolor='#E6E6E6'>俱乐部名称</td>
    <td bgcolor='#E6E6E6'>创办人</td>
    <td bgcolor='#E6E6E6' width='65' align='center'>创办时间</td>
    <td bgcolor='#E6E6E6'>联系电话</td>
    <td bgcolor='#E6E6E6'>车友人数</td>
    <td bgcolor='#E6E6E6'>地点</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>车队LOGO</td>
    
    
	<td width="90" align="center" bgcolor="#E6E6E6">评论管理</td>
    <td width="138" height="50" align="center" bgcolor="#E6E6E6">添加时间</td>
    
    <td width="60" height="50" align="center" bgcolor="#E6E6E6">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"julebuxinxi"); 
    String url = "julebuxinxi_list.jsp?1=1"; 
    String sql =  "select * from julebuxinxi where 1=1";
	
if(request.getParameter("julebumingcheng")=="" ||request.getParameter("julebumingcheng")==null ){}else{sql=sql+" and julebumingcheng like '%"+request.getParameter("julebumingcheng")+"%'";}
if(request.getParameter("didian")=="" ||request.getParameter("didian")==null ){}else{sql=sql+" and didian like '%"+request.getParameter("didian")+"%'";}
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
    <td><%=map.get("julebumingcheng") %></td>
    <td><%=map.get("chuangbanren") %></td>
    <td><%=map.get("chuangbanshijian") %></td>
    <td><%=map.get("lianxidianhua") %></td>
    <td><%=map.get("cheyourenshu") %></td>
    <td><%=map.get("didian") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("cheduiLOGO") %>' target='_blank'><img src='<%=map.get("cheduiLOGO") %>' width=88 height=99 border=0 /></a></td>
    
    
	<td width="90" align="center"><a class="btn btn-info btn-small" href="pinglun_list.jsp?id=<%=map.get("id")%>&biao=julebuxinxi">评论管理</a></td>
    <td width="138" height="50" align="center"><%=map.get("addtime") %></td>
    <td width="60" height="50" align="center"><!--lianjie1--> <a class="btn btn-info btn-small" href="julebuxinxidetail.jsp?id=<%=map.get("id")%>" target="_blank"> <i class="glyphicon glyphicon-random" > </i> 详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

