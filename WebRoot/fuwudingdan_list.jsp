<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>服务订单</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有服务订单列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  订单号：<input name="dingdanhao" type="text" id="dingdanhao" class="form-control2" />  订单类型：<input name="dingdanleixing" type="text" id="dingdanleixing" class="form-control2" />  车牌号：<input name="chepaihao" type="text" id="chepaihao" class="form-control2" />  品牌：<input name="pinpai" type="text" id="pinpai" class="form-control2" />  用户名：<input name="yonghuming" type="text" id="yonghuming" class="form-control2" />  姓名：<input name="xingming" type="text" id="xingming" class="form-control2" />  员工工号：<input name="yuangonggonghao" type="text" id="yuangonggonghao" class="form-control2" />  员工姓名：<input name="yuangongxingming" type="text" id="yuangongxingming" class="form-control2" />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='fuwudingdan_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="35" height="50" align="center" bgcolor="#E6E6E6">序号</td>
    <td bgcolor='#E6E6E6'>订单号</td>    <td bgcolor='#E6E6E6'>订单类型</td>    <td bgcolor='#E6E6E6'>车牌号</td>    <td bgcolor='#E6E6E6'>品牌</td>    <td bgcolor='#E6E6E6'>车辆名称</td>    <td bgcolor='#E6E6E6'>车型</td>    <td bgcolor='#E6E6E6'>用户名</td>    <td bgcolor='#E6E6E6'>姓名</td>    <td bgcolor='#E6E6E6'>联系电话</td>    <td bgcolor='#E6E6E6'>员工工号</td>    <td bgcolor='#E6E6E6'>员工姓名</td>    <td bgcolor='#E6E6E6' width='90' align='center'>明细表</td>    <td bgcolor='#E6E6E6'>总费用</td>        <td bgcolor='#E6E6E6' width='80' align='center'>是否支付</td>    
	
    <td width="138" height="50" align="center" bgcolor="#E6E6E6">添加时间</td>
    
    <td width="260" height="50" align="center" bgcolor="#E6E6E6">操作</td>
  </tr>
  <% 
  	double zongfeiyongz=0;


  	 new CommDAO().delete(request,"fuwudingdan"); 
    String url = "fuwudingdan_list.jsp?1=1"; 
    String sql =  "select * from fuwudingdan where 1=1";
	if(request.getParameter("dingdanhao")=="" ||request.getParameter("dingdanhao")==null ){}else{sql=sql+" and dingdanhao like '%"+request.getParameter("dingdanhao")+"%'";}if(request.getParameter("dingdanleixing")=="" ||request.getParameter("dingdanleixing")==null ){}else{sql=sql+" and dingdanleixing like '%"+request.getParameter("dingdanleixing")+"%'";}if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}if(request.getParameter("pinpai")=="" ||request.getParameter("pinpai")==null ){}else{sql=sql+" and pinpai like '%"+request.getParameter("pinpai")+"%'";}if(request.getParameter("yonghuming")=="" ||request.getParameter("yonghuming")==null ){}else{sql=sql+" and yonghuming like '%"+request.getParameter("yonghuming")+"%'";}if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}if(request.getParameter("yuangonggonghao")=="" ||request.getParameter("yuangonggonghao")==null ){}else{sql=sql+" and yuangonggonghao like '%"+request.getParameter("yuangonggonghao")+"%'";}if(request.getParameter("yuangongxingming")=="" ||request.getParameter("yuangongxingming")==null ){}else{sql=sql+" and yuangongxingming like '%"+request.getParameter("yuangongxingming")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	zongfeiyongz=zongfeiyongz+Float.valueOf((String)map.get("zongfeiyong")).floatValue();


     %>
  <tr>
    <td width="35" height="50" align="center"><%=i %></td>
    <td><%=map.get("dingdanhao") %></td>    <td><%=map.get("dingdanleixing") %></td>    <td><%=map.get("chepaihao") %></td>    <td><%=map.get("pinpai") %></td>    <td><%=map.get("cheliangmingcheng") %></td>    <td><%=map.get("chexing") %></td>    <td><%=map.get("yonghuming") %></td>    <td><%=map.get("xingming") %></td>    <td><%=map.get("lianxidianhua") %></td>    <td><%=map.get("yuangonggonghao") %></td>    <td><%=map.get("yuangongxingming") %></td>    <td width='90' align='center'><a class="btn btn-info btn-small" href='<%=map.get("mingxibiao") %>' target='_blank'>下载</a></td>    <td><%=map.get("zongfeiyong") %></td>        <td align='center'><%=map.get("iszf")%></td>    
	
    <td width="138" height="50" align="center"><%=map.get("addtime") %></td>
    <td width="220" height="50" align="center"><a class="btn btn-danger btn" href="fuwudingdan_updt.jsp?id=<%=map.get("id")%>"> <i class="glyphicon glyphicon-pencil" > </i> 修改</a>  <a class="btn btn-warning" href="fuwudingdan_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')"> <i class="glyphicon glyphicon-wrench" > </i> 删除</a> <a class="btn btn-info btn-small" href="fuwudingdan_detail.jsp?id=<%=map.get("id")%>"> <i class="glyphicon glyphicon-random" > </i> 详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
共计总费用:<%=zongfeiyongz%>；  
<p class="fy">${page.info }</p>


  </body>
</html>

