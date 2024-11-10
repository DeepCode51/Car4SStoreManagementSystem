<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>自驾游报名</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"zijiayou");
 String bianhao="";  	String luxianmingcheng="";  	String baomingfeiyong="";  	String luxianlicheng="";  	
 bianhao=(String)mlbdq.get("bianhao");  	luxianmingcheng=(String)mlbdq.get("luxianmingcheng");  	baomingfeiyong=(String)mlbdq.get("baomingfeiyong");  	luxianlicheng=(String)mlbdq.get("luxianlicheng");  	 
 

 HashMap mssdq = new CommDAO().getmaps("yonghuming",(String)request.getSession().getAttribute("username"),"huiyuanxinxi");
 String xingming="";  	String xingbie="";  	String dianhua="";  	
 xingming=(String)mssdq.get("xingming");  	xingbie=(String)mssdq.get("xingbie");  	dianhua=(String)mssdq.get("dianhua");  	
   %>
<script language="javascript">

function gow()
{
	document.location.href="zijiayoubaoming_add.jsp?id=<%=id%>&chepaihao="+document.form1.chepaihao.value;
}

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){



ext.put("issh","否");
ext.put("iszf","否");





new CommDAO().commOper("update zijiayou set baomingfeiyong=baomingfeiyong+"+request.getParameter("luxianlicheng")+" where bianhao='"+request.getParameter("bianhao")+"'");

new CommDAO().insert(request,response,"zijiayoubaoming",ext,true,false,""); 

}

%>

  <body >
 <form  action="zijiayoubaoming_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加自驾游报名:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<%=Info.getID()%>' onblur='' class="form-control" /></td></tr>		<tr><td  width="200">编号：</td><td><input name='bianhao' type='text' id='bianhao' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.bianhao.value='<%=bianhao%>';document.form1.bianhao.setAttribute("readOnly",'true');</script>		<tr><td  width="200">路线名称：</td><td><input name='luxianmingcheng' type='text' id='luxianmingcheng' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.luxianmingcheng.value='<%=luxianmingcheng%>';document.form1.luxianmingcheng.setAttribute("readOnly",'true');</script>		<tr><td  width="200">报名费用：</td><td><input name='baomingfeiyong' type='text' id='baomingfeiyong' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.baomingfeiyong.value='<%=baomingfeiyong%>';document.form1.baomingfeiyong.setAttribute("readOnly",'true');</script>		<tr><td  width="200">路线里程：</td><td><input name='luxianlicheng' type='text' id='luxianlicheng' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.luxianlicheng.value='<%=luxianlicheng%>';document.form1.luxianlicheng.setAttribute("readOnly",'true');</script>		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' class="form-control" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' class="form-control" /></td></tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>		<tr><td  width="200">性别：</td><td><input name='xingbie' type='text' id='xingbie' value='' onblur='' class="form-control" /></td></tr><script language="javascript">document.form1.xingbie.value='<%=xingbie%>';document.form1.xingbie.setAttribute("readOnly",'true');</script>		<tr><td  width="200">电话：</td><td><input name='dianhua' type='text' id='dianhua' value='' onblur='' class="form-control" /></td></tr><script language="javascript">document.form1.dianhua.value='<%=dianhua%>';document.form1.dianhua.setAttribute("readOnly",'true');</script>		<tr><td>车牌号：</td><td><%=Info.getselectsl("chepaihao","wodecheliang","chepaihao")%></td></tr>		<tr><td  width="200">车辆型号：</td><td><input name='cheliangxinghao' type='text' id='cheliangxinghao' class="form-control" ></td></tr>		<tr><td  width="200">备注：</td><td><textarea name='beizhu'  id='beizhu' onblur='' class="form-control" style="width:600px;height:80px;" ></textarea></td></tr>		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>

<%
if(request.getParameter("chepaihao")==null || request.getParameter("chepaihao").equals("")){}else{

HashMap mmm = new CommDAO().getmaps("chepaihao",request.getParameter("chepaihao"),"wodecheliang"); 
%>
<script language="javascript">
document.form1.chepaihao.value="<%=mmm.get("chepaihao")%>";document.form1.cheliangxinghao.value="<%=mmm.get("cheliangxinghao")%>";//suilafuzhi

</script>
<%
}
%>

<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
