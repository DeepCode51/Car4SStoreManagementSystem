<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 24px}
-->
</style>
		
<div class="zx-service">
	 
	 
</div>
<div class="foot" style="background: #333333" align="center">



<div style="margin-top:80px; width:1200px; height:100px;  line-height: 100px; " >
		 
		 
					 <h1 style="color:#FFFFFF">杭州4s店管理系统</h1>
				</div>


	 
</div>

<div class="footfixed-zw"></div>
<script type="text/javascript">
$("body").append("<div class='qq'></div>")
$('.qq').load("/home/common/qq.html");
</script>
<script>
	(function(){
	 window.scrollReveal = new scrollReveal({ reset: false, move: '100px'});
	})();
</script>
<a  href="#"  ><div  id="scrollto" style="background:#ffffff; width:50px; height:50px;position:fixed; bottom:50px; right:5px; display:none; ">
<img style=" margin-top:5px; margin-left:5px;" src="qtimages/ico_791.jpg" height="40px;" width="40px;"   alt=""></div></a>


<script>
window.onscroll = function () {
    if (document.documentElement.scrollTop + document.body.scrollTop > 100) {
        document.getElementById("scrollto").style.display = "block";
    }
    else {
        document.getElementById("scrollto").style.display = "none";
    }
}

 $("#scrollto").click(function(){ //当点击标签的时候,使用animate在200毫秒的时间内,滚到顶部
 
        $("html,body").animate({scrollTop:"0px"},400);
 
    }); 
</script>