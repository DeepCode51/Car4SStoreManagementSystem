<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>购物车</title>
  
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
 HashMap mlbdq = new CommDAO().getmap(id,"shangpinxinxi");
 String shangpinbianhao="";
  	String shangpinmingcheng="";
  	String shangpinleibie="";
  	String pinpai="";
  	String tupian="";
  	String xiaoshoujiage="";
  	
 shangpinbianhao=(String)mlbdq.get("shangpinbianhao");
  	shangpinmingcheng=(String)mlbdq.get("shangpinmingcheng");
  	shangpinleibie=(String)mlbdq.get("shangpinleibie");
  	pinpai=(String)mlbdq.get("pinpai");
  	tupian=(String)mlbdq.get("tupian");
  	xiaoshoujiage=(String)mlbdq.get("xiaoshoujiage");
  	 
 

   %>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
	
	
 
	
	function reductionOf(shuliang) {
                //减前判断
		if ($(shuliang).next().val() == '') {
			$(shuliang).next().val(1);
		}
		$(shuliang).next().val(parseInt($(shuliang).next().val()) - 1);//数值减
		$(shuliang).next().val($(shuliang).next().val());//赋值给框
	};
        //加数量
	function add(shuliang) {
                //加前判断
		if ($(shuliang).prev().val() == '') {
			$(shuliang).prev().val(1);
		}
		$(shuliang).prev().val(parseInt($(shuliang).prev().val()) + 1);//数值加
		$(shuliang).prev().val($(shuliang).prev().val());//赋值给框
	};
	
	
	
	
	
	
function checkform()
{
	var shuliangobj = document.getElementById("shuliang"); if(shuliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(shuliangobj.value)){document.getElementById("clabelshuliang").innerHTML=""; }else{document.getElementById("clabelshuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    
	
}
function gow()
{
	document.location.href="gouwucheadd.jsp?id=<%=id%>";
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
				<h3>购物车 </h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  <div class="content-form">
					<% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){

double zongjinej=0;zongjinej=Float.valueOf(request.getParameter("xiaoshoujiage")).floatValue()*Float.valueOf(request.getParameter("shuliang")).floatValue();

ext.put("issh","未下单");

ext.put("zongjine",zongjinej);



new CommDAO().commOper("update shangpinxinxi set  xiaoliang=xiaoliang+"+request.getParameter("shuliang")+" where shangpinbianhao='"+request.getParameter("shangpinbianhao")+"'");
new CommDAO().insert(request,response,"gouwuche",ext,true,false,"index.jsp"); 

 }
%>
   <form  action="gouwucheadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
       <tr style="display:none"><td  width="200">图片：</td><td><input name='tupian' type='text' id='tupian' value='' onblur='' class="user" /></td></tr><script language="javascript">document.form1.tupian.value='<%=tupian%>';document.form1.tupian.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">商品编号：</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinbianhao.value='<%=shangpinbianhao%>';document.form1.shangpinbianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">商品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinmingcheng.value='<%=shangpinmingcheng%>';document.form1.shangpinmingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">商品类别：</td><td><input name='shangpinleibie' type='text' id='shangpinleibie' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.shangpinleibie.value='<%=shangpinleibie%>';document.form1.shangpinleibie.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">品牌：</td><td><input name='pinpai' type='text' id='pinpai' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.pinpai.value='<%=pinpai%>';document.form1.pinpai.setAttribute("readOnly",'true');</script> 
		<tr><td  width="200">销售价格：</td><td><input name='xiaoshoujiage' type='text' id='xiaoshoujiage' value='' onblur='' class="user"  readonly='readonly' /></td></tr><script language="javascript">document.form1.xiaoshoujiage.value='<%=xiaoshoujiage%>';document.form1.xiaoshoujiage.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">数量：</td><td>
		
		<input style="width: 40px; height: 30px; border: 2px white; float: left; border-style:solid; border-width:1px; border-color:#000000; background:#FFFFFF;  " type="button" value="-" onClick="reductionOf(this)" />
	 <input name='shuliang' type='text' id='shuliang' value='1' onblur='checkNumber(this)'  style='border:solid 1px #000000; color:#666666; width:50px; height:28px;'    />	  
		  <input style="width: 40px; height: 30px; border: 2px white; border-style:solid; border-width:1px;  border-color:#000000; background:#FFFFFF;  " type="button" value="+" onClick="add(this)" />
		
		</td>
		</tr>
		<tr style="display:none"><td  width="200">总金额：</td><td> 此项不必填写，系统自动计算</td></tr>
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' class="user" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		
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

<!--yoxudixtu-->
