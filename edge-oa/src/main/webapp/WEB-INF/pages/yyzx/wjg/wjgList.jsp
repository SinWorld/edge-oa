<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件柜</title>
<link rel="stylesheet" href="../layui-v2.5.4/layui/css/layui.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
</head>
<body>
<input type="hidden" value='<c:url value="/"/>' id="url">
<input type="hidden" id="wjgdm">
<input type="hidden" id="flag" value="false">
<div  style="width:100%;overflow:hidden">
	<div style="margin-top: 30px;width: 20%;float: left;">
		<span style="font-size: 20px;font-weight: 20px;">文件夹</span>
		<div id="test9" class="demo-tree demo-tree-box" style="width:100%;height:-webkit-fill-available;background:#eee;"></div>
	</div>
	<div style="width:80%;float:right;margin-top: 20px;">
			<span style="font-size: 20px;font-weight: 20px;">文件</span>
			<form class="layui-form" action="" style="margin-top: 10px;">
			 <div class="demoTable" style="background-color: #CAE1FF" id="gjssq">
				<div class="layui-form-item" style="width:1280px;height:auto;padding:0px; margin:0 auto;" id="main"">
				 <div class="layui-form-item">
					 <div class="layui-inline">
					      <label class="layui-form-label" style="width: 100px;">文件名</label>
					      <div class="layui-input-inline">
					        <input type="text" name="wenJianM" lay-verify="wenJianM"
							autocomplete="off" class="layui-input" style="width: 260px;" id="wenJianM">
					      </div>
				     </div>
				    <div class="layui-inline" style="width:380px;right: -33px;">
						  	<label class="layui-form-label">文件夹名称</label>
							<div class="layui-input-inline" style="text-align: left;width: 68%">
								<select name="wenJianJDM" id="wenJianJDM" lay-filter="wenJianJDM" lay-verify="wenJianJDM" lay-search="">
									<option value="" selected="selected">请选择所属文件夹</option>
								</select>
							</div>
					</div>
					<div class="layui-inline" style="width: 24.5%;left: -33px;">
					  	<label class="layui-form-label">上传人</label>
						<div class="layui-input-inline" style="text-align: left;">
							<select name="userDM" id="userDM" lay-filter="userDM" lay-verify="userDM">
								<option value="" selected="selected">请选择上传用户</option>
							</select>
						</div>
				 	</div>
			 	</div>
				
				<div class="layui-form-item">
				    <div class="layui-inline" style="left:29px;width: 501px;">
				      <label class="layui-form-label" style="width: 71px;">日期</label>
				      <div class="layui-input-inline">
				        <input type="text" name="time1" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
				       <i class="u-date_line" style="margin-left: -212px;line-height: 35px;">—</i>
				      <div class="layui-input-inline">
				        <input type="text" name="time2" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				      </div>
					</div>
					<button class="layui-btn" data-type="reload" type="button" id="do_search" style="margin-left:20px;margin-top: -5px;">搜索</button>
					<button type="reset" class="layui-btn layui-btn-primary" style="margin-left:17px;margin-top: -5px;">重置</button>
			 	</div>
			
			</div> 
			</div>
		</form>
			<table class="layui-hide" id="test" lay-filter="test" style="width: 100%"></table>
	</div>
</div>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="width:22%;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" type="button">上传</button>
 	<button class="layui-btn layui-btn-sm" lay-event="xz" type="button">下载</button>
	<button class="layui-btn layui-btn-sm" lay-event="gjss" type="button">高级搜索</button>
  </div>
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="../layui-v2.5.4/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jquery/jquery-3.3.1.js"></script>
<script>
layui.use(['tree', 'util','form','table','layedit','laydate'], function(){
  var tree = layui.tree
  ,layer = layui.layer
  ,util = layui.util;
  var form = layui.form;
  var table = layui.table;
  var url=$('#url').val();
  var layedit = layui.layedit;
  var laydate = layui.laydate;
  initOrgTree(form);
  allUser(form);
  $('#gjssq').hide();
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
	elem: '#date2'
  });
  initTree(layui,form,tree,table);
  table.render({
	     elem: '#test'
	    ,url:url+'wjg/wjgList.do'
	    ,toolbar: '#toolbarDemo'
	    ,cols: [[
	      {type:'checkbox'}
	      ,{field:'index', width:"8%", title: '序号', sort: true,type:'numbers'}
	      ,{field:'wenJianM', width:"40%", title: '文件名'}
	      ,{field:'title', width:"16%", align:'center', title: '文件夹名称'}
	      ,{field:'userName', width:"10%", align:'center', title: '上传人'}
	      ,{field:'beginTime', width:"17%", align:'center', title: '日期'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:"10%",align:'center'}
	    ]]
	    ,page: true
	    ,id:"idTest"
	  });
  
	//头工具栏事件
	  table.on('toolbar(test)', function(obj,res){
	    var url=$('#url').val();
	    var wjgdm=$('#wjgdm').val();
	    var flag=$('#flag').val();
	    if(obj.event=='getCheckData'){
	    	 layer.open({
	      	  	type:2,
	      	  	title:'上传附件',
	      	  	area: ['100%','100%'],
	      		shadeClose: false,
	      		resize:false,
	      	    anim: 1,
	      	  	content:[url+"wjg/initupload.do",'yes']
	    	 });
	    }else if(obj.event=='xz'){
	    	var checkStatus=table.checkStatus(obj.config.id);
	    	var data=checkStatus.data;//获取选中数据
	    		//遍历data数组
		    	for(var i=0;i<data.length;i++){
		    		//拼接文件柜代码值
		    		if(undefined!=wjgdm){
		    			wjgdm=wjgdm+","+data[i].wenJianGDM;
						 $('#wjgdm').val(wjgdm);
					 }else{
						 wjgdm=wjgdm;
						 $('#wjgdm').val(wjgdm);
					 }
		    	}
	    		if(data==''){
	    			layer.alert("请勾选需要下载的文件",{icon: 7});
	    			return;
	    		}else{
	    			//下载附件
	    			$.ajax({  
					    type: "post",  
					    url:  "<c:url value='/wjg/dowLoand.do'/>",
					    dataType: 'json',
					    async:false,
					    data:{"wjgdm":wjgdm},
					    error:function(){
					    	alert("出错");
					    },
					    success: function (data) {  
					    	layer.msg(data.info);
					    }  
					});
	    		}
	    }else if(obj.event=='gjss'){
	    	if(flag=='false'){
	    		$('#gjssq').fadeIn();
	    		$('#flag').val(true);
	    	}else{
	    		$('#gjssq').fadeOut();
	    		$('#flag').val(false);
	    	}
	    }
	  });
	
	  //监听行工具事件
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    var id=data.wenJianGDM;
	 
	    if(obj.event === 'del'){
	    	 layer.confirm('您确定要删除该文件吗？', {
				  btn: ['确定','取消'], //按钮
				  title:'提示'},function(index){
					//删除文件
					  $.ajax({  
						    type: "post",  
						    url:  "<c:url value='/wjg/deleteWjById.do'/>",
						    dataType: 'json',
						    async:false,
						    data:{"id":id},
						    error:function(){
						    	alert("出错");
						    },
						    success: function (data) {  
					    		layer.close(index);
					    		window.location.reload();
						    }  
						});
				  }
			  );
	    }
	  });
	  
	  // 执行搜索，表格重载
	  $('#do_search').on('click', function () {
	      // 搜索条件
	      var wenJianM = $('#wenJianM').val();//文件名
	      var wenJianJDM=$('#wenJianJDM').val();//所属文件夹
	      var userDM=$('#userDM').val();//上传用户
	      var date=$('#date').val();
	      var date2=$('#date2').val();
	      table.reload('idTest', {
	          method: 'post'
	          , where: {
	              'wenJianM': wenJianM,
	              'wenJianJDM':wenJianJDM,
	              'userDM':userDM,
	              'time1':date,
	              'time2':date2,
	          }
	          , page: {
	              curr: 1
	          }
	      });
	  });
	
});

function initTree(layui,form,tree,table){
	var layer = layui.layer;
	var url = $('#url').val();
	//初始化文件夹树
	  $.ajax({  
		    type: "post",  
		    url:  "<c:url value='/wjg/initWenJianJ.do'/>",
		    dataType: 'json',
		    async:false,
		    error:function(){
		    	alert("出错");
		    },
		    success: function (data) { 
		        //开启节点操作图标
		    	tree.render({  
		            elem: '#test9',  
		            data: data,
		            edit: ['add', 'update', 'del'], //操作节点的图标
		            onlyIconControl:true,
		        	click: function(obj){
		        		//获得点击文件夹的主键
		        		var wjjdm=obj.data.id;
		        		//执行表格重载
		        		  table.reload('idTest', {
					          method: 'post'
					          , where: {
					              'wjjdm': wjjdm,
					          }
					          , page: {
					              curr: 1
					          }
					      }); 
		            //layer.msg(JSON.stringify(obj.data));
		          },
		          operate: function(obj){
		        	    var type = obj.type; //得到操作类型：add、edit、del
		        	    var data = obj.data; //得到当前节点的数据
		        	    var elem = obj.elem; //得到当前节点元素
		        	    //Ajax 操作
		        	    var id = data.id; //得到节点索引
		        	    if(type === 'add'){ //增加节点
		        	    	layer.open({
		    					type : 2,
		    					title : '文件夹新增',
		    					area : [ '50%', '60%' ],
		    					shadeClose : false,
		    					resize : false,
		    					anim : 1,
		    					content : [ url + "wjg/initSaveWjj.do?id="+id, 'yes' ]
		    				});
		        	   
		        	    } else if(type === 'update'){ //修改节点
		        	    	layer.open({
		    					type : 2,
		    					title : '文件夹修改',
		    					area : [ '50%', '60%' ],
		    					shadeClose : false,
		    					resize : false,
		    					anim : 1,
		    					content : [ url + "wjg/initEditWJg.do?id="+id, 'yes' ]
		    				});
		        	    } else if(type === 'del'){ //删除节点
		        	    	layer.confirm('您确定要删除该文件夹吗？', {
		        				  btn: ['确定','取消'], //按钮
		        				  title:'提示'},function(index){
				        	    	 $.ajax({  
				        	 		    type: "post",  
				        	 		    url:  "<c:url value='/wjg/deleteWJJ.do'/>",
				        	 		    data:{"id":id},
				        	 		    dataType: 'json',
				        	 		    async:false,
				        	 		    error:function(){
				        	 		    	alert("出错");
				        	 		    },
				        	 		    success: function (data) {
				        	 		    	layer.close(index);
				        	 		   		layer.msg(data.flag);
				        	 		    }  
				        	 		});
		        				  }
		        	    	 );
		        	   	};
		        	  }
		        });  
		    }  
		});
}

//ajax实现文件夹树初始化
function initOrgTree(form) {
	$.ajax({
		type : "post",
		url : "<c:url value='/wjg/orgWJJTree.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				for(var j=0;j<msg[i].length;j++){
					$("#wenJianJDM").append(
					    "<option value='"+msg[i][j].id+"'>"+ msg[i][j].title +"</option>"); 
				}
			}
			form.render('select');
		}
	});
}

//ajax实现查询所有的上传人
function  allUser(form){
	$.ajax({
		type : "post",
		url : "<c:url value='/approveproj/allUser.do'/>",
		async : false,
		dataType : 'json',
		error : function() {
			alert("出错");
		},
		success : function(msg) {
			for (var i = 0; i < msg.length; i++) {
				$("#userDM").append(
						"<option value='"+msg[i].user_id+"'>"+ msg[i].user_name +"</option>");
			}
			form.render('select');
		}
	});
}
</script>
</body>
</html>