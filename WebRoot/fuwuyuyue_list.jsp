<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>����ԤԼ</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
<link rel="stylesheet" href="images/bootstrap.min.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>���з���ԤԼ�б���</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ԤԼ���ţ�<input name="yuyuedanhao" type="text" id="yuyuedanhao" class="form-control2" />  ԤԼ���ڣ�<input name="yuyueriqi1" type="text" id="yuyueriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" class="form-control2" />-<input name="yuyueriqi2" type="text" id="yuyueriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" class="form-control2" /> ԤԼ���ͣ�<select name='yuyueleixing' id='yuyueleixing' class="form-control2"><option value="">����</option><option value="����">����</option><option value="ά��">ά��</option></select>  ���ƺţ�<input name="chepaihao" type="text" id="chepaihao" class="form-control2" />  Ʒ�ƣ�<input name="pinpai" type="text" id="pinpai" class="form-control2" />  ���ͣ�<input name="chexing" type="text" id="chexing" class="form-control2" />  ������ʽ��<input name="qudongfangshi" type="text" id="qudongfangshi" class="form-control2" />  ������ʽ��<input name="huandangfangshi" type="text" id="huandangfangshi" class="form-control2" />  ������<input name="xingming" type="text" id="xingming" class="form-control2" />  ��ϵ�绰��<input name="lianxidianhua" type="text" id="lianxidianhua" class="form-control2" /> ״̬��<select name='zhuangtai' id='zhuangtai' class="form-control2"><option value="">����</option><option value="δ���">δ���</option><option value="�����">�����</option></select>
   <input type="submit" name="Submit" value="����" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="����EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='fuwuyuyue_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#F3F3F3" class="table table-striped table-bordered table-hover">  
  <tr>
    <td width="35" height="50" align="center" bgcolor="#E6E6E6">���</td>
    <td bgcolor='#E6E6E6'>ԤԼ����</td>
	
    <td width="138" height="50" align="center" bgcolor="#E6E6E6">����ʱ��</td>
    
    <td width="260" height="50" align="center" bgcolor="#E6E6E6">����</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"fuwuyuyue"); 
    String url = "fuwuyuyue_list.jsp?1=1"; 
    String sql =  "select * from fuwuyuyue where 1=1";
	
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="35" height="50" align="center"><%=i %></td>
    <td><%=map.get("yuyuedanhao") %></td>
	
    <td width="138" height="50" align="center"><%=map.get("addtime") %></td>
    <td width="220" height="50" align="center"><a class="btn btn-danger btn" href="fuwuyuyue_updt.jsp?id=<%=map.get("id")%>"> <i class="glyphicon glyphicon-pencil" > </i> �޸�</a>  <a class="btn btn-warning" href="fuwuyuyue_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')"> <i class="glyphicon glyphicon-wrench" > </i> ɾ��</a> <a class="btn btn-info btn-small" href="fuwuyuyue_detail.jsp?id=<%=map.get("id")%>"> <i class="glyphicon glyphicon-random" > </i> ��ϸ</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>
