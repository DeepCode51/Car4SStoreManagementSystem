<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>服务预约</title>
  
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

 
  String sql4="select * from wodecheliang  where  yonghuming='"+request.getSession().getAttribute("username")+"'   ";
CommDAO dao2 = new CommDAO();
  List<HashMap> userlist2 = dao2.select(sql4);

  if(userlist2.size()==0)
{
	out.print("<script>alert('对不起,清先添加车辆!');location.href='index.jsp';</script>");
	 
}
 

 HashMap mssdq = new CommDAO().getmaps("yonghuming",(String)request.getSession().getAttribute("username"),"huiyuanxinxi");
 String xingming="";
  	String lianxidianhua="";
  	
 xingming=(String)mssdq.get("xingming");
  	lianxidianhua=(String)mssdq.get("dianhua");
  	

   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
function checkform()
{
	var yuyueriqiobj = document.getElementById("yuyueriqi"); if(yuyueriqiobj.value==""){document.getElementById("clabelyuyueriqi").innerHTML="&nbsp;&nbsp;<font color=red>请输入预约日期</font>";return false;}else{document.getElementById("clabelyuyueriqi").innerHTML="  "; } 
	
}
function gow()
{
	document.location.href="fuwuyuyueadd.jsp?id=<%=id%>&chepaihao="+document.form1.chepaihao.value;
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
				<h3>服务预约<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  <div class="content-form">
					<% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){












new CommDAO().insert(request,response,"fuwuyuyue",ext,true,false,"index.jsp"); 

 }
%>
   <form  action="fuwuyuyueadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr><td  width="200">预约单号：</td><td><input name='yuyuedanhao' type='text' id='yuyuedanhao' value='<%=Info.getID()%>' onblur='' class="user" /></td></tr>
		<tr><td width="200">预约日期：</td><td><input name='yuyueriqi' type='text' id='yuyueriqi' value='' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" class="user"  />&nbsp;*<label id='clabelyuyueriqi' /></td></tr>
		<tr><td>预约类型：</td><td><select name='yuyueleixing' id='yuyueleixing' class="xingbie"><option value="保养">保养</option><option value="维修">维修</option></select></td></tr>
		<tr><td>车牌号：</td><td>
		
		<select name='chepaihao'  class="user" <select name='chepaihao' class="user"  <%=Info.getselectsl2("chepaihao","wodecheliang","chepaihao",(String)request.getSession().getAttribute("username"))%>
		</td></tr>
		<tr><td  width="200">品牌：</td><td><input name='pinpai' type='text' id='pinpai' class="user" ></td></tr>
		<tr><td  width="200">车辆名称：</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' class="user" ></td></tr>
		<tr><td  width="200">车型：</td><td><input name='chexing' type='text' id='chexing' class="user" ></td></tr>
		<tr><td  width="200">驱动方式：</td><td><input name='qudongfangshi' type='text' id='qudongfangshi' class="user" ></td></tr>
		<tr><td  width="200">换挡方式：</td><td><input name='huandangfangshi' type='text' id='huandangfangshi' class="user" ></td></tr>
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' class="user" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' class="user" /></td></tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='' onblur='' class="user" /></td></tr><script language="javascript">document.form1.lianxidianhua.value='<%=lianxidianhua%>';document.form1.lianxidianhua.setAttribute("readOnly",'true');</script>
		<tr style="display:none"><td>状态：</td><td><select name='zhuangtai' id='zhuangtai' class="xingbie"><option value="未完成">未完成</option><option value="已完成">已完成</option></select></td></tr>
		<tr><td  width="200">情况备注：</td><td><textarea name='qingkuangbeizhu'  id='qingkuangbeizhu' onblur='' class="user" style="width:600px;height:80px;" ></textarea></td></tr>
		
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
document.form1.pinpai.value="<%=mmm.get("pinpai")%>";
document.form1.cheliangmingcheng.value="<%=mmm.get("cheliangmingcheng")%>";
document.form1.chexing.value="<%=mmm.get("chexing")%>";
document.form1.qudongfangshi.value="<%=mmm.get("qudongfangshi")%>";
document.form1.huandangfangshi.value="<%=mmm.get("huandangfangshi")%>";
//suilafuzhi

</script>
<%
}
%>

<!--yoxudixtu-->
