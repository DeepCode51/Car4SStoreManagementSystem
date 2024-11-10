<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>积分商品</title>
  
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
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
</script> 
<%

	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"jifenshangpin");
	
	
     %>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			 
			<div class="line">
				<h3>积分商品 </h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  <div class="content-form">
					
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">
                  <tr>
                    <td width='34%' rowspan="6" align="center"><a href=<%=mqt.get("tupian")%> target=_blank><img src=<%=mqt.get("tupian")%> width=228 height=215 border=0></a></td>
                    <td width='50%' height="43"><span class="STYLE1"><%=mqt.get("shangpinmingcheng")%></span></td>
                    <td width="16%" align=center><a href=<%=mqt.get("tupian")%> target=_blank></a></td>
                  </tr>
                  
              <tr>
                    <td width='50%' height="44">商品类别：<%=mqt.get("shangpinleibie")%></td>
                    <td width="16%" align=center>&nbsp;</td>
              </tr>
				   
                  <tr>
                    <td width='50%' height="44">品牌：<%=mqt.get("pinpai")%></td>
                    <td width="16%" align=center>&nbsp;</td>
                </tr>
                  <tr>
                    <td width='50%' height="44">所需积分:<%=mqt.get("suoxujifen")%></td>
                    <td width="16%" align=center>&nbsp;</td>
                </tr>
                  <tr>
                    <td width='50%' height="44"> 销量:<%=mqt.get("xiaoliang")%></td>
                    <td width="16%" align=center>&nbsp;</td>
                </tr>
                  <tr>
                    <td width='50%' height="90"><input type=button name=Submit53 class='hsgqiehuanshitu' value=兑换商品 onClick="javascript:location.href='duihuandingdanadd.jsp?id=<%=request.getParameter("id")%>';"/></td>
                    <td width="16%" align=center>&nbsp;</td>
                </tr>
                  <tr>
                    <td width='34%' height=100  >&nbsp; </td>
                    <td colspan="3" align=left><%=mqt.get("shangpinjianjie")%></td>
                </tr>
                  
                  
                  <tr>
                    <td colspan=3 align=center>&nbsp;</td>
                  </tr>
                </table>
			  </div>
			</ul>
		</div>
	</div>
</div>
<%@ include file="qtdown.jsp"%>

</body> 
</html>

<!--yoxudixtu-->

