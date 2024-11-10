<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>服务预约</title>
	 <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有服务预约列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  预约单号：<input name="yuyuedanhao" type="text" id="yuyuedanhao" class="form-control2"  />  预约日期：<input name="yuyueriqi1" type="text" id="yuyueriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" class="form-control2" />-<input name="yuyueriqi2" type="text" id="yuyueriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" class="form-control2" /> 预约类型：<select name='yuyueleixing' id='yuyueleixing' class="form-control2"><option value="">所有</option><option value="保养">保养</option><option value="维修">维修</option></select>  车牌号：<input name="chepaihao" type="text" id="chepaihao" class="form-control2"  />  品牌：<input name="pinpai" type="text" id="pinpai" class="form-control2"  />  车型：<input name="chexing" type="text" id="chexing" class="form-control2"  />  驱动方式：<input name="qudongfangshi" type="text" id="qudongfangshi" class="form-control2"  />  换挡方式：<input name="huandangfangshi" type="text" id="huandangfangshi" class="form-control2"  />  姓名：<input name="xingming" type="text" id="xingming" class="form-control2"  />  联系电话：<input name="lianxidianhua" type="text" id="lianxidianhua" class="form-control2"  /> 状态：<select name='zhuangtai' id='zhuangtai' class="form-control2"><option value="">所有</option><option value="未完成">未完成</option><option value="已完成">已完成</option></select>
     <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="30" align="center" bgcolor='#E6E6E6'>序号</td>
    <td bgcolor='#E6E6E6'>预约单号</td>
    <td bgcolor='#E6E6E6' width='65' align='center'>预约日期</td>
    <td bgcolor='#E6E6E6'>预约类型</td>
    <td bgcolor='#E6E6E6'>车牌号</td>
    <td bgcolor='#E6E6E6'>品牌</td>
    <td bgcolor='#E6E6E6'>车辆名称</td>
    <td bgcolor='#E6E6E6'>车型</td>
    <td bgcolor='#E6E6E6'>驱动方式</td>
    <td bgcolor='#E6E6E6'>换挡方式</td>
    <td bgcolor='#E6E6E6'>用户名</td>
    <td bgcolor='#E6E6E6'>姓名</td>
    <td bgcolor='#E6E6E6'>联系电话</td>
    <td bgcolor='#E6E6E6'>状态</td>
    
    <td width="138" align="center" bgcolor='#E6E6E6'>添加时间</td>
    <td width="220" align="center" bgcolor='#E6E6E6'>操作</td>
  </tr>
 <% 
  	


  	 new CommDAO().delete(request,"fuwuyuyue"); 
    String url = "fuwuyuyue_list2.jsp?1=1"; 
    String sql =  "select * from fuwuyuyue where yonghuming='"+request.getSession().getAttribute("username")+"' ";
	
if(request.getParameter("yuyuedanhao")=="" ||request.getParameter("yuyuedanhao")==null ){}else{sql=sql+" and yuyuedanhao like '%"+request.getParameter("yuyuedanhao")+"%'";}
if (request.getParameter("yuyueriqi1")==""  ||request.getParameter("yuyueriqi1")==null ) {}else{sql=sql+" and yuyueriqi >= '"+request.getParameter("yuyueriqi1")+"'";}
if (request.getParameter("yuyueriqi2")==""  ||request.getParameter("yuyueriqi2")==null ) {}else {sql=sql+" and yuyueriqi <= '"+request.getParameter("yuyueriqi2")+"'";}
if(request.getParameter("yuyueleixing")=="" ||request.getParameter("yuyueleixing")==null ){}else{sql=sql+" and yuyueleixing like '%"+request.getParameter("yuyueleixing")+"%'";}
if(request.getParameter("chepaihao")=="" ||request.getParameter("chepaihao")==null ){}else{sql=sql+" and chepaihao like '%"+request.getParameter("chepaihao")+"%'";}
if(request.getParameter("pinpai")=="" ||request.getParameter("pinpai")==null ){}else{sql=sql+" and pinpai like '%"+request.getParameter("pinpai")+"%'";}
if(request.getParameter("chexing")=="" ||request.getParameter("chexing")==null ){}else{sql=sql+" and chexing like '%"+request.getParameter("chexing")+"%'";}
if(request.getParameter("qudongfangshi")=="" ||request.getParameter("qudongfangshi")==null ){}else{sql=sql+" and qudongfangshi like '%"+request.getParameter("qudongfangshi")+"%'";}
if(request.getParameter("huandangfangshi")=="" ||request.getParameter("huandangfangshi")==null ){}else{sql=sql+" and huandangfangshi like '%"+request.getParameter("huandangfangshi")+"%'";}
if(request.getParameter("xingming")=="" ||request.getParameter("xingming")==null ){}else{sql=sql+" and xingming like '%"+request.getParameter("xingming")+"%'";}
if(request.getParameter("lianxidianhua")=="" ||request.getParameter("lianxidianhua")==null ){}else{sql=sql+" and lianxidianhua like '%"+request.getParameter("lianxidianhua")+"%'";}
if(request.getParameter("zhuangtai")=="" ||request.getParameter("zhuangtai")==null ){}else{sql=sql+" and zhuangtai like '%"+request.getParameter("zhuangtai")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("yuyuedanhao") %></td>
 <td><%=map.get("yuyueriqi") %></td>
 <td><%=map.get("yuyueleixing") %></td>
 <td><%=map.get("chepaihao") %></td>
 <td><%=map.get("pinpai") %></td>
 <td><%=map.get("cheliangmingcheng") %></td>
 <td><%=map.get("chexing") %></td>
 <td><%=map.get("qudongfangshi") %></td>
 <td><%=map.get("huandangfangshi") %></td>
 <td><%=map.get("yonghuming") %></td>
 <td><%=map.get("xingming") %></td>
 <td><%=map.get("lianxidianhua") %></td>
 <td><%=map.get("zhuangtai") %></td>
 
 
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="220" align="center"><a class="btn btn-warning" href="fuwuyuyue_list2.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')"> <i class="glyphicon glyphicon-wrench" > </i> 删除</a>    <a class="btn btn-info btn-small" href="fuwuyuyue_detail.jsp?id=<%=map.get("id")%>"> <i class="glyphicon glyphicon-random" > </i> 详细</a> </td>
  </tr>
  	<%
  }
   %>
</table><br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

