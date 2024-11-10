<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>车型统计</title>
<script src="echarts.min.js"></script>
</head>
<body >
<%
String sql;
int i=0;
String tleixing="";
sql="select distinct(chexing) as ss from cheliangxinxi";
  for(HashMap map:new CommDAO().select(sql)){
  i++;
  tleixing=tleixing+"'"+map.get("ss")+"',";
  }
 if(i>0)
 {
 	tleixing=tleixing.substring(0,tleixing.length()-1);
 }
String[] b = tleixing.split(",");
String x="";
String ttz="";
for(int i2=0;i2<b.length;i2++){
	sql="select count(id) as bbb from cheliangxinxi where chexing="+b[i2]+"";
	for(HashMap map2:new CommDAO().select(sql)){
 		ttz=(String)map2.get("bbb");
  	}
	x=x+"{value: "+ttz+" , name:"+b[i2]+"},";
}
%>
<div id="main" style="width:100%;height:480px" ></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
        window.onresize = myChart.resize;
    var option = {
        title: {
            text: '车型统计图'
        },
        tooltip: {},
        legend: {
            data:[<%=tleixing%>]
        },
        grid: {
                left: '5%',
                right: '5%',
                bottom: '5%',
                width: '90%',
                containLabel: true
            },
        xAxis: {
        },
        yAxis: {
          data: []
        },
        series: [
             {
                name: '车型比例',
                type: 'pie',
                radius: 150,
        center: ['50%', '50%'],
                data: [<%=x%>]
            },

        ]
    };
    myChart.setOption(option);
</script>  
    
</body>
</html>


