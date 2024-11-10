<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=fuwudingdan.xls");
%>
<html>
  <head>
    <title>服务订单</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有服务订单列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>订单号</td>
    <td bgcolor='#E6E6E6'>订单类型</td>
    <td bgcolor='#E6E6E6'>车牌号</td>
    <td bgcolor='#E6E6E6'>品牌</td>
    <td bgcolor='#E6E6E6'>车辆名称</td>
    <td bgcolor='#E6E6E6'>车型</td>
    <td bgcolor='#E6E6E6'>用户名</td>
    <td bgcolor='#E6E6E6'>姓名</td>
    <td bgcolor='#E6E6E6'>联系电话</td>
    <td bgcolor='#E6E6E6'>员工工号</td>
    <td bgcolor='#E6E6E6'>员工姓名</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>明细表</td>
    <td bgcolor='#E6E6E6'>总费用</td>
    
    <td bgcolor='#E6E6E6' width='80' align='center'>是否支付</td>
    
    <td width="138" align="center" bgcolor='#E6E6E6'>添加时间</td>
    

  </tr>
  <% 

    String url = "fuwudingdan_list.jsp?1=1"; 
    String sql =  "select * from fuwudingdan where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("dingdanhao") %></td>
    <td><%=map.get("dingdanleixing") %></td>
    <td><%=map.get("chepaihao") %></td>
    <td><%=map.get("pinpai") %></td>
    <td><%=map.get("cheliangmingcheng") %></td>
    <td><%=map.get("chexing") %></td>
    <td><%=map.get("yonghuming") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("lianxidianhua") %></td>
    <td><%=map.get("yuangonggonghao") %></td>
    <td><%=map.get("yuangongxingming") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("mingxibiao") %>' target='_blank'>下载</a></td>
    <td><%=map.get("zongfeiyong") %></td>
    
    <td align='center'><%=map.get("iszf")%></td>
    
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

