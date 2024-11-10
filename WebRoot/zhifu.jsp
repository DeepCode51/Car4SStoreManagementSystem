<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%
 

String id=request.getParameter("id");
String biao=request.getParameter("biao");

String sql="update "+biao+" set iszf='是' where id="+id+"";
  	  	
new CommDAO().commOper(sql);
out.print("<script>alert('支付成功!!');location.href='sy/sy.jsp';</script>");
  	  


 %>
  </body>
</html>

