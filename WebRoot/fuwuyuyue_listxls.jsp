<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=fuwuyuyue.xls");
%>
<html>
  <head>
    <title>服务预约</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有服务预约列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>预约单号</td>
    <td bgcolor='#E6E6E6' width='65' align='center'>预约日期</td>
    <td bgcolor='#E6E6E6'>预约类型</td>
    <td bgcolor='#E6E6E6'>车牌号</td>
    <td bgcolor='#E6E6E6'>品牌</td>
    <td bgcolor='#E6E6E6'>车辆名称</td>
    <td bgcolor='#E6E6E6'>车型</td>
    <td bgcolor='#E6E6E6'>驱动方式</td>
    <td bgcolor='#E6E6E6'>换挡方式</td>
    <td bgcolor='#E6E6E6'>用户名</td>
    <td bgcolor='#E6E6E6'>姓名</td>
    <td bgcolor='#E6E6E6'>联系电话</td>
    <td bgcolor='#E6E6E6'>状态</td>
    
    
    <td width="138" align="center" bgcolor='#E6E6E6'>添加时间</td>
    

  </tr>
  <% 

    String url = "fuwuyuyue_list.jsp?1=1"; 
    String sql =  "select * from fuwuyuyue where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("yuyuedanhao") %></td>
    <td><%=map.get("yuyueriqi") %></td>
    <td><%=map.get("yuyueleixing") %></td>
    <td><%=map.get("chepaihao") %></td>
    <td><%=map.get("pinpai") %></td>
    <td><%=map.get("cheliangmingcheng") %></td>
    <td><%=map.get("chexing") %></td>
    <td><%=map.get("qudongfangshi") %></td>
    <td><%=map.get("huandangfangshi") %></td>
    <td><%=map.get("yonghuming") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("lianxidianhua") %></td>
    <td><%=map.get("zhuangtai") %></td>
    
    
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

