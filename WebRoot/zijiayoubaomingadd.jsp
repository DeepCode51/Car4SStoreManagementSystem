<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>自驾游报名</title>
  
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
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
	return;
}
  String id="";




 
  id=request.getParameter("id");
  
  
    String sql4="select * from wodecheliang  where  yonghuming='"+request.getSession().getAttribute("username")+"'   ";
CommDAO dao2 = new CommDAO();
  List<HashMap> userlist2 = dao2.select(sql4);

  if(userlist2.size()==0)
{
	out.print("<script>alert('对不起,清先添加车辆!');location.href='index.jsp';</script>");
	 
}
  
  
 HashMap mlbdq = new CommDAO().getmap(id,"zijiayou");
 String bianhao="";
  	String luxianmingcheng="";
  	String baomingfeiyong="";
  	String luxianlicheng="";
  	
 bianhao=(String)mlbdq.get("bianhao");
  	luxianmingcheng=(String)mlbdq.get("luxianmingcheng");
  	baomingfeiyong=(String)mlbdq.get("baomingfeiyong");
  	luxianlicheng=(String)mlbdq.get("luxianlicheng");
  	 
 

 HashMap mssdq = new CommDAO().getmaps("yonghuming",(String)request.getSession().getAttribute("username"),"huiyuanxinxi");
 String xingming="";
  	String xingbie="";
  	String dianhua="";
  	
 xingming=(String)mssdq.get("xingming");
  	xingbie=(String)mssdq.get("xingbie");
  	dianhua=(String)mssdq.get("dianhua");
  	

   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
function checkform()
{
	
}
function gow()
{
	document.location.href="zijiayoubaomingadd.jsp?id=<%=id%>&chepaihao="+document.form1.chepaihao.value;
}
popheight=850;
</script>


<body>
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<%@ include file="sidebufen1.jsp"%>
<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>专业的服务 一流的水平</em>
			<div class="line">
				<h3>自驾游报名<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  <div class="content-form">
					<% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){



ext.put("issh","否");
ext.put("iszf","否");





new CommDAO().commOper("update zijiayou set baomingrenshu=baomingrenshu+1 where bianhao='"+request.getParameter("bianhao")+"'");


new CommDAO().commOper("update huiyuanxinxi set jifen=jifen+"+request.getParameter("baomingfeiyong")+" where yonghuming='"+request.getSession().getAttribute("username")+"' ");


new CommDAO().insert(request,response,"zijiayoubaoming",ext,true,false,"index.jsp"); 

 }
%>
   <form  action="zijiayoubaomingadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr><td  width="200">订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<%=Info.getID()%>' onblur='' class="user" /></td></tr>
		<tr><td  width="200">编号：</td><td><input name='bianhao' type='text' id='bianhao' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.bianhao.value='<%=bianhao%>';document.form1.bianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">路线名称：</td><td><input name='luxianmingcheng' type='text' id='luxianmingcheng' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.luxianmingcheng.value='<%=luxianmingcheng%>';document.form1.luxianmingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">报名费用：</td><td><input name='baomingfeiyong' type='text' id='baomingfeiyong' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.baomingfeiyong.value='<%=baomingfeiyong%>';document.form1.baomingfeiyong.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">路线里程：</td><td><input name='luxianlicheng' type='text' id='luxianlicheng' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.luxianlicheng.value='<%=luxianlicheng%>';document.form1.luxianlicheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' class="user" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' class="user" /></td></tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">性别：</td><td><input name='xingbie' type='text' id='xingbie' value='' onblur='' class="user" /></td></tr><script language="javascript">document.form1.xingbie.value='<%=xingbie%>';document.form1.xingbie.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">电话：</td><td><input name='dianhua' type='text' id='dianhua' value='' onblur='' class="user" /></td></tr><script language="javascript">document.form1.dianhua.value='<%=dianhua%>';document.form1.dianhua.setAttribute("readOnly",'true');</script>
		<tr><td>车牌号：</td><td><select name='chepaihao'  class="user" <select name='chepaihao' class="user"  <%=Info.getselectsl2("chepaihao","wodecheliang","chepaihao",(String)request.getSession().getAttribute("username"))%></td></tr>
		<tr><td  width="200">车辆型号：</td><td><input name='cheliangxinghao' type='text' id='cheliangxinghao' class="user" ></td></tr>
		<tr><td  width="200">备注：</td><td><textarea name='beizhu'  id='beizhu' onblur='' class="user" style="width:600px;height:80px;" ></textarea></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return checkform();" class='hsgqiehuanshitu'  />
 </td>
    </tr>
	</table>
  </form>	
					</div>
			</ul>
		</div>
	</div>
</div>
<%@ include file="qtdown.jsp"%>

</body> 
</html>
<%
if(request.getParameter("chepaihao")==null || request.getParameter("chepaihao").equals("")){}else{

HashMap mmm = new CommDAO().getmaps("chepaihao",request.getParameter("chepaihao"),"wodecheliang"); 
%>
<script language="javascript">
document.form1.chepaihao.value="<%=mmm.get("chepaihao")%>";
document.form1.cheliangxinghao.value="<%=mmm.get("cheliangmingcheng")%>";
//suilafuzhi

</script>
<%
}
%>

<!--yoxudixtu-->
