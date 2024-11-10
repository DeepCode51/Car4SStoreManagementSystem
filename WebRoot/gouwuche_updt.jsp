<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>购物车</title>
	
	
		<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>
	<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>
<script language="javascript">




	
	


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

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

if(request.getParameter("f")!=null){

double zongjinej=0;zongjinej=Float.valueOf(request.getParameter("xiaoshoujiage")).floatValue()*Float.valueOf(request.getParameter("shuliang")).floatValue();




 

ext.put("zongjine",zongjinej);




new CommDAO().update(request,response,"gouwuche",ext,true,false,"gouwuche_list2.jsp"); 
}
HashMap mmm = new CommDAO().getmap(id,"gouwuche"); 

%>
  <form  action="gouwuche_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改购物车:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">
     <tr><td>商品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='<%= mmm.get("shangpinmingcheng")%>' class="form-control" /></td></tr>
     <tr><td>商品类别：</td><td><input name='shangpinleibie' type='text' id='shangpinleibie' value='<%= mmm.get("shangpinleibie")%>' class="form-control" /></td></tr>
     <tr><td>品牌：</td><td><input name='pinpai' type='text' id='pinpai' value='<%= mmm.get("pinpai")%>' class="form-control" /></td></tr>
     <tr><td>销售价格：</td><td><input name='xiaoshoujiage' type='text' id='xiaoshoujiage' value='<%= mmm.get("xiaoshoujiage")%>' class="form-control" /></td></tr>
     <tr><td>数量：</td><td> 
	 
	 <input style="width: 40px; height: 30px; border: 2px white; float: left; border-style:solid; border-width:1px; border-color:#000000; background:#FFFFFF; color:#000000;border-radius:2px;margin-top:1px;   " type="button" value="-" onClick="reductionOf(this)" />
 <input name='shuliang' type='text' id='shuliang' value='<%= mmm.get("shuliang")%>' onblur='checkNumber(this)'  style='border:solid 1px #000000; color:#666666;   width:50px; height:28px; '    /><input style="width: 40px; height: 30px; border: 2px white; border-style:solid; border-width:1px;  border-color:#000000; background:#FFFFFF; color:#000000;border-radius:2px;  " type="button" value="+" onClick="add(this)" />
	 
	 </td></tr>
     <tr  style="display:none"><td>总金额：</td><td> </td></tr>
     <tr><td>用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' value='<%= mmm.get("yonghuming")%>' class="form-control" /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />   </td>
    </tr>
  </table>
</form>

  </body>
</html>
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
</script>