<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<div class="banner">
	<div class="banner-hd">
		<ul class="ydl c">
		<%
				int bhti=0;		
				int xxbbt=0;				
    for(HashMap map:new CommDAO().select("select shouyetupian from xinwentongzhi where leibie='±ä»ÃÍ¼'  order by id desc ")){
	bhti++;
	if(bhti<=5)
	{
     %>
			<li style="display: none;"><img src="<%=map.get("shouyetupian")%>" width="100%" height="550px;"></li>
<%
	  }
	  }
	  %>

		</ul>
		<div class="hd">
			<ul><li class=""></li><li class="on"></li><li class=""></li><li class=""></li><li class=""></li></ul>
		</div>
	</div>
	<script type="text/javascript">
		$('.banner-hd').find(".prev,.next").fadeTo("show",0.4);
		$(".banner-hd").slide({ titCell:".hd ul" , mainCell:".ydl" ,  autoPlay:true, delayTime:700 , autoPage:"<li></li>" });
	</script>
</div>