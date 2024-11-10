<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>服务预约</title>
	
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

new CommDAO().update(request,response,"fuwuyuyue",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"fuwuyuyue"); 

%>
  <form  action="fuwuyuyue_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改服务预约:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
          <tr><td>预约单号：</td><td><input name='yuyuedanhao' type='text' id='yuyuedanhao' value='<%= mmm.get("yuyuedanhao")%>' class="form-control" /></td></tr>     <tr><td>预约日期：</td><td><input name='yuyueriqi' type='text' id='yuyueriqi' value='<%= mmm.get("yuyueriqi")%>' onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly='readonly' class="form-control"  /></td></tr>     <tr><td>预约类型：</td><td><select name='yuyueleixing' id='yuyueleixing' class="form-control2"><option value="保养">保养</option><option value="维修">维修</option></select></td></tr><script language="javascript">document.form1.yuyueleixing.value='<%=mmm.get("yuyueleixing")%>';</script>     <tr><td>车牌号：</td><td><input name='chepaihao' type='text' id='chepaihao' value='<%= mmm.get("chepaihao")%>' class="form-control" /></td></tr>     <tr><td>品牌：</td><td><input name='pinpai' type='text' id='pinpai' value='<%= mmm.get("pinpai")%>' class="form-control" /></td></tr>     <tr><td>车辆名称：</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='<%= mmm.get("cheliangmingcheng")%>' class="form-control" /></td></tr>     <tr><td>车型：</td><td><input name='chexing' type='text' id='chexing' value='<%= mmm.get("chexing")%>' class="form-control" /></td></tr>     <tr><td>驱动方式：</td><td><input name='qudongfangshi' type='text' id='qudongfangshi' value='<%= mmm.get("qudongfangshi")%>' class="form-control" /></td></tr>     <tr><td>换挡方式：</td><td><input name='huandangfangshi' type='text' id='huandangfangshi' value='<%= mmm.get("huandangfangshi")%>' class="form-control" /></td></tr>     <tr><td>用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' value='<%= mmm.get("yonghuming")%>' class="form-control" /></td></tr>     <tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<%= mmm.get("xingming")%>' class="form-control" /></td></tr>     <tr><td>联系电话：</td><td><input name='lianxidianhua' type='text' id='lianxidianhua' value='<%= mmm.get("lianxidianhua")%>' class="form-control" /></td></tr>     <tr><td>状态：</td><td><select name='zhuangtai' id='zhuangtai' class="form-control2"><option value="未完成">未完成</option><option value="已完成">已完成</option></select></td></tr><script language="javascript">document.form1.zhuangtai.value='<%=mmm.get("zhuangtai")%>';</script>     <tr><td>情况备注：</td><td><textarea name='qingkuangbeizhu' cols='50' rows='5' id='qingkuangbeizhu' class="form-control" style="width:600px;height:80px;" ><%=mmm.get("qingkuangbeizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


