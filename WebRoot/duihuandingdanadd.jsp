<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>兑换订单</title>
  
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
 HashMap mlbdq = new CommDAO().getmap(id,"jifenshangpin");
 String shangpinbianhao="";
  	String shangpinmingcheng="";
  	String shangpinleibie="";
  	String pinpai="";
  	String tupian="";
  	String suoxujifen="";
  	
 shangpinbianhao=(String)mlbdq.get("shangpinbianhao");
  	shangpinmingcheng=(String)mlbdq.get("shangpinmingcheng");
  	shangpinleibie=(String)mlbdq.get("shangpinleibie");
  	pinpai=(String)mlbdq.get("pinpai");
  	tupian=(String)mlbdq.get("tupian");
  	suoxujifen=(String)mlbdq.get("suoxujifen");
  	 
 HashMap mssdq = new CommDAO().getmaps("yonghuming",(String)request.getSession().getAttribute("username"),"huiyuanxinxi");
 String jifen="";
  String xingming=(String)mssdq.get("xingming"); 	
  String dianhua=(String)mssdq.get("dianhua"); 	
 jifen=(String)mssdq.get("jifen"); 
   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
	
	
 
	
function gow()
{
	document.location.href="duihuandingdanadd.jsp?id=<%=id%>";
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
			 
			<div class="line">
				<h3>兑换订单 </h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  <div class="content-form">
					<% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){

 
new CommDAO().commOper("update huiyuanxinxi set  jifen=jifen-"+request.getParameter("gongjijifen")+" where yonghuming='"+request.getSession().getAttribute("username")+"' ");

new CommDAO().commOper("update duihuandingdan set  xiaoliang=xiaoliang+"+request.getParameter("shuliang")+" where shangpinbianhao='"+request.getParameter("shangpinbianhao")+"'");
 
new CommDAO().insert(request,response,"duihuandingdan",ext,true,false,"index.jsp"); 

 }
%>
   <form  action="duihuandingdanadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr style="display:none"><td  width="200">图片：</td><td><input name='tupian' type='text' id='tupian' value='' onblur='' class="user" /></td></tr><script language="javascript">document.form1.tupian.value='<%=tupian%>';document.form1.tupian.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">商品编号：</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinbianhao.value='<%=shangpinbianhao%>';document.form1.shangpinbianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">商品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinmingcheng.value='<%=shangpinmingcheng%>';document.form1.shangpinmingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">商品类别：</td><td><input name='shangpinleibie' type='text' id='shangpinleibie' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinleibie.value='<%=shangpinleibie%>';document.form1.shangpinleibie.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">品牌：</td><td><input name='pinpai' type='text' id='pinpai' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.pinpai.value='<%=pinpai%>';document.form1.pinpai.setAttribute("readOnly",'true');</script> 
		<tr><td  width="200">所需积分：</td><td><input name='suoxujifen' type='text' id='suoxujifen' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.suoxujifen.value='<%=suoxujifen%>';document.form1.suoxujifen.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">兑换数量：</td><td><input name='shuliang' type='text' id='shuliang' value='' onblur='checkform()' class="user"   />&nbsp;<label id='clabelshuliang' />必需数字型</td>
		</tr>
		<tr ><td  width="200">共计积分：</td><td><input name='gongjijifen' type='text' id='gongjijifen' onblur='' class="user" value='' readonly="readonly" /></td></tr>
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' class="user" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr>
          <td>积分：</td>
		  <td><input name='jifen' type='text' id='jifen' value='' onblur='' class="user"   /></td>
		  </tr><script language="javascript">document.form1.jifen.value='<%=jifen%>';document.form1.jifen.setAttribute("readOnly",'true');</script>
		<tr>
		  <td>姓名：</td>
		  <td><input name='xingming' type='text' id='xingming' value='' onblur='' class="user"   /></td>
		  </tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>
		<tr>
		  <td>手机：</td>
		  <td><input name='shouji' type='text' id='shouji' value='' onblur='' class="user"   /></td>
		  </tr><script language="javascript">document.form1.shouji.value='<%=dianhua%>';document.form1.shouji.setAttribute("readOnly",'true');</script>
		<tr>
		  <td>地址：</td>
		  <td><input name='dizhi' type='text' id='dizhi' value='' onblur='' size="50" class="user"   />&nbsp;<label id='clabeldizhi' /> </td>
		  </tr>
		<tr>
          <td>备注：</td>
		  <td><textarea name='beizhu' cols='50' rows='5' id='beizhu' class="user" ></textarea></td>
		  </tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return checkform();" class='hsgqiehuanshitu'  />      </td>
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
 
 
 
<script language=javascript >  

	 
function checkform()
{
	 
	
	 var shuliangobj = document.getElementById("shuliang");
	 
	 if(shuliangobj.value==""){  
document.getElementById("clabelshuliang").innerHTML="&nbsp;&nbsp;<font color=red>请输入数量</font>";  
return false;  
}else{
document.getElementById("clabelshuliang").innerHTML="  ";  
}  

	  if(shuliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(shuliangobj.value)){document.getElementById("clabelshuliang").innerHTML=""; }else{document.getElementById("clabelshuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
 
	 
	
	
		var shuliangbj = document.getElementById("shuliang"); 
	
	 if(shuliangbj.value!=""){
	  document.getElementById("gongjijifen").value=document.getElementById("shuliang").value*document.getElementById("suoxujifen").value;
	  }

  if(parseInt(document.form1.gongjijifen.value)>parseInt(document.form1.jifen.value)){alert("对不起，积分不足无法兑换！");return false;}
	  
	
}
</script>  

 