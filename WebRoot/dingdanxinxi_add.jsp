<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>订单信息</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
  
  
  
   <%
   String zongjinez="";
   zongjinez=String.valueOf(request.getParameter("zongjinez"));
 
 
  
  
if(request.getParameter("zongjinez")!=null){
  if(Float.valueOf(zongjinez).floatValue()==0)
{
	out.print("<script>alert('对不起,您没有未下单的商品!');location.href='gouwuche_list2.jsp';</script>");
	return;
}
}
//这种写法先判断不为空，因为在提交按钮点了之后，会跳转回这个页，而zongjinez此时是空的，因为跳转时重新刷新了页面，而zongjinez是上个页传过来的，本身这个页并没有值
//另一种写法：String sql3=  "select * from goumaijilu where goumairen='"+request.getSession().getAttribute("username")+"' and issh='否'";
//CommDAO dao = new CommDAO();
  //List<HashMap> userlist1 = dao.select(sql3);

  //if(userlist1.size()==0)
//{
	//out.print("<script>alert('对不起,您没有未下单的商品!');location.href='goumaijilu_list2.jsp';</script>");
	//return;
//}
//这种写法判断了能不能查询到未下单的记录，找不到则提示

  %>
  
<%
  String id="";
  id=request.getParameter("id");
  
  
    
  
   
 HashMap mssdq = new CommDAO().getmaps("yonghuming",(String)request.getSession().getAttribute("username"),"huiyuanxinxi");
 
  String xingming=(String)mssdq.get("xingming"); 	
  String dianhua=(String)mssdq.get("dianhua"); 	
  
  
  
  
  
 
 
   String ddnr="";
  String sql2=  "select * from gouwuche  where yonghuming='"+request.getSession().getAttribute("username")+"' and issh='未下单' ";
  ArrayList<HashMap> list = PageManager.getPages("",15,sql2, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	
	ddnr=ddnr+"商品编号："+(String)map.get("shangpinbianhao")+",商品名称："+(String)map.get("shangpinmingcheng")+",购买数量："+(String)map.get("shuliang")+",总金额："+(String)map.get("zongjine")+";";
	
 

	
	
	
	
	}
		
	
	
   %>
<script language="javascript">

function gow()
{
	document.location.href="dingdanxinxi_add.jsp?id=<%=id%>";
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



String sql="update gouwuche set issh='已下单' where yonghuming='"+request.getSession().getAttribute("username")+"' and issh='未下单'";
new CommDAO().commOper(sql); 

new CommDAO().commOper("update huiyuanxinxi set  jifen=jifen+"+request.getParameter("zongjine")+" where yonghuming='"+request.getSession().getAttribute("username")+"' ");


new CommDAO().insert(request,response,"dingdanxinxi",ext,true,false,"dingdanxinxi_list2.jsp"); 

}

%>

  <body >
 <form  action="dingdanxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加订单信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' readonly="readonly" value='<%=Info.getID()%>' onblur='' class="form-control" /></td></tr>
		<tr><td  width="200">订单内容：</td><td><textarea name='dingdanneirong'  id='dingdanneirong' readonly="readonly" onblur='checkform()' class="form-control" style="width:600px;height:80px;" ><%=ddnr%></textarea>&nbsp;*<label id='clabeldingdanneirong' /></td></tr>
		<tr><td  width="200">总金额：</td><td><input name='zongjine' readonly="readonly" type='text' id='zongjine' value='<%=zongjinez%>' onblur='checkform()' class="form-control" /> </td></tr> 
		<tr><td  width="200">用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' onblur='' class="form-control" value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr><td  width="200">姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%=xingming%>' onblur='' class="form-control" /></td></tr> 
		<tr><td  width="200">手机：</td><td><input name='shouji' type='text' id='shouji' value='<%=dianhua%>' onblur='checkform()' class="form-control" />&nbsp;<label id='clabelshouji' />必需电话格式[7或8位电话，或11位手机]</td></tr> 
		<tr><td  width="200">收货地址：</td><td><input name='shouhuodizhi' type='text' id='shouhuodizhi' value='' onblur='' class="form-control" /></td></tr>
		<tr  ><td  width="200">备注：</td><td><textarea name='beizhu'  id='beizhu' onblur='' class="form-control" style="width:600px;height:80px;" ></textarea></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  class="btn btn-info btn-small" />     </td>
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
 
	var dingdanneirongobj = document.getElementById("dingdanneirong"); if(dingdanneirongobj.value==""){document.getElementById("clabeldingdanneirong").innerHTML="&nbsp;&nbsp;<font color=red>请输入订单内容</font>";return false;}else{document.getElementById("clabeldingdanneirong").innerHTML="  "; } 
	var zongjineobj = document.getElementById("zongjine"); if(zongjineobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(zongjineobj.value)){document.getElementById("clabelzongjine").innerHTML=""; }else{document.getElementById("clabelzongjine").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var shoujiobj = document.getElementById("shouji"); if(shoujiobj.value!=""){ if(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(shoujiobj.value) || /^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(shoujiobj.value)){document.getElementById("clabelshouji").innerHTML=""; }else{document.getElementById("clabelshouji").innerHTML="&nbsp;&nbsp;<font color=red>必需电话格式[7或8位电话，或11位手机]</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
