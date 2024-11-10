<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>讨论中心</title>
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>
	<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
	 <link rel="stylesheet" href="./qtimages/sl_common_form.css">
</head>
<% String bk=request.getParameter("bk"); %>
<body>

<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			
			<div class="line">
				<h3>讨论中心<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				   <div class="content-form">
				 <table width="96%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" class="newsline" style="border-collapse:collapse">
                          <tr>
                            <td height="104" valign="top"><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
                                <tr>
                                  <td width="30" height="43" bgcolor='#E6E6E6'>序号</td>
                                  <td width="352" bgcolor='#E6E6E6'>标题</td>
                                  <td width="48" bgcolor='#E6E6E6'>类型</td>
                                  <td width="60" bgcolor='#E6E6E6'>发帖人</td>
                                  <td width="130" align="center" bgcolor='#E6E6E6'>发布时间</td>
                                  <td width="65" align="center" bgcolor='#E6E6E6'>已有回帖</td>
                                </tr>
                                 <% 

  	 new CommDAO().delete(request,"tiezi"); 
    String url = "tiezi_list.jsp?1=1"; 
    String sql =  "select * from tiezi where bankuai='"+bk+"'";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
                                <tr>
                                  <td width="30" height="40"><%=i%></td>
                                  <td><a href="tiezidetail.jsp?id=<%=map.get("id") %>"><%=map.get("biaoti") %></a></td>
                                  <td><img src="bbs/<%=map.get("leixing") %>.gif" width="18" height="18"></td>
                                  <td><%=map.get("faburen") %></td>
                                  <td width="130" align="center"><%=map.get("addtime") %></td>
                                  <td width="65" align="center"><%=new CommDAO().gettzs((String)map.get("id")) %></td>
                                </tr>
	<%
  }
   %>
                            </table></td>
                          </tr>
                          <tr>
                            <td align="right"><input type=button name=Submit52 value=我要发帖 class='hsgqiehuanshitu'  onClick="javascript:location.href='tieziadd.jsp?bk=<%=bk%>';"  />   <input type=button name=Submit52 value=返回 class='hsgqiehuanshitu'   onClick="javascript:location.href='bbs.jsp';"  /></td>
                          </tr>
                        </table>
					</div>
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>
</body></html>

