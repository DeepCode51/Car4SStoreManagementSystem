<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>购物车</title>
	 <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有购物车列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:   商品名称：
   <input name="shangpinmingcheng" type="text" id="shangpinmingcheng" class="form-control2"  />
     <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width='192' height="46" align='center' bgcolor='#E6E6E6'>图片</td>
    <td width="170" align="center" bgcolor='#E6E6E6'>商品名称</td>
    <td width="171" align="center" bgcolor='#E6E6E6'>商品类别</td>
    <td width="240" align="center" bgcolor='#E6E6E6'>销售价格</td>
    <td width="99" align="center" bgcolor='#E6E6E6'>数量</td>
    <td width="185" align="center" bgcolor='#E6E6E6'>总金额</td>
    <td width="335" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
 <% 
  	double zongjinez=0;


  	 new CommDAO().delete(request,"gouwuche"); 
    String url = "gouwuche_list2.jsp?1=1"; 
    String sql =  "select * from gouwuche where yonghuming='"+request.getSession().getAttribute("username")+"' and issh='未下单' ";
	
if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}else{sql=sql+" and bianhao like '%"+request.getParameter("bianhao")+"%'";}
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{sql=sql+" and shangpinmingcheng like '%"+request.getParameter("shangpinmingcheng")+"%'";}
    sql+=" order by id desc";
	String sql2= "select * from gouwuche where yonghuming='"+request.getSession().getAttribute("username")+"' and issh='未下单'";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	ArrayList<HashMap> list2 = PageManager.getPages(url,15,sql2, request); 
	int i=0;
	for(HashMap map:list2){ 
	i++;
	//wxflzhistri
	zongjinez=zongjinez+Float.valueOf((String)map.get("zongjine")).floatValue();
	}
	for(HashMap map:list){ 
	i++;
     %>
  <tr>
    <td width='192' align='center'><a  href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    <td align="center"><%=map.get("shangpinmingcheng") %></td>
 <td align="center"><%=map.get("shangpinleibie") %></td>
 <td align="center"><%=map.get("xiaoshoujiage") %></td>
 <td align="center"><%=map.get("shuliang") %></td>
 <td align="center"><%=map.get("zongjine") %></td>
 <td width="335" align="center">     <a class="btn btn-info btn-small" href="gouwuche_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>   </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
未下单总金额:<%=zongjinez%>；  
<% if(zongjinez>0) {%>
<input type="submit" name="Submit2" value="生成订单" onClick="location.href='dingdanxinxi_add.jsp?zongjinez=<%= zongjinez%>'" style='border:solid 1px #000000;' /><%}%>
<p class="fy">${page.info }</p>


  </body>
</html>

