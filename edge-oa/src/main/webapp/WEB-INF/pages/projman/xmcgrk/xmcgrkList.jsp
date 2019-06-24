<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目采购入库列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>

</head>
<body>
	<form class="layui-form" action="" style="margin-top: 10px;">
		<div class="demoTable" style="background-color: #CAE1FF" id="gjssq">
			<div class="layui-form-item"
				style="width: 1280px; height: auto; padding: 0px; margin: 0 auto;"
				id="main"">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">销售合同</label>
						<div class="layui-input-inline"
							style="text-align: left; width: 60%">
							<select name="proj_Info_Id" id="proj_Info_Id"
								lay-filter="proj_Info_Id" lay-verify="proj_Info_Id"
								lay-search="">
								<option value="" selected="selected">请选择所属销售合同</option>
							</select>
						</div>
					</div>
					<div class="layui-inline" style="width: 430px;">
						<label class="layui-form-label" style="width: 100px;">产品名称</label>
						<div class="layui-input-inline">
							<input type="text" name="chanPinMC" lay-verify="chanPinMC"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="chanPinMC">
						</div>
					</div>
					<div class="layui-inline" style="width: 30%; left: -6px;">
						<label class="layui-form-label" style="width: 100px;">品牌</label>
						<div class="layui-input-inline">
							<input type="text" name="pinPai" lay-verify="pinPai"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="pinPai">
						</div>
					</div>

				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 80px;">规格型号</label>
						<div class="layui-input-inline">
							<input type="text" name="guiGeXH" lay-verify="guiGeXH"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="guiGeXH">
						</div>
					</div>
					<div class="layui-inline" style="width: 30%;">
						<label class="layui-form-label" style="width: 125px;">主要配置参数</label>
						<div class="layui-input-inline">
							<input type="text" name="zhuYaoPZCS" lay-verify="zhuYaoPZCS"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="zhuYaoPZCS">
						</div>
					</div>
					<div class="layui-inline" style="width: 33%;">
						<label class="layui-form-label" style="width: 167px;">单位</label>
						<div class="layui-input-inline">
							<input type="text" name="danWei" lay-verify="danWei"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="danWei">
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 80px;">数量</label>
						<div class="layui-input-inline">
							<input type="text" name="shuLiang" lay-verify="shuLiang"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="shuLiang">
						</div>
					</div>
					<div class="layui-inline" style="width: 30%;">
						<label class="layui-form-label" style="width: 125px;">单价</label>
						<div class="layui-input-inline">
							<input type="text" name="price" lay-verify="price"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="price">
						</div>
					</div>
					<div class="layui-inline" style="width: 33%;">
						<label class="layui-form-label" style="width: 167px;">金额</label>
						<div class="layui-input-inline">
							<input type="text" name="jinE" lay-verify="jinE"
								autocomplete="off" class="layui-input" style="width: 200px;"
								id="jinE">
						</div>
					</div>
				</div>
				<button class="layui-btn" data-type="reload" type="button"
					id="do_search" style="margin-left: 110px;">搜索</button>
				<button type="reset" class="layui-btn layui-btn-primary"
					style="margin-left: 65px;">重置</button>
			</div>
		</div>
	</form>
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<input type="hidden" id="flag" value="false">
	<div style="position: relative; top: -10px;">
		<table class="layui-hide" id="hwnrs" lay-filter="hwnrs"></table>
	</div>
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="width:25%;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">入库</button>
 	<button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
  </div>
</script>
	<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
	<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use([ 'table', 'form', 'layedit', 'laydate' ], function() {
			var table = layui.table;
			var url = $('#url').val();
			var form = layui.form;
			var layer = layui.layer;
			var layedit = layui.layedit;
			$('#gjssq').hide();
			allXSHT(form);
			table.render({
				elem : '#hwnrs',
				url : url + 'xmcgrk/xmcgrkList.do',
				title : '货物(产品内容)',
				toolbar : '#toolbarDemo',
				cols : [ [ {
					field : 'index',
					width : "5%",
					title : '序号',
					sort : true,
					type : 'numbers'
				}, {
					field : 'proj_Info_name',
					width : "12%",
					align : 'left',
					title : '所属销售合同'
				}, {
					field : 'chanPinMC',
					width : "20%",
					align : 'left',
					title : '产品名称'
				}, {
					field : 'pinPai',
					width : "15%",
					align : 'left',
					title : '品牌'
				}, {
					field : 'guiGeXH',
					width : "12%",
					align : 'left',
					title : '规格型号'
				}, {
					field : 'zhuYaoPZCS',
					width : "12%",
					align : 'left',
					title : '主要配置参数'
				}, {
					field : 'danWei',
					width : "6%",
					align : 'center',
					title : '单位'
				}, {
					field : 'shuLiang',
					width : "6%",
					align : 'center',
					title : '数量'
				}, {
					field : 'price',
					width : "6%",
					align : 'center',
					title : '单价'
				}, {
					field : 'jinE',
					width : "6%",
					align : 'center',
					title : '金额'
				} ] ],
				page : true,
				id : 'testReload',
				done : function(res, curr, count) {
					merge(res, curr, count);
				}
			});
			

			//头工具栏事件
			table.on('toolbar(hwnrs)', function(obj) {
				var url = $('#url').val();
				var flag = $('#flag').val();
				if (obj.event == 'getCheckData') {
					layer.open({
						type : 2,
						title : '入库',
						area : [ '100%', '100%' ],
						shadeClose : false,
						resize : false,
						anim : 1,
						content : [ url + "xmcgrk/initXMCGRK.do", 'yes' ]
					});
				} else if (obj.event == 'gjss') {
					if (flag == 'false') {
						$('#gjssq').fadeIn();
						$('#flag').val(true);
					} else {
						$('#gjssq').fadeOut();
						$('#flag').val(false);
					}

				}
			});

			//监听行工具事件 查看
			table.on('row(hwnrs)', function(obj) {
				var data = obj.data;
				var url = $('#url').val();
				var proj_Id = data.proj_Info_Id;
				layer.open({
					type : 2,
					title : '查看',
					area : [ '100%', '100%' ],
					shadeClose : false,
					resize : false,
					anim : 1,
					content : [
							url + "xshtdj/xiaoShouHTShowById.do?proj_Id="
									+ proj_Id, 'yes' ]
				});
			});

			// 执行搜索，表格重载
			$('#do_search').on('click', function() {
				// 搜索条件
				var proj_Info_Id = $('#proj_Info_Id').val();//所属销售合同
				var chanPinMC = $('#chanPinMC').val();//产品名称
				var pinPai = $('#pinPai').val();//品牌
				var guiGeXH = $('#guiGeXH').val();//规格型号
				var zhuYaoPZCS = $('#zhuYaoPZCS').val();//主要配置参数
				var danWei = $('#danWei').val();//单位
				var shuLiang = $('#shuLiang').val();//数量
				var price = $('#price').val();//单价
				var jinE = $('#jinE').val();//金额
				table.reload('testReload', {
					method : 'post',
					where : {
						'proj_Info_Id' : proj_Info_Id,
						'chanPinMC' : chanPinMC,
						'pinPai' : pinPai,
						'guiGeXH' : guiGeXH,
						'zhuYaoPZCS' : zhuYaoPZCS,
						'danWei' : danWei,
						'shuLiang' : shuLiang,
						'price' : price,
						'jinE' : jinE,
					},
					page : {
						curr : 1
					}
				});
			});

		});

		//ajax实现查询所有的流程已结束的销售合同
		function allXSHT(form) {
			$.ajax({
				type : "post",
				url : "<c:url value='/xmcgrk/queryAllXSHT.do'/>",
				async : false,
				dataType : 'json',
				error : function() {
					alert("出错");
				},
				success : function(msg) {
					for (var i = 0; i < msg.length; i++) {
						$("#proj_Info_Id").append(
								"<option value='"+msg[i].proj_Info_Id+"'>"
										+ msg[i].proj_Name + "</option>");
					}
					form.render('select');
				}
			});
		}

		//合并单元格
		 function merge(res, curr, count) {
			var data = res.data;
			var mergeIndex = 0;//定位需要添加合并属性的行数
			var mark = 1; //这里涉及到简单的运算，mark是计算每次需要合并的格子数
			var columsName = ['proj_Info_name'];//需要合并的列名称
			var columsIndex = [1];//需要合并的列索引值
			for (var k = 0; k < columsName.length; k++){//这里循环所有要合并的列
				var trArr = $(".layui-table-body>.layui-table").find("tr");//所有行
				for (var i = 1; i < res.data.length; i++) { //这里循环表格当前的数据
					var tdCurArr = trArr.eq(i).find("td").eq(columsIndex[k]);//获取当前行的当前列
					var tdPreArr = trArr.eq(mergeIndex).find("td").eq(
							columsIndex[k]);//获取相同列的第一列
					if (data[i][columsName[k]] === data[i - 1][columsName[k]]) { //后一行的值与前一行的值做比较，相同就需要合并
						mark += 1;
						tdPreArr.each(function() {//相同列的第一列增加rowspan属性
							$(this).attr("rowspan", mark); 
							$(this).css({"background-color":"#DCDCDC","color":"#3192d3","cursor":"pointer","text-align":"center"}); 
							
						});
						tdCurArr.each(function() {//当前行隐藏
							$(this).css("display", "none");
						});
					} else {
						tdPreArr.each(function() {//相同列的第一列增加rowspan属性
							$(this).css({"background-color":"#DCDCDC","color":"#3192d3","cursor":"pointer","text-align":"center"}); 
						});
						mergeIndex = i;
						mark = 1;//一旦前后两行的值不一样了，那么需要合并的格子数mark就需要重新计算
					}
				}
			}
		}  
</script>
</body>
</html>