<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>兑换订单</title>
	 <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有兑换订单列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:   商品名称：
   <input name="shangpinmingcheng" type="text" id="shangpinmingcheng" class="form-control2"  />
姓名：
<input name="xingming" type="text" id="xingming" class="form-control2" />
手机：
<input name="shouji" type="text" id="shouji" class="form-control2" />
地址：
<input name="dizhi" type="text" id="dizhi" class="form-control2" />
     <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
<input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='duihuandingdan_listxls.jsp';" /></form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width='200' height="46" align='center' bgcolor='#E6E6E6'>图片</td>
    <td width="200" align="center" bgcolor='#E6E6E6'>商品名称</td>
    <td width="200" align="center" bgcolor='#E6E6E6'>所需积分</td>
    <td width="200" align="center" bgcolor='#E6E6E6'>兑换数量</td>
    <td width="200" align="center" bgcolor='#E6E6E6'>共计积分</td>
    <td width="200" bgcolor='#E6E6E6'>姓名</td>
    <td width="200" bgcolor='#E6E6E6'>积分</td>
    <td width="200" bgcolor='#E6E6E6'>手机</td>
    <td width="200" bgcolor='#E6E6E6'>地址</td>
    <td width="200" align="center" bgcolor='#E6E6E6'>添加时间</td>
    <td width="200" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
 <% 
  	double suoxujifenz=0;


  	 new CommDAO().delete(request,"duihuandingdan"); 
    String url = "duihuandingdan_list2.jsp?1=1"; 
    String sql =  "select * from duihuandingdan where 1=1 ";
	
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
if(request.getParameter("shouji")=="" ||request.getParameter("shouji")==null ){}else{sql=sql+" and shouji like '%"+request.getParameter("shouji")+"%'";}
if(request.getParameter("dizhi")=="" ||request.getParameter("dizhi")==null ){}else{sql=sql+" and dizhi like '%"+request.getParameter("dizhi")+"%'";} 

if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{sql=sql+" and shangpinmingcheng like '%"+request.getParameter("shangpinmingcheng")+"%'";}
    sql+=" order by id desc";
	String sql2= "select * from duihuandingdan where yonghuming='"+request.getSession().getAttribute("username")+"' ";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	ArrayList<HashMap> list2 = PageManager.getPages(url,15,sql2, request); 
	int i=0;
	for(HashMap map:list2){ 
	i++;
	//wxflzhistri
	suoxujifenz=suoxujifenz+Float.valueOf((String)map.get("suoxujifen")).floatValue();
	}
	for(HashMap map:list){ 
	i++;
     %>
  <tr>
    <td width='200' align='center'><a  href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    <td width="200" align="center"><%=map.get("shangpinmingcheng") %></td>
 <td width="200" align="center"><%=map.get("suoxujifen") %></td>
 <td width="200" align="center"><%=map.get("shuliang") %></td>
 <td width="200" align="center"><%=map.get("gongjijifen") %></td>
 <td width="200"><%=map.get("xingming") %></td>
 <td width="200"><%=map.get("jifen") %></td>
 <td width="200"><%=map.get("shouji") %></td>
 <td width="200"><%=map.get("dizhi") %></td>
 <td width="200" align="center"><%=map.get("addtime") %></td>
 <td width="200" align="center">     <a class="btn btn-info btn-small" href="duihuandingdan_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a>   <a class="btn btn-info btn-small" href="duihuandingdan_detail.jsp?id=<%=map.get("id")%>">详细</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
共计积分:<%=suoxujifenz%>；
<p class="fy">${page.info }</p>


  </body>
</html>

