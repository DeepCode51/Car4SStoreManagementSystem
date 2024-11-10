<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>我的车辆</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有我的车辆列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  车牌号：<input name="chepaihao" type="text" id="chepaihao" class="form-control2"  />  品牌：<input name="pinpai" type="text" id="pinpai" class="form-control2"  /> 车型：<select name='chexing' id='chexing' class="form-control2"><option value="">所有</option><option value="小轿">小轿</option><option value="越野">越野</option><option value="面包">面包</option><option value="大卡">大卡</option><option value="跑车">跑车</option></select> 驱动方式：<select name='qudongfangshi' id='qudongfangshi' class="form-control2"><option value="">所有</option><option value="前驱">前驱</option><option value="后驱">后驱</option><option value="四驱">四驱</option><option value="新能源">新能源</option></select> 换挡方式：<select name='huandangfangshi' id='huandangfangshi' class="form-control2"><option value="">所有</option><option value="自动档">自动档</option><option value="手动档">手动档</option><option value="手自一体">手自一体</option></select>  姓名：<input name="xingming" type="text" id="xingming" class="form-control2"  />  联系电话：<input name="lianxidianhua" type="text" id="lianxidianhua" class="form-control2"  />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='wodecheliang_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" height="50" align="center" bgcolor="#E6E6E6">序号</td>
    <td bgcolor='#E6E6E6'>车牌号</td>
    <td bgcolor='#E6E6E6'>品牌</td>
    <td bgcolor='#E6E6E6'>车辆名称</td>
    <td bgcolor='#E6E6E6'>车型</td>
    <td bgcolor='#E6E6E6'>驱动方式</td>
    <td bgcolor='#E6E6E6'>排量</td>
    <td bgcolor='#E6E6E6'>换挡方式</td>
    <td bgcolor='#E6E6E6' width='90' align='center'>图片</td>
    <td bgcolor='#E6E6E6'>用户名</td>
    <td bgcolor='#E6E6E6'>姓名</td>
    <td bgcolor='#E6E6E6'>联系电话</td>
    
    
	
    <td width="138" height="50" align="center" bgcolor="#E6E6E6">添加时间</td>
    
    <td width="60" height="50" align="center" bgcolor="#E6E6E6">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"wodecheliang"); 
    String url = "wodecheliang_list.jsp?1=1"; 
    String sql =  "select * from wodecheliang where 1=1";
	
if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}
if(request.getParameter("pinpai")=="" ||request.getParameter("pinpai")==null ){}else{sql=sql+" and pinpai like '%"+request.getParameter("pinpai")+"%'";}
if(request.getParameter("chexing")=="" ||request.getParameter("chexing")==null ){}else{sql=sql+" and chexing like '%"+request.getParameter("chexing")+"%'";}
if(request.getParameter("qudongfangshi")=="" ||request.getParameter("qudongfangshi")==null ){}else{sql=sql+" and qudongfangshi like '%"+request.getParameter("qudongfangshi")+"%'";}
if(request.getParameter("huandangfangshi")=="" ||request.getParameter("huandangfangshi")==null ){}else{sql=sql+" and huandangfangshi like '%"+request.getParameter("huandangfangshi")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
if(request.getParameter("lianxidianhua")=="" ||request.getParameter("lianxidianhua")==null ){}else{sql=sql+" and lianxidianhua like '%"+request.getParameter("lianxidianhua")+"%'";}
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
    <td><%=map.get("chepaihao") %></td>
    <td><%=map.get("pinpai") %></td>
    <td><%=map.get("cheliangmingcheng") %></td>
    <td><%=map.get("chexing") %></td>
    <td><%=map.get("qudongfangshi") %></td>
    <td><%=map.get("pailiang") %></td>
    <td><%=map.get("huandangfangshi") %></td>
    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    <td><%=map.get("yonghuming") %></td>
    <td><%=map.get("xingming") %></td>
    <td><%=map.get("lianxidianhua") %></td>
    
    
	
    <td width="138" height="50" align="center"><%=map.get("addtime") %></td>
    <td width="60" height="50" align="center"><!--lianjie1--> <a class="btn btn-info btn-small" href="wodecheliang_detail.jsp?id=<%=map.get("id")%>"> <i class="glyphicon glyphicon-random" > </i> 详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

