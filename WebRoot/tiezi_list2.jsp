<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>帖子信息</title>
		<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>已有帖子信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:    标题：
   <input name="biaoti" type="text" id="biaoti" class="form-control2" />
     <input type="submit" name="Submit" value="查找"  />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" height="34" align="center" bgcolor='#E6E6E6'>序号</td>
    <td width="283" bgcolor='#E6E6E6'>标题</td>
    <td width="419" bgcolor='#E6E6E6'>主贴/回帖</td>
    <td width="444" bgcolor='#E6E6E6'>发布人</td>
    <td width="140" align="center" bordercolor="1" bgcolor='#E6E6E6'><span class="STYLE2">已有回帖</span></td>
    <td width="138" align="center" bgcolor='#E6E6E6'>添加时间</td>
    <td width="150" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
 <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"tiezi"); 
    String url = "tiezi_list2.jsp?1=1"; 
    String sql =  "select * from tiezi where faburen='"+request.getSession().getAttribute("username")+"' and fid=0 ";
	
if(request.getParameter("bankuai")=="" ||request.getParameter("bankuai")==null ){}else{sql=sql+" and bankuai like '%"+request.getParameter("bankuai")+"%'";}
if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql+" and biaoti like '%"+request.getParameter("biaoti")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("biaoti") %></td>
    <td><%
	if(map.get("fid").equals("0"))
								{
								out.print("<font color=red>主贴</font>");
								}
								else
								{
	out.print("回帖");
	}
	%></td>
    <td><%=map.get("faburen") %></td>
    <td width="140" align="center" bordercolor="1"><%=new CommDAO().gettzs((String)map.get("id")) %></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a class="btn btn-info btn-small" href="tiezi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a class="btn btn-info btn-small" href="tiezi_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a class="btn btn-info btn-small" href="tiezidetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a>  <!--qiatnalijne--> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
<!--yoxugonxgzitoxnxgjxi--> <!--youzuiping3--> 
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

