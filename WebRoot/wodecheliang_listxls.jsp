<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=wodecheliang.xls");
%>
<html>
  <head>
    <title>我的车辆</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有我的车辆列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc" >  
  <tr>
    <td width="30" align="center" bgcolor="cccccc">序号</td>
    <td bgcolor='#E6E6E6'>车牌号</td>    <td bgcolor='#E6E6E6'>品牌</td>    <td bgcolor='#E6E6E6'>车辆名称</td>    <td bgcolor='#E6E6E6'>车型</td>    <td bgcolor='#E6E6E6'>驱动方式</td>    <td bgcolor='#E6E6E6'>排量</td>    <td bgcolor='#E6E6E6'>换挡方式</td>    <td bgcolor='#E6E6E6' width='90' align='center'>图片</td>    <td bgcolor='#E6E6E6'>总里程</td>    <td bgcolor='#E6E6E6'>电压</td>    <td bgcolor='#E6E6E6'>机油</td>    <td bgcolor='#E6E6E6'>用户名</td>    <td bgcolor='#E6E6E6'>姓名</td>    <td bgcolor='#E6E6E6'>联系电话</td>    <td bgcolor='#E6E6E6'>检查提醒</td>            
    <td width="138" align="center" bgcolor="cccccc">添加时间</td>
    

  </tr>
  <% 

    String url = "wodecheliang_list.jsp?1=1"; 
    String sql =  "select * from wodecheliang where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("pinpai") %></td>    <td><%=map.get("cheliangmingcheng") %></td>    <td><%=map.get("chexing") %></td>    <td><%=map.get("qudongfangshi") %></td>    <td><%=map.get("pailiang") %></td>    <td><%=map.get("huandangfangshi") %></td>    <td width='90' align='center'><a  href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>    <td><%=map.get("zonglicheng") %></td>    <td><%=map.get("dianya") %></td>    <td><%=map.get("jiyou") %></td>    <td><%=map.get("yonghuming") %></td>    <td><%=map.get("xingming") %></td>    <td><%=map.get("lianxidianhua") %></td>    <td><%=map.get("jianchatixing") %></td>            
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

