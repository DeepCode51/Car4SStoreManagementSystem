<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>自驾游报名</title>
	 <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有自驾游报名列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  订单号：<input name="dingdanhao" type="text" id="dingdanhao" class="form-control2"  />  编号：<input name="bianhao" type="text" id="bianhao" class="form-control2"  />  姓名：<input name="xingming" type="text" id="xingming" class="form-control2"  />  性别：<input name="xingbie" type="text" id="xingbie" class="form-control2"  />  电话：<input name="dianhua" type="text" id="dianhua" class="form-control2"  />  车牌号：<input name="chepaihao" type="text" id="chepaihao" class="form-control2"  />  车辆型号：<input name="cheliangxinghao" type="text" id="cheliangxinghao" class="form-control2"  />
     <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>订单号</td>
    <td bgcolor='#E6E6E6'>编号</td>
    <td bgcolor='#E6E6E6'>路线名称</td>
    <td bgcolor='#E6E6E6'>报名费用</td>
    <td bgcolor='#E6E6E6'>路线里程</td>
    <td bgcolor='#E6E6E6'>用户名</td>
    <td bgcolor='#E6E6E6'>姓名</td>
    <td bgcolor='#E6E6E6' width='40' align='center'>性别</td>
    <td bgcolor='#E6E6E6'>电话</td>
    <td bgcolor='#E6E6E6'>车牌号</td>
    <td bgcolor='#E6E6E6'>车辆型号</td>
    <td bgcolor='#E6E6E6' width='80' align='center'>是否支付</td>
    <td bgcolor='#E6E6E6' width='80' align='center'>是否审核</td>
    <td width="138" align="center" bgcolor='#E6E6E6'>添加时间</td>
    <td width="220" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
 <% 
  	double baomingfeiyongz=0;


  	 new CommDAO().delete(request,"zijiayoubaoming"); 
    String url = "zijiayoubaoming_list2.jsp?1=1"; 
    String sql =  "select * from zijiayoubaoming where yonghuming='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("dingdanhao")=="" ||request.getParameter("dingdanhao")==null ){}else{sql=sql+" and dingdanhao like '%"+request.getParameter("dingdanhao")+"%'";}
if(request.getParameter("bianhao")=="" ||request.getParameter("bianhao")==null ){}else{sql=sql+" and bianhao like '%"+request.getParameter("bianhao")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
if(request.getParameter("xingbie")=="" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+request.getParameter("xingbie")+"%'";}
if(request.getParameter("dianhua")=="" ||request.getParameter("dianhua")==null ){}else{sql=sql+" and dianhua like '%"+request.getParameter("dianhua")+"%'";}
if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}
if(request.getParameter("cheliangxinghao")=="" ||request.getParameter("cheliangxinghao")==null ){}else{sql=sql+" and cheliangxinghao like '%"+request.getParameter("cheliangxinghao")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	baomingfeiyongz=baomingfeiyongz+Float.valueOf((String)map.get("baomingfeiyong")).floatValue();



     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("dingdanhao") %></td>
 <td><%=map.get("bianhao") %></td>
 <td><%=map.get("luxianmingcheng") %></td>
 <td><%=map.get("baomingfeiyong") %></td>
 <td><%=map.get("luxianlicheng") %></td>
 <td><%=map.get("yonghuming") %></td>
 <td><%=map.get("xingming") %></td>
 <td><%=map.get("xingbie") %></td>
 <td><%=map.get("dianhua") %></td>
 <td><%=map.get("chepaihao") %></td>
 <td><%=map.get("cheliangxinghao") %></td>
 
 <td align='center'><%=map.get("iszf")%>  <% if(map.get("iszf").equals("否")){%><a class="btn btn-info btn-small" href="zhifu/index.jsp?id=<%=map.get("id")%>&biao=zijiayoubaoming"><font color='red'>支付</font></a> <%}%> </td>
    <td width='80' align='center'><%=map.get("issh")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="220" align="center"><a class="btn btn-warning" href="zijiayoubaoming_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')"> <i class="glyphicon glyphicon-wrench" > </i> 删除</a>    <a class="btn btn-info btn-small" href="zijiayoubaoming_detail.jsp?id=<%=map.get("id")%>"> <i class="glyphicon glyphicon-random" > </i> 详细</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
共计报名费用:<%=baomingfeiyongz%>；  
<p class="fy">${page.info }</p>


  </body>
</html>

