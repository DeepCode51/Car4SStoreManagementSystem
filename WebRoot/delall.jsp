<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>批量删除</title>
    

  </head>
  
  <body>
  <%
 

String id="";
String tablename=request.getParameter("tablename");
String lb=request.getParameter("lb");
String[]   values   =   request.getParameterValues("pldel");
if(values!=null)
{
   for(int i=0;i<values.length;i++)
{
	id=id+values[i]+",";
	}
	
id=id.substring(0,id.length()-1);

String sql="delete from "+tablename+" where id in ("+id+")";
//out.print(sql);
 new CommDAO().commOper(sql); 
out.print("<script>alert('删除成功!!');location.href='xinwentongzhi_list.jsp?lb="+lb+"';</script>");
  	  
}
else
{
out.print("<script>alert('对不起，您没有选择任何要删除的行!!');location.href='xinwentongzhi_list.jsp?lb="+lb+"';</script>");
}

 %>
  </body>
</html>

