<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
  <head>
    
    <title></title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">

  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  <script language="javascript">
  function checkall()
  {
  	if(document.form2.plxz.checked==true)
	{
		var code_Values = document.all['pldel']; 
		if(code_Values.length){ 
		for(var i=0;i<code_Values.length;i++) 
		{ 
		code_Values[i].checked = true; 
		} 
		}else{ 
		code_Values.checked = true; 
		} 
	}
	else
	{
		var code_Values = document.all['pldel']; 
		if(code_Values.length){ 
		for(var i=0;i<code_Values.length;i++) 
		{ 
		code_Values[i].checked = false;  
		} 
		}else{ 
		code_Values.checked = false; 
		} 
	}
  }
  </script>
   <%
  String lb=request.getParameter("lb");
  //String lb=new String(request.getParameter("lb").getBytes("8859_1"));
%>
 <%
 new CommDAO().delete(request,"xinwentongzhi"); 

 %>
  <body >
  <p>已有<%=lb%>列表：</p> 
  <form name="form1" id="form1" method="get" action="">
   搜索: 标题：<input name="biaoti" type="text" id="biaoti" class="form-control2" /><input name="lb" type="hidden" id="lb" value="<%=lb%>">	 
   
   添加人：
   <input name="tianjiaren" type="text" id="tianjiaren" class="form-control2" />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
   <input type="button" name="Submit2" value="新增" class="btn btn-info btn-small" onClick="javascript:location.href='xinwentongzhi_add.jsp?lb=<%=lb%>';" />
  </form>

  <form name="form2" method="post" action="delall.jsp">
  <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover"> 
      <tr>
        <td width="40" height="30" align="center" bgcolor="#E6E6E6">序号</td>
        <td height="30" bgcolor="#E6E6E6">标题</td>
        <td height="30" align="center" bgcolor="#E6E6E6">类别</td>
        <td height="30" align="center" bgcolor="#E6E6E6">添加人</td>
        <td width="120" height="30" align="center" bgcolor="#E6E6E6">首页图片</td>
        <td height="30" align="center" bgcolor="#E6E6E6">点击率</td>
        <td width="138" height="30" align="center" bgcolor="#E6E6E6">添加时间</td>
        <td width="200" height="30" align="center" bgcolor="#E6E6E6">操作</td>
        <td width="50" height="30" align="center" bgcolor="#E6E6E6"><input name="plxz" type="checkbox" id="plxz" onClick="checkall();" value="1">
            <input name="tablename" type="hidden" id="tablename" value="xinwentongzhi"> <input name="lb" type="hidden" id="lb" value="<%=lb%>">
        </td>
      </tr>
    <% 
	new CommDAO().delete(request,"xinwentongzhi"); 
    String url = "xinwentongzhi_list.jsp?lb="+lb; 
    String sql =  "select * from xinwentongzhi where leibie='"+lb+"' ";
	
	if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql + " and biaoti like '%"+request.getParameter("biaoti").trim()+"%' ";}
	if(request.getParameter("tianjiaren")=="" ||request.getParameter("tianjiaren")==null ){}else{sql=sql+ " and tianjiaren like '%"+request.getParameter("tianjiaren").trim()+"%' ";}
	
    sql+=" order by id desc";
	//out.print(sql);
	ArrayList<HashMap> list = PageManager.getPages(url,10,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
      <tr>
        <td width="40" align="center"><%=i %></td>
        <td><%=map.get("biaoti") %></td>
        <td align="center"><%=map.get("leibie") %></td>
        <td align="center"><%=map.get("tianjiaren") %></td>
        <td width="120" align="center"><%
		if (map.get("shouyetupian")==null || map.get("shouyetupian").equals("") || map.get("shouyetupian").equals("null"))
		{
		%>
          <%
		}
		else
		{
		%>
            <a href='<%=map.get("shouyetupian") %>' target='_blank'><img src='<%=map.get("shouyetupian") %>' width=88 height=99 border=0 /></a>
            <%
		}
	%>
        </td>
        <td align="center"><%=map.get("dianjilv") %></td>
        <td width="138" align="center"><%=map.get("addtime") %></td>
        <td width="150" align="center"> 
		
		<a class="btn btn-danger btn" href="xinwentongzhi_updt.jsp?id=<%=map.get("id")%>"><i class="glyphicon glyphicon-pencil" > </i>修改</a>   <a class="btn btn-warning" href="xinwentongzhi_list.jsp?&lb=<%=lb%>&scid=<%=map.get("id")%>" onClick="return confirm('真的要删除？')"> <i class="glyphicon glyphicon-wrench" > </i>删除</a>
		
		</td>
        <td width="50" align="center"><input name="pldel" type="checkbox" id="pldel" value="<%=map.get("id")%>"></td>
      </tr>
       <%} %>
    </table>
    
  <br>
  <p class="fy">${page.info } </p>
  <input type="button" name="Submit32" value="打印本页" onClick="javascript:window.print();" class="btn btn-info btn-small">
  <input type="submit" name="Submit33" value="批量删除" class="btn btn-info btn-small">

 </form>   </body>
</html>



