<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>商品信息</title>
  
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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<%

%>

<body>
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			 
			<div class="line">
				<h3>商品信息 </h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  <div class="content-form">
					<link rel="stylesheet" href="images/hsgcommon/divqt.css" type="text/css">
<form name="form1" id="form1" method="post" action="" style="width:100%">
   搜索:  商品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" class="form-control2"  />  商品类别：<%=Info.getselect("shangpinleibie","leibiexinxi","shangpinleibie"," 1=1 ")%>  品牌：<input name="pinpai" type="text" id="pinpai" class="form-control2"  />  销售价格：<input name="xiaoshoujiage1" type="text" id="xiaoshoujiage1"  value='' class="form-control2" />-<input name="xiaoshoujiage2" type="text" id="xiaoshoujiage2"  value='' class="form-control2" />
     <input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu' />   <input type='button' name='Submit5' value='切换视图'  class='hsgqiehuanshitu' onClick="javascript:location.href='shangpinxinxilist.jsp';" /> 
</form>
						<table width="100%" height="12%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                           <% 
  	


  	 new CommDAO().delete(request,"shangpinxinxi"); 
    String url = "shangpinxinxilisttp.jsp?1=1"; 
    String sql =  "select * from shangpinxinxi where  issh='是'";
	
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{sql=sql+" and shangpinmingcheng like '%"+request.getParameter("shangpinmingcheng")+"%'";}
if(request.getParameter("shangpinleibie")=="" ||request.getParameter("shangpinleibie")==null ){}else{sql=sql+" and shangpinleibie like '%"+request.getParameter("shangpinleibie")+"%'";}
if(request.getParameter("pinpai")=="" ||request.getParameter("pinpai")==null ){}else{sql=sql+" and pinpai like '%"+request.getParameter("pinpai")+"%'";}
if (request.getParameter("xiaoshoujiage1")==""  ||request.getParameter("xiaoshoujiage1")==null ) {}else{sql=sql+" and xiaoshoujiage >= '"+request.getParameter("xiaoshoujiage1")+"'";}
if (request.getParameter("xiaoshoujiage2")==""  ||request.getParameter("xiaoshoujiage2")==null ) {}else {sql=sql+" and xiaoshoujiage <= '"+request.getParameter("xiaoshoujiage2")+"'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
                           <td height="316" align="center"><table  height="285" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="250" align="center"><a href="shangpinxinxidetail.jsp?id=<%=map.get("id")%>"><img src="<%=map.get("tupian")%>" width="210" height="250" border="0" style="border-radius: 18px;" /></a></td>
                                </tr>
                                <tr>
                                  <td height="26" align="left"><p><%=map.get("shangpinmingcheng")%></p>
                                    <p><font color="#FF0000">￥:<%=map.get("xiaoshoujiage")%></font></p></td>
                                </tr>
                            </table></td>
                            <%
								if (i==4)
								{
									i=0;
									out.print("</tr><tr>");
								}
				  	}
					
				  %>
                          </tr>
                        </table>
						
${page.info }	
					</div>
			</ul>
		</div>
	</div>
</div>
<%@ include file="qtdown.jsp"%>

</body> 
</html>

<!--yoxudixtu-->
