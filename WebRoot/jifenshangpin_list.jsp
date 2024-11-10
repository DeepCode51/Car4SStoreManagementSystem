<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>积分商品</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有积分商品列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  商品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" class="form-control2" />  商品类别：<%=Info.getselect("shangpinleibie","leibiexinxi","shangpinleibie"," 1=1 ")%>  品牌：<input name="pinpai" type="text" id="pinpai" class="form-control2" />  所需积分：<input name="suoxujifen1" type="text" id="suoxujifen1"  value='' class="form-control2" />-<input name="suoxujifen2" type="text" id="suoxujifen2"  value='' class="form-control2" />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='jifenshangpin_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="35" height="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>商品编号</td>
    <td bgcolor='#E6E6E6'>商品名称</td>
    <td bgcolor='#E6E6E6'>商品类别</td>
    <td bgcolor='#E6E6E6'>品牌</td>
    <td bgcolor='#E6E6E6'>所需积分</td>
    <td bgcolor='#E6E6E6'>销量</td>
    <td width='80' align='center' bgcolor='#E6E6E6'>是否上架</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>图片</td>
    
    
	
    <td width="90" align="center" bordercolor="#F3F3F3" bgcolor='#E6E6E6'>评论管理</td>
    <td width="138" height="30" align="center" bgcolor='#E6E6E6'>添加时间</td>
    
    <td width="220" height="30" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"jifenshangpin"); 
    String url = "jifenshangpin_list.jsp?1=1"; 
    String sql =  "select * from jifenshangpin where 1=1";
	
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{sql=sql+" and shangpinmingcheng like '%"+request.getParameter("shangpinmingcheng")+"%'";}
if(request.getParameter("shangpinleibie")=="" ||request.getParameter("shangpinleibie")==null ){}else{sql=sql+" and shangpinleibie like '%"+request.getParameter("shangpinleibie")+"%'";}
if(request.getParameter("pinpai")=="" ||request.getParameter("pinpai")==null ){}else{sql=sql+" and pinpai like '%"+request.getParameter("pinpai")+"%'";}
if (request.getParameter("suoxujifen1")==""  ||request.getParameter("suoxujifen1")==null ) {}else{sql=sql+" and suoxujifen >= '"+request.getParameter("suoxujifen1")+"'";}
if (request.getParameter("suoxujifen2")==""  ||request.getParameter("suoxujifen2")==null ) {}else {sql=sql+" and suoxujifen <= '"+request.getParameter("suoxujifen2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="35" align="center"><%=i %></td>
    <td><%=map.get("shangpinbianhao") %></td>
    <td><%=map.get("shangpinmingcheng") %></td>
    <td><%=map.get("shangpinleibie") %></td>
    <td><%=map.get("pinpai") %></td>
    <td><%=map.get("suoxujifen") %></td>
    <td><%=map.get("xiaoliang") %></td>
    <td align='center'><a class="btn btn-info btn-small" href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=jifenshangpin" onClick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>
    <td width='90' align='center'><a  href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    
    
	
    <td width="90" align="center" bordercolor="#F3F3F3"><a class="btn btn-info btn-small" href="pinglun_list.jsp?id=<%=map.get("id")%>&biao=jifenshangpin">评论管理</a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="220" align="center"><a class="btn btn-info btn-small" href="jifenshangpin_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a class="btn btn-info btn-small" href="jifenshangpin_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a class="btn btn-info btn-small" href="jifenshangpindetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

