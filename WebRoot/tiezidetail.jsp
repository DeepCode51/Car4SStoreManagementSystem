<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>在线论坛</title>
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
	 
	 <style type="text/css">
 
 tr,table{ border:0}
 td{ border:1px #CCCCCC solid;border-collapse:collapse;}
 
</style>
</head>
 <%
  if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
	return;
}
  String id=request.getParameter("id");
  HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){
ext.put("faburen",request.getSession().getAttribute("username"));
ext.put("cx",request.getSession().getAttribute("cx"));
ext.put("fid",id);
ext.put("bankuai","");
ext.put("biaoti","");
ext.put("leixing","");
ext.put("fujian","");
}
new CommDAO().insert(request,response,"tiezi",ext,true,false,""); 
%>
<body>

<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			
			<div class="line">
				<h3>在线论坛<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				   <div class="content-form">
				 <table width="96%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
                      <tr>
                        <td height="104" valign="top">
						
						
						
						<%
    HashMap m = new CommDAO().getmap(id,"tiezi");
     %>
                            <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#FFFFFF" style="border-collapse:collapse">
                              <tr>
                                <td width="13%">标题：</td>
                                <td width="87%" height="60"><%=m.get("biaoti")%> &nbsp;</td>
                              </tr>
                              <tr>
                                <td><p><img src="bbs/<%=m.get("leixing")%>.gif" width="18" height="18"></p>
                                  <p> 发帖人：<%=m.get("faburen")%> </p>
                                <p>权限：<%=m.get("cx")%> </p></td>
                                <td height="100"><%=m.get("neirong")%></td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                              </tr>
                          </table>                        </td>
                      </tr>
                      <tr>
                        <td align="right"><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
                            <tr>
                              <td colspan="2">已有回帖如下：</td>
                            </tr>
							  <% 
    String url = "tiezidetail.jsp?1=1"; 
    String sql =  "select * from tiezi where fid="+id+" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
                            <tr>
                              <td width="13%"><p>回复人:<%=map.get("faburen")%></p>
                                  <p>权限:<%=map.get("cx")%></p></td>
                              <td width="87%" height="100"><%=map.get("neirong")%></td>
                            </tr>
                            <%
						  	}
						  %>
                            <tr>
                              <td colspan="2">我也来回一个：</td>
                            </tr>
                            <tr>
                              <td colspan="2"><form name="form1" method="post" action="?f=f&id=<%=id%>">
                                  <textarea name="neirong" cols="70" rows="5" id="neirong"></textarea>
                                  <input type="submit" name="Submit" class='hsgqiehuanshitu' value="回复">
                                  <input name="hf" type="hidden" id="hf" value="1">
                              </form></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td align="right"><input type=button name=Submit52 value=返回 class='hsgqiehuanshitu'  onClick="javascript:location.href='bbs.jsp';"  /></td>
                      </tr>
                    </table>
			  </div>
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>
</body></html>

