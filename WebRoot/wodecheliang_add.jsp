<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>我的车辆</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
  
 

 HashMap mssdq = new CommDAO().getmaps("yonghuming",(String)request.getSession().getAttribute("username"),"huiyuanxinxi");
 String xingming="";
  	String lianxidianhua="";
  	
 xingming=(String)mssdq.get("xingming");
  	lianxidianhua=(String)mssdq.get("dianhua");
  	
   %>
<script language="javascript">

function gow()
{
	document.location.href="wodecheliang_add.jsp?id=<%=id%>";
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












new CommDAO().insert(request,response,"wodecheliang",ext,true,false,""); 

}

%>

  <body >
 <form  action="wodecheliang_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加我的车辆:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">车牌号：</td><td><input name='chepaihao' type='text' id='chepaihao' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelchepaihao' /></td></tr>
		<tr><td  width="200">品牌：</td><td><input name='pinpai' type='text' id='pinpai' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelpinpai' /></td></tr>
		<tr><td  width="200">车辆名称：</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='' onblur='' class="form-control" /></td></tr>
		<tr><td>车型：</td><td><select name='chexing' id='chexing' class="form-control2" ><option value="小轿">小轿</option><option value="越野">越野</option><option value="面包">面包</option><option value="大卡">大卡</option><option value="跑车">跑车</option></select></td></tr>
		<tr><td>驱动方式：</td><td><select name='qudongfangshi' id='qudongfangshi' class="form-control2"><option value="前驱">前驱</option><option value="后驱">后驱</option><option value="四驱">四驱</option><option value="新能源">新能源</option></select></td></tr>
		<tr><td  width="200">排量：</td><td><input name='pailiang' type='text' id='pailiang' value='' onblur='' class="form-control" /></td></tr>
		<tr><td>换挡方式：</td><td><select name='huandangfangshi' id='huandangfangshi' class="form-control2" ><option value="自动档">自动档</option><option value="手动档">手动档</option><option value="手自一体">手自一体</option></select></td></tr>
		<tr><td  width="200">图片：</td><td><input name='tupian' type='text' id='tupian' size='50' value='' onblur='' class="form-control" /><div style="margin-top:12px;">&nbsp;<input type='button' value='上传' onClick="up('tupian')"  /></div></td></tr>
		<tr><td  width="200">总里程：</td><td><input name='zonglicheng' type='text' id='zonglicheng' value='' onblur='checkform()' class="form-control" /></td></tr>
		<tr><td  width="200">电压：</td><td><input name='dianya' type='text' id='dianya' value='' onblur='' class="form-control" /></td></tr>
		<tr><td  width="200">机油：</td><td><input name='jiyou' type='text' id='jiyou' value='' onblur='' class="form-control" /></td></tr>
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' class="form-control" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' class="form-control" /></td></tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='' onblur='' class="form-control" /></td></tr><script language="javascript">document.form1.lianxidianhua.value='<%=lianxidianhua%>';document.form1.lianxidianhua.setAttribute("readOnly",'true');</script>
		<tr style="display:none"><td>检查提醒：</td><td><select name='jianchatixing' id='jianchatixing' class="form-control2"><option value="否">否</option><option value="是">是</option></select></td></tr>
		<tr><td  width="200">备注：</td><td><textarea name='beizhu'  id='beizhu' onblur='' class="form-control" style="width:600px;height:80px;" ></textarea></td></tr>
		<tr ><td  width="200">健康检测：</td><td><textarea name='jiankangjiance'  id='jiankangjiance' onblur='' class="form-control" style="width:600px;height:80px;" ></textarea></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  class="btn btn-info btn-small" />
     </td>
    </tr>
  </table>
</form>

  </body>
</html>



<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var chepaihaoobj = document.getElementById("chepaihao"); if(chepaihaoobj.value==""){document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>请输入车牌号</font>";return false;}else{document.getElementById("clabelchepaihao").innerHTML="  "; } 
	var chepaihaoobj = document.getElementById("chepaihao");  
if(chepaihaoobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=wodecheliang&col=chepaihao&value="+chepaihaoobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelchepaihao").innerHTML="&nbsp;&nbsp;<font color=red>车牌号已存在</font>";  
return false;
}else{document.getElementById("clabelchepaihao").innerHTML="  ";  
}  
} 
	var pinpaiobj = document.getElementById("pinpai"); if(pinpaiobj.value==""){document.getElementById("clabelpinpai").innerHTML="&nbsp;&nbsp;<font color=red>请输入品牌</font>";return false;}else{document.getElementById("clabelpinpai").innerHTML="  "; } 
	var zonglichengobj = document.getElementById("zonglicheng"); if(zonglichengobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(zonglichengobj.value)){document.getElementById("clabelzonglicheng").innerHTML=""; }else{document.getElementById("clabelzonglicheng").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
