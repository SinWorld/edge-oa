<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报销详情</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<script src="../jquery/jquery-3.3.1.js"></script>
<script src="../echarts/echarts.min.js"></script>
<script type="text/javascript">
	//柱状图
	function zztShow() {
		$('#zxt').hide();
		$('#bzt').hide();
		$('#zzt').show();
		$('#zztShow').val(true);
		$('#zxtShow').val(false);
		$('#bztShow').val(false);
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('zzt'));
		//用户名
		var userName=new Array();
		//报销金额
		var bxjes=new Array();
		$.ajax({
			type : "post",
			url : "<c:url value='/bxxq/queryAllUser.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for(var i=0;i<msg.length;i++){
					userName.push(msg[i].reimbursement_bxr);
					bxjes.push(msg[i].reimbursement_bxje);
				}
				myChart.setOption({
					color : [ '#3398DB' ],
					legend : {
						 data:userName
					},
					tooltip : {},
					grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
					},
					xAxis : {
						name:"成员",
						type : 'category',
						data : userName,
						axisTick: {
				            alignWithLabel: true
				        }
					
					},
					yAxis : {
						type : 'value',
						name:"报销金额(元)"
					},
					series : [{
							data : bxjes,
							barWidth: '20%',
							type : 'bar',
							barGap: 0
						}]
				});
			}
		});
	}
	//折线图
	function zxtShow(){
		$('#zzt').hide();
		$('#bzt').hide();
		$('#zxt').show();
		$('#zxtShow').val(true);
		$('#zztShow').val(false);
		$('#bztShow').val(false);
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('zxt'));
		//用户名
		var userName=new Array();
		//报销金额
		var bxjes=new Array();
		$.ajax({
			type : "post",
			url : "<c:url value='/bxxq/queryAllUser.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for(var i=0;i<msg.length;i++){
					userName.push(msg[i].reimbursement_bxr);
					bxjes.push(msg[i].reimbursement_bxje);
				}
				myChart.setOption({
					 	tooltip: {
					        trigger: 'axis',
					        axisPointer: {
					            type: 'cross',
					            label: {
					                backgroundColor: '#6a7985'
					            }
					        }
					    },
						grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
						},
					  xAxis: {
						  	name:"成员",
					        type: 'category',
					        data: userName
					        
					    },
					    yAxis: {
					    	name:"报销金额(元)",
					        type: 'value'
					    },
					    series: [{
					    	name:"报销金额(元)",
					        data: bxjes,
					        type: 'line'
					       
					    }]
				});
			}
		});
	}
	//饼状图
	function bztShow(){
		$('#zzt').hide();
		$('#zxt').hide();
		$('#bzt').show();
		$('#bztShow').val(true);
		$('#zztShow').val(false);
		$('#zxtShow').val(false);
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('bzt'));
		//用户名
		var userName=new Array();
		//报销金额
		var bxjes=new Array();
		$.ajax({
			type : "post",
			url : "<c:url value='/bxxq/queryAllUser.do'/>",
			async : false,
			dataType : 'json',
			error : function() {
				alert("出错");
			},
			success : function(msg) {
				for(var i=0;i<msg.length;i++){
					userName.push(msg[i].reimbursement_bxr);
					bxjes.push(msg[i].reimbursement_bxje);
				}
				myChart.setOption({
					    tooltip: {
					        trigger: 'item',
					        formatter: "{a} <br/>{b}: {c} ({d}%)"
					    },
					    legend: {
					        orient: 'vertical',
					        x: 'left',
					        data:userName
					    },
					    series: [
					        {
					            name:'报销金额',
					            type:'pie',
					            radius: ['50%', '70%'],
					            avoidLabelOverlap: false,
					            label: {
					                normal: {
					                    show: false,
					                    position: 'center'
					                },
					                emphasis: {
					                    show: true,
					                    textStyle: {
					                        fontSize: '30',
					                        fontWeight: 'bold'
					                    }
					                }
					            },
					            labelLine: {
					                normal: {
					                    show: false
					                }
					            },
					            data:[
					                  {value:bxjes[0], name:userName[0]},
					                  {value:bxjes[1], name:userName[1]},
					                  {value:bxjes[2], name:userName[2]},
					                  {value:bxjes[3], name:userName[3]},
					                  {value:bxjes[4], name:userName[4]}
					            ]
					        }
					    ]
					});
			}
		});
	}
</script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<script>
	layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form
		  ,layer = layui.layer
		  ,layedit = layui.layedit
		  ,laydate = layui.laydate;
		  form.render();
		  //日期
		  laydate.render({
		    elem: '#date'
		  });
		  laydate.render({
			    elem: '#date2'
		  });
	});

	//搜索函数
	function queryRq(){
		//获得柱状图是否显示
		var zztIsShow=$('#zztShow').val();
		//获得折线图是否显示
		var zxtIsShow=$('#zxtShow').val();
		//获得饼状图是否显示
		var bztIsShow=$('#bztShow').val();
		//获得输入的日期值
		var beginTime=$('#date').val();
		var endTime=$('#date2').val();
		if(zztIsShow=="true"){
			//执行重载
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('zzt'));
			//用户名
			var userName=new Array();
			//报销金额
			var bxjes=new Array();
			$.ajax({
				type : "post",
				url : "<c:url value='/bxxq/queryAllUserBxxqByRQ.do'/>",
				async : false,
				dataType : 'json',
				data:{"beginTime":beginTime,"endTime":endTime},
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for(var i=0;i<msg.length;i++){
						userName.push(msg[i].reimbursement_bxr);
						bxjes.push(msg[i].reimbursement_bxje);
					}
					myChart.setOption({
						color : [ '#3398DB' ],
						legend : {
							 data:userName
						},
						tooltip : {},
						grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
						},
						xAxis : {
							name:"成员",
							type : 'category',
							data : userName,
							axisTick: {
					            alignWithLabel: true
					        }
						
						},
						yAxis : {
							type : 'value',
							name:"报销金额(元)"
						},
						series : [{
								data : bxjes,
								barWidth: '20%',
								type : 'bar',
								barGap: 0
							}]
					});
				}
			});
		}
		if(zxtIsShow=="true"){
			//执行重载
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('zxt'));
			//用户名
			var userName=new Array();
			//报销金额
			var bxjes=new Array();
			$.ajax({
				type : "post",
				url : "<c:url value='/bxxq/queryAllUserBxxqByRQ.do'/>",
				async : false,
				dataType : 'json',
				data:{"beginTime":beginTime,"endTime":endTime},
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for(var i=0;i<msg.length;i++){
						userName.push(msg[i].reimbursement_bxr);
						bxjes.push(msg[i].reimbursement_bxje);
					}
					myChart.setOption({
					 	tooltip: {
					        trigger: 'axis',
					        axisPointer: {
					            type: 'cross',
					            label: {
					                backgroundColor: '#6a7985'
					            }
					        }
					    },
						grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
						},
					  xAxis: {
						  	name:"成员",
					        type: 'category',
					        data: userName
					        
					    },
					    yAxis: {
					    	name:"报销金额(元)",
					        type: 'value'
					    },
					    series: [{
					    	name:"报销金额(元)",
					        data: bxjes,
					        type: 'line'
					       
					    }]
				});
				}
			});
		}
	}
</script>
</head>
<body onload="zztShow()">
	<div class="layui-form-item" style="margin-top: 10px;">
			<div class="layui-inline" style="width: 10%;text-align: center;">
				<button type="button" onclick="zztShow()" class="layui-btn layui-btn-normal">柱状图</button>
			</div>
			<div class="layui-inline" style="width: 10%;text-align: center;">
				<button type="button" onclick="zxtShow()" class="layui-btn layui-btn-normal">折线图</button>
			</div>
			<div class="layui-inline" style="width: 10%;text-align: center;">
				<button type="button" onclick="bztShow()" class="layui-btn layui-btn-normal">饼状图</button>
			</div>
			 <div class="layui-inline" style="left:10px;width: 520px;">
			      <label class="layui-form-label" style="width: 70px;">报销日期</label>
			      <div class="layui-input-inline">
			        <input type="text" name="time1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
			      </div>
			       <i class="u-date_line" style="margin-left: -13px;line-height: 35px;">—</i>
			      <div class="layui-input-inline">
			        <input type="text" name="time2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
			      </div>
			      <div class="layui-input-inline" style="margin-top: -38px;left: 520px;">
			      	<button type="button" onclick="queryRq()"  class="layui-btn layui-btn-normal" title="搜索"><i class="layui-icon">&#xe615;</i></button>
			      </div>
			</div>
	</div>
	<input type="hidden" id="zztShow" value="false">
	<input type="hidden" id="zxtShow" value="false">
	<input type="hidden" id="bztShow" value="false">
	<div id="zzt" style="width: 100%; height: 400px;"></div>
	<div id="zxt" style="width: 100%; height: 400px;"></div>
	<div id="bzt"  style="width: 100%; height: 400px;"></div>
</body>
</html>