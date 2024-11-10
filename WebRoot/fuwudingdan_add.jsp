<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>服务订单</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"fuwuyuyue");
 String dingdanhao="";
  	String dingdanleixing="";
  	String chepaihao="";
  	String pinpai="";
  	String cheliangmingcheng="";
  	String chexing="";
  	String yonghuming="";
  	String xingming="";
  	String lianxidianhua="";
  	
 dingdanhao=(String)mlbdq.get("yuyuedanhao");
  	dingdanleixing=(String)mlbdq.get("yuyueleixing");
  	chepaihao=(String)mlbdq.get("chepaihao");
  	pinpai=(String)mlbdq.get("pinpai");
  	cheliangmingcheng=(String)mlbdq.get("cheliangmingcheng");
  	chexing=(String)mlbdq.get("chexing");
  	yonghuming=(String)mlbdq.get("yonghuming");
  	xingming=(String)mlbdq.get("xingming");
  	lianxidianhua=(String)mlbdq.get("lianxidianhua");
  	 
 

 HashMap mssdq = new CommDAO().getmaps("yuangonggonghao",(String)request.getSession().getAttribute("username"),"yuangongxinxi");
 String yuangongxingming="";
  	
 yuangongxingming=(String)mssdq.get("yuangongxingming");
  	
   %>
<script language="javascript">

function gow()
{
	document.location.href="fuwudingdan_add.jsp?id=<%=id%>";
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




ext.put("iszf","否");






new CommDAO().commOper("update fuwuyuyue set zhuangtai='已完成' where yuyuedanhao='"+request.getParameter("dingdanhao")+"'");
new CommDAO().insert(request,response,"fuwudingdan",ext,true,false,"fuwudingdan_list2.jsp"); 

}

%>

  <body >
 <form  action="fuwudingdan_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加服务订单:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.dingdanhao.value='<%=dingdanhao%>';document.form1.dingdanhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">订单类型：</td><td><input name='dingdanleixing' type='text' id='dingdanleixing' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.dingdanleixing.value='<%=dingdanleixing%>';document.form1.dingdanleixing.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">车牌号：</td><td><input name='chepaihao' type='text' id='chepaihao' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.chepaihao.value='<%=chepaihao%>';document.form1.chepaihao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">品牌：</td><td><input name='pinpai' type='text' id='pinpai' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.pinpai.value='<%=pinpai%>';document.form1.pinpai.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">车辆名称：</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangmingcheng.value='<%=cheliangmingcheng%>';document.form1.cheliangmingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">车型：</td><td><input name='chexing' type='text' id='chexing' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.chexing.value='<%=chexing%>';document.form1.chexing.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.yonghuming.value='<%=yonghuming%>';document.form1.yonghuming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.xingming.value='<%=xingming%>';document.form1.xingming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr><script language="javascript">document.form1.lianxidianhua.value='<%=lianxidianhua%>';document.form1.lianxidianhua.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">员工工号：</td><td><input name='yuangonggonghao' type='text' id='yuangonggonghao' onblur='' class="form-control" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">员工姓名：</td><td><input name='yuangongxingming' type='text' id='yuangongxingming' value='' onblur='' class="form-control" /></td></tr><script language="javascript">document.form1.yuangongxingming.value='<%=yuangongxingming%>';document.form1.yuangongxingming.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">明细表：</td><td><input name='mingxibiao' type='text' id='mingxibiao' size='50' value='' onblur='' class="form-control" /><div style="margin-top:12px;">&nbsp;<input type='button' value='上传' onClick="up('mingxibiao')"  /></div></td></tr>
		<tr><td  width="200">总费用：</td><td><input name='zongfeiyong' type='text' id='zongfeiyong' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabelzongfeiyong' />必需数字型</td></tr>
		<tr><td  width="200">备注：</td><td><textarea name='beizhu'  id='beizhu' onblur='' class="form-control" style="width:600px;height:80px;" ></textarea></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  class="btn btn-info btn-small" /> </td>
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
 
	var zongfeiyongobj = document.getElementById("zongfeiyong"); if(zongfeiyongobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(zongfeiyongobj.value)){document.getElementById("clabelzongfeiyong").innerHTML=""; }else{document.getElementById("clabelzongfeiyong").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
