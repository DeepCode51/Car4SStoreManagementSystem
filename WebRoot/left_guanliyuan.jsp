
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

				<li class="layui-nav-item">
                    <a href="javascript:;">系统用户管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='yhzhgl.jsp' target='hsgmain'>管理员用户</a></dd>
<dd><a href='mod.jsp' target='hsgmain'>修改密码</a></dd>

                    </dl>
                </li>
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">新闻数据管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='xinwentongzhi_add.jsp?lb=新闻资讯' target='hsgmain'>新闻资讯添加</a></dd>
<dd><a href='xinwentongzhi_list.jsp?lb=新闻资讯' target='hsgmain'>新闻资讯查询</a></dd>
<dd><a href='xinwentongzhi_add2.jsp?lb=变幻图' target='hsgmain'>变幻图添加</a></dd>
<dd><a href='xinwentongzhi_list2.jsp?lb=变幻图' target='hsgmain'>变幻图查询</a></dd>
                    </dl>
                </li>
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">会员管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='huiyuanxinxi_list.jsp' target='hsgmain'>会员查询</a></dd>

                    </dl>
                </li>
				          
				<li class="layui-nav-item">
                    <a href="javascript:;">员工管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='yuangongxinxi_add.jsp' target='hsgmain'>员工添加</a></dd>
<dd><a href='yuangongxinxi_list.jsp' target='hsgmain'>员工查询</a></dd>

                    </dl>
                </li>
           
                       
			
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">俱乐部管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='julebuxinxi_add.jsp' target='hsgmain'>俱乐部添加</a></dd>
<dd><a href='julebuxinxi_list.jsp' target='hsgmain'>俱乐部查询</a></dd>

                    </dl>
                </li>
                       
			
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">俱乐部活动管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='julebuhuodong_add.jsp' target='hsgmain'>俱乐部活动添加</a></dd>
<dd><a href='julebuhuodong_list.jsp' target='hsgmain'>俱乐部活动查询</a></dd>

                    </dl>
                </li>
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">自驾游管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='zijiayou_add.jsp' target='hsgmain'>自驾游添加</a></dd>
<dd><a href='zijiayou_list.jsp' target='hsgmain'>自驾游查询</a></dd>
	<dd><a href='zijiayoubaoming_list.jsp' target='hsgmain'>自驾游报名查询</a></dd>

                    </dl>
                </li>
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">车辆管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='cheliangxinxi_add.jsp' target='hsgmain'>车辆添加</a></dd>
<dd><a href='cheliangxinxi_list.jsp' target='hsgmain'>车辆查询</a></dd>

                    </dl>
                </li>
             
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">客户车辆管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='wodecheliang_list.jsp' target='hsgmain'>客户车辆查询</a></dd>

                    </dl>
                </li>
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">服务预约管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='fuwuyuyue_list.jsp' target='hsgmain'>服务预约查询</a></dd>
<dd><a href='fuwudingdan_list.jsp' target='hsgmain'>服务订单查询</a></dd>
                    </dl>
                </li>
                       
				<li class="layui-nav-item">
                    <a href="javascript:;">在线商城管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='leibiexinxi_add.jsp' target='hsgmain'>商品类别添加</a></dd>
<dd><a href='leibiexinxi_list.jsp' target='hsgmain'>商品类别查询</a></dd>

	<dd><a href='shangpinxinxi_add.jsp' target='hsgmain'>商品信息添加</a></dd>
<dd><a href='shangpinxinxi_list.jsp' target='hsgmain'>商品信息查询</a></dd>

<dd><a href='jifenshangpin_add.jsp' target='hsgmain'>积分商品添加</a></dd>
<dd><a href='jifenshangpin_list.jsp' target='hsgmain'>积分商品查询</a></dd>
                    </dl>
                </li>
				
					<li class="layui-nav-item">
                    <a href="javascript:;">商城订单管理</a>
                    <dl class="layui-nav-child"> 

<dd><a href='dingdanxinxi_list.jsp' target='hsgmain'>商城订单查询</a></dd>
<dd><a href='duihuandingdan_list.jsp' target='hsgmain'>积分订单查询</a></dd>
                    </dl>
                </li>
                       
				 
				
					<li class="layui-nav-item">
                    <a href="javascript:;">在线论坛管理</a>
                    <dl class="layui-nav-child">
						<dd><a href='bankuai_add.jsp' target='hsgmain'>板块添加</a></dd>
<dd><a href='bankuai_list.jsp' target='hsgmain'>板块查询</a></dd>
<dd><a href='tiezi_list.jsp' target='hsgmain'>帖子查询</a></dd>
                    </dl>
                </li>
              
             
                       
					<li class="layui-nav-item">
                    <a href="javascript:;">系统简介设置</a>
                    <dl class="layui-nav-child">
						<dd><a href='dx.jsp?lb=公司介绍' target='hsgmain'>公司介绍设置</a></dd>
<dd><a href='dx.jsp?lb=联系我们' target='hsgmain'>联系我们设置</a></dd>

                    </dl>
                </li>





