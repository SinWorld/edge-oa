<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>货物产品列表</title>
<link rel="stylesheet" href="../layui-v2.4.5/layui/css/layui.css">
<link rel="stylesheet" href="../login/css/static.css">
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page isELIgnored="false"%>
</head>
<body onload="refreshAndClose()">
<form class="layui-form" action="<c:url value='/xmssck/ck.do'/>" method="post" id="myForm">
	<input type="hidden" value='<c:url value="/"/>' id="url">
	<input type="hidden" id="hwnrData" name="hwnrData">
	<input type="hidden" id="flag" value="${flag}"> 
	<div class="layui-form-item layui-form-text">
	  <label class="layui-form-label" style="width: 135px;">货物(产品)内容</label>
	  <div class="layui-input-block">
		<table class="table table-bordered" id="hwcpnrs" style="width: 100%">
		  <thead>
		    <tr>
		      <th scope="col" style="text-align: center;width: 3%">
		     		  <div class="layui-form-item" style="margin-top: 20px;">
						    <div class="layui-input-block">
						      <input type="checkbox" lay-skin="primary" id="dx" lay-filter="dx">
						    </div>
					  </div>
		      </th>
		      <th scope="col" style="text-align: center;width: 4%">序号</th>
		      <th scope="col" style="text-align: center;width: 22%">产品名称</th>
		      <th scope="col" style="text-align: center;width: 15%">品牌</th>
		      <th scope="col" style="text-align: center;width: 14%">规格型号</th>
		      <th scope="col" style="text-align: center;width: 12%">主要配置参数</th>
		      <th scope="col" style="text-align: center;width: 6%">单位</th>
		      <th scope="col" style="text-align: center;width: 8%">数量</th>
		      <th scope="col" style="text-align: center;width: 8%">单价</th>
		      <th scope="col" style="text-align: center;width: 8%">金额</th>
		    </tr>
		    <c:forEach items="${list}" var="l">
		    	<tr>
		    		<td style='text-align: center;'>
						  <div class="layui-form-item" style="margin-top: 20px;">
						    <div class="layui-input-block">
						      <input type="checkbox"  lay-skin="primary" name="qx" lay-filter="qx">
						    </div>
						  </div>
					</td> 
		    		<th scope='row' style='text-align: center;line-height:75px;'></th>
		    		<td><input type='text' class='form-control' aria-label='' aria-describedby='' name='cpmc' value="${l.chanPinMC }" disabled="disabled" style="margin-top: 20px;" title="${l.chanPinMC }"></td>
		    		<td><input type='text' class='form-control' aria-label='' aria-describedby='' value="${l.pinPai }" name="pp" style="margin-top: 20px;" disabled="disabled" title="${l.pinPai }"></td>
		    		<td><input type='text' class='form-control' aria-label='' aria-describedby='' value="${l.guiGeXH }" name="ggxh" style="margin-top: 20px;" disabled="disabled" title="${l.guiGeXH }"></td>
		    		<td><input type='text' class='form-control' aria-label='' aria-describedby='' value="${l.zhuYaoPZCS }" name="zypzcs" style="margin-top: 20px;" disabled="disabled" title="${l.zhuYaoPZCS }"></td>
		    		<td><input type='text' class='form-control' aria-label='' aria-describedby='' value="${l.danWei }" name="dw" style="margin-top: 20px;" disabled="disabled" title="${l.danWei }"></td>
		    		<td>
		    			<input type='text' class='form-control' aria-label='' aria-describedby='' value="${l.oldShuLiang }" name="oldsl" style="margin-top: 20px;" onchange="slyz(this)">
		    			<input type="hidden" value="${l.xmrkorCkId}" name="xmrkorCkId">
		    		</td>
		    		<td><input type='text' class='form-control' aria-label='' aria-describedby='' value="${l.price }" title="${l.price }" name="dj"  style="margin-top: 20px;" disabled="disabled"></td>
		    		<td><input type='text' class='form-control' aria-label='' aria-describedby='' value="${l.jinE }" title="${l.jinE }" name="je"  style="margin-top: 20px;" disabled="disabled"></td>
		    	</tr>
		    </c:forEach>
		  </thead>
		  <tbody>
		  </tbody>
		</table>
		</div>
	</div>
	<div class="layui-form-item" style="text-align: center;">
	    <div class="layui-input-block">
	      <button class="layui-btn" type="button" id="tj" style="width:35%;margin-top:10px;">确认出库</button>
	    </div>
	</div>
</form>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script src="../layui-v2.4.5/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form','layedit', 'laydate'], function(){
  var url=$('#url').val();
  var form= layui.form;
  var layer = layui.layer;
  var layedit = layui.layedit;
  var hwdms=$('#hwdms').val();
  hwnrsh();
  
  form.on('checkbox(dx)', function (data) {
      var a = data.elem.checked;
      if (a == true) {
          $('input[name="qx"]').prop("checked", true);
          form.render('checkbox');
      } else {
    	  $('input[name="qx"]').prop("checked", false);
          form.render('checkbox');
      }
  });

});

	function hwnrsh(){
		var len = $('table tr').length;
	    for(var i = 1;i<len;i++){
	        $('table tr:eq('+i+') th:first').text(i);
	    }
	     
	}

	function jsje(obj){
		 var i = obj.parentNode.parentNode.rowIndex;//获得当前行索引
		 //获得填写数量的值
		 var oldsl=$('input[name="oldsl"]')[i-1].value;
		 //获得单价值
		 var dj=$('input[name="dj"]')[i-1].value*1;
		 var zje=(oldsl*1)*(dj*1);
		 var money=zje.toFixed(2);
		 $('input[name="je"]')[i-1].value=money;
		 $('input[name="je"]').eq(i-1).attr('title',money);
	}

	function slyz(obj){
		 var i = obj.parentNode.parentNode.rowIndex;//获得当前行索引
		 //获得采购数量的值
		 var oldsl=$('input[name="oldsl"]')[i-1].value;
		 //不允许输入小于等于0
		 if(oldsl<=0){
			 $('input[name="oldsl"]')[i-1].value="";
			 return layer.alert("出库数量不允许小于或等于0",{icon: 0});
		 }
		 //获得所属的项目采购入库主键值
		 var xmrkorCkId=$('input[name="xmrkorCkId"]')[i-1].value;
		 //获得单价值
		 var dj=$('input[name="dj"]')[i-1].value*1;
		 //获得总金额的值
		 var je=$('input[name="je"]')[i-1].value*1;
		 //计算数量
		 var sl=je/dj;
		 if(oldsl>sl){
			 $('input[name="oldsl"]')[i-1].value="";
			 return layer.alert("出库数量不允许大于入库库存量:"+sl+"",{icon: 0});
		 }else{
				//计算金额
				var je=(oldsl*1)*(dj);
				var money=je.toFixed(2);
				$('input[name="je"]')[i-1].value=money;
				$('input[name="je"]').eq(i-1).attr('title',money);
			}
	}
	

	//提交编辑后的货物产品内容
	function editHWCPNRS(){
		var hwnrData=$('#hwnrData').val();
		//货物当前表格
		var tables=$('#hwcpnrs');
		//获得表格所有行
		var rows=tables[0].rows;
		var kg=false;
		//遍历表格
		for(var i=1;i<rows.length;i++){
			//获得复选框表格前的复选框
			var checboxs=$('input[name="qx"]')[i-1].checked;
			if(checboxs==true){
				//获得表格数据中的已存在的项目入库数据主键
				xmrkId=$('input[name="xmrkorCkId"]')[i-1].value;
				//产品名称
				var cpmc=$('input[name="cpmc"]')[i-1].value;
				//品牌
				var pp=$('input[name="pp"]')[i-1].value;
				//规格型号
				var ggxh=$('input[name="ggxh"]')[i-1].value;
				//主要配置参数
				var zypzcs=$('input[name="zypzcs"]')[i-1].value;
				//单位
				var dw=$('input[name="dw"]')[i-1].value;
				//出库数量
				var cgsl=$('input[name="oldsl"]')[i-1].value;
				//单价
				var dj=$('input[name="dj"]')[i-1].value;
				//金额
				var je=$('input[name="je"]')[i-1].value;
				 if(cgsl==""){
					return layer.alert("请填写入库数量");
				}
				var str="{"+"xmrkId"+":"+xmrkId+","+"cpmc"+":"+cpmc+","+"pp"+":"+pp+","+"ggxh"+":"+ggxh+","+"zypzcs"+":"+zypzcs+","+"dw"+":"+dw+","+"cgsl"+":"+cgsl+","+"dj"+":"+dj+","+"je"+":"+je+"}";
				//拼接字符串
				if(undefined!=hwnrData){
					hwnrData=hwnrData+"&"+str;
					 $('#hwnrData').val(hwnrData);
				 }else{
					 hwnrData=str;
					 $('#hwnrData').val(hwnrData);
				 }
				kg=true;
		   }
		}
		return kg;
	}

	function refreshAndClose(){
		var flag=$('#flag').val();
		if(flag){
			window.parent.location.reload();
			window.close();
		} 
	}

	//提交表单
	$('#tj').click(function(){
		var flag=editHWCPNRS();
		if(flag==false){
			return layer.alert('请勾选需要出库的采购货物',{icon: 0});
		}
		var form=document.getElementById('myForm');
		form.submit();
	});
</script>
</body>
</html>