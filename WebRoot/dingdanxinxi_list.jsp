<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>订单信息</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有订单信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  订单号：<input name="dingdanhao" type="text" id="dingdanhao" class="form-control2" />  姓名：<input name="xingming" type="text" id="xingming" class="form-control2" />  手机：<input name="shouji" type="text" id="shouji" class="form-control2" />  收货地址：<input name="shouhuodizhi" type="text" id="shouhuodizhi" class="form-control2" />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='dingdanxinxi_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="35" height="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>订单号</td>
    
    <td bgcolor='#E6E6E6'>总金额</td>
    <td bgcolor='#E6E6E6'>用户名</td>
    <td bgcolor='#E6E6E6'>姓名</td>
    <td bgcolor='#E6E6E6'>手机</td>
    <td bgcolor='#E6E6E6'>收货地址</td>
    <td bgcolor='#E6E6E6' width='80' align='center'>是否支付</td>
    <td width="138" height="30" align="center" bgcolor='#E6E6E6'>添加时间</td>
    
    <td width="220" height="30" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
  <% 
  	
double zongjinez=0;

  	 new CommDAO().delete(request,"dingdanxinxi"); 
    String url = "dingdanxinxi_list.jsp?1=1"; 
    String sql =  "select * from dingdanxinxi where 1=1";
	
if(request.getParameter("dingdanhao")=="" ||request.getParameter("dingdanhao")==null ){}else{sql=sql+" and dingdanhao like '%"+request.getParameter("dingdanhao")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
if(request.getParameter("shouji")=="" ||request.getParameter("shouji")==null ){}else{sql=sql+" and shouji like '%"+request.getParameter("shouji")+"%'";}
if(request.getParameter("shouhuodizhi")=="" ||request.getParameter("shouhuodizhi")==null ){}else{sql=sql+" and shouhuodizhi like '%"+request.getParameter("shouhuodizhi")+"%'";}
if(request.getParameter("zhuangtai")=="" ||request.getParameter("zhuangtai")==null ){}else{sql=sql+" and zhuangtai like '%"+request.getParameter("zhuangtai")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	zongjinez=(float)zongjinez+Float.valueOf((String)map.get("zongjine")).floatValue();
	


     %>
  <tr>
    <td width="35" align="center"><%=i %></td>
    <td><%=map.get("dingdanhao") %></td>
    
    <td><%=map.get("zongjine") %></td>
    <td><%=map.get("yonghuming") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("shouji") %></td>
    <td><%=map.get("shouhuodizhi") %></td>
    <td align='center'><%=map.get("iszf")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="220" align="center">    <a class="btn btn-info btn-small" href="dingdanxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a class="btn btn-info btn-small" href="dingdanxinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
总金额:<%=(float)zongjinez%>；  
<p class="fy">${page.info }</p>


  </body>
</html>

