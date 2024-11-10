<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<title>杭州4s店管理系统</title>
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>					<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
</head>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="course">



 <div class="partner">
	<div class="container">
		<div class="index-title txt-c">
			<em>商城推荐 </em>
			<div class="line">
				<h3>商城推荐<img src="qtimages/partner.png" height="16" width="132"></h3>
			</div>
		</div>
		<style>
			.partner{ background: #F9F9F9;padding-top:50px;}
			.partner .container{ overflow: hidden;}
			.partner-list{margin:50px 0}
			.partner-list li{float:left;width:236px;margin:0 10px;}
			.partner-list li span,.partner-list li b{ display: block;text-align: center;font-weight:normal}
			.partner-list li img{width:236px;height:230px;border:1px solid #eee}
			.partner-list li b{margin-top:5px;}
		</style>
		<div class="partner-list c">
			<div class="tempWrap" style="overflow:hidden; position:relative; width:1280px">
			<ul style="width: 6144px; position: relative; overflow: hidden; padding: 0px; margin: 0px; left: -3485px;">
			 <%
    for(HashMap mapyqlj:new CommDAO().select("select * from shangpinxinxi order by xiaoliang desc")){
     %>
				<li style="float: left; width: 236px;">
					<span><a href="shangpinxinxidetail.jsp?id=<%=mapyqlj.get("id")%>" ><img src="<%=mapyqlj.get("tupian") %>" width="236" height="230" alt="<%=mapyqlj.get("shangpinmingcheng") %>" title="<%=mapyqlj.get("shangpinmingcheng") %>"></a></span>
					<b><%=mapyqlj.get("shangpinmingcheng") %>,销量<%=mapyqlj.get("xiaoliang") %></b>
				</li>
				<%
								  }
								  %>
					  
				</ul></div>
		</div>
	</div>
	<script>
		/* 内层图片无缝滚动 */
		jQuery(".partner").slide({ mainCell:".partner-list ul",vis:5,effect:"leftMarquee",interTime:20,autoPlay:true});
	</script>
</div>

<br><br>
	<div class="container">
		<div class="index-title txt-c">
			<em>车辆推荐</em>
		</div>
		<div class="course-list">
			<div class="hd">
				<a class="next"></a>
				<a class="prev"></a>
			</div>
			<div class="bd">
				<div class="tempWrap" style="overflow:hidden; position:relative; width:1155px"><div class="ulWrap" style="width: 1925px; left: 0px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">
					 <%
		  	int icheliangxinxi=0;						
    for(HashMap mapcheliangxinxi:new CommDAO().select("select * from cheliangxinxi order by id desc "))
	{
		icheliangxinxi++;
		if(icheliangxinxi<=8)
		{
		  %>
					<ul style="float: left; width: 385px;">
						<li>
								<a href="cheliangxinxidetail.jsp?id=<%=mapcheliangxinxi.get("id")%>" title="<%=mapcheliangxinxi.get("pinpai")%>">
									<div class="pic">
										<img src="<%=mapcheliangxinxi.get("tupian")%>" height="270" width="370" alt="<%=mapcheliangxinxi.get("pinpai")%>" title="<%=mapcheliangxinxi.get("pinpai")%>">
									</div>
									<em><%=mapcheliangxinxi.get("cheliangmingcheng")%></em>
								</a>
					  </li></ul>
			 <%
		}
	}
			%>	
				</div></div>
			</div>
		</div>
		<a href="cheliangxinxilist.jsp" class="more product-more">查看更多</a>
	</div>
</div>
<script type="text/javascript">
	jQuery(".course-list").slide({titCell:".hd ul",mainCell:".bd .ulWrap",autoPage:true,effect:"left",vis:3});
</script>
<div class="campus">
	<div class="container">
		<div class="index-title txt-c">
			<em>自驾游推荐</em>
		</div>
		<div class="campus-list c">
			<ul>
			 <%
		  	int izijiayou=0;						
    for(HashMap mapzijiayou:new CommDAO().select("select * from zijiayou order by id desc "))
	{
		izijiayou++;
		if(izijiayou<=8)
		{
		  %>
				<li>
						<a href="zijiayoudetail.jsp?id=<%=mapzijiayou.get("id")%>" title="<%=mapzijiayou.get("luxianmingcheng")%>">
							<div class="pic">
								<img src="<%=mapzijiayou.get("tupian")%>" height="208" width="290" alt="<%=mapzijiayou.get("luxianmingcheng")%>" title="<%=mapzijiayou.get("luxianmingcheng")%>">
							</div>
						<em><%=mapzijiayou.get("luxianmingcheng")%></em>
						</a>
			  </li>
					
					<%
		}
	}
			%>
		  </ul>
		</div>
	</div>
</div>

<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>专业的服务 一流的水平</em>
			<div class="line">
				<h3>新闻资讯<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				 <%
    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='新闻资讯' order by id desc ",1,8)){
     %>
					<li>
						<a href="gg_detail.jsp?id=<%=map.get("id")%>" title="<%=map.get("biaoti")%>">
							
							<div class="pic">
								<img src="<%=map.get("shouyetupian")%>" height="155" width="290" >
							</div>
							<div class="info">
								<em><%=Info.ensubStr(map.get("biaoti"),16)%></em>
								<p><%=Info.ensubStr(map.get("zhaiyao"),30)%></p>
							</div>
						</a>
					</li>
					<%
							}
							%>
		  </ul>
		</div>
		<a href="news.jsp?lb=新闻资讯" class=" more news-more">查看更多</a>
	</div>
</div>
<script type="text/javascript">
	jQuery(".case").slide({mainCell:".case-list ul",autoPlay:true,effect:"leftMarquee",vis:4,interTime:50,trigger:"click"});
</script>
<%@ include file="qtdown.jsp"%>
</body></html>
