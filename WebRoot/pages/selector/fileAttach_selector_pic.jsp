<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en-us">	
	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>pages/selector/">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
		
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/jqgrid/ui.jqgrid-bootstrap.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/style_pic.css">
		<style>
		.layout {
			height: 500px;
			padding-top: 10px;
		}
		.show-pic {
			width: 100%;
			height: 86%;
			position:absolute; 
			overflow:auto;
		}
		.ui-layout-center {
			height: 600px;
			overflow:auto;
		}
		</style>
	</head>
<body>
<script src="../../js/libs/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../../js/plugin/jquery-layout/jquery.layout-latest.js"></script>
<!-- widget grid -->
<section id="fileAttach-widget" class="container">
	<!-- row -->
	<div class="layout row">
		<div class="ui-layout-west">
			<div class="text-left" style="margin-bottom: 5px;">
				<a class="btn btn-primary btn-sm doRefresh"><span class="glyphicon glyphicon-arrow-up"></span>上传文件</a>
			</div>
			<table id="tree-fileAttach-grid"></table>
		</div>
				
		
		<!-- NEW WIDGET START -->
		<div class="ui-layout-center">
			<div class="clearfix">
				<!--  <button class="select">&nbsp;</button>-->
			  	<button class="send" data-counter="0">✔</button>
			</div>
			<div class="show-pic">
				<ul></ul>
			</div>
		</div>
		<!-- WIDGET END -->
		
	</div>

	<!-- end row -->

</section>
<!-- end widget grid -->

<script src="../../js/libs/jquery-2.1.1.min.js"></script>
<script src="../../js/bootstrap/bootstrap.min.js"></script>
<script src="../../js/plugin/jqgrid/jquery.jqGrid.min.js"></script>
<script src="../../js/plugin/jqgrid/grid.locale-cn.js"></script>
<script src="../../js/KeExt.js"></script>

<script type="text/javascript" src="../../js/plugin/layer/layer.js"></script>
<script type="text/javascript" src="../../js/plugin/jquery-layout/jquery.layout-latest.js"></script>
<script type="text/javascript">
	 
	/* DO NOT REMOVE : GLOBAL FUNCTIONS!
	 *
	 * pageSetUp(); WILL CALL THE FOLLOWING FUNCTIONS
	 *
	 * // activate tooltips
	 * $("[rel=tooltip]").tooltip();
	 *
	 * // activate popovers
	 * $("[rel=popover]").popover();
	 *
	 * // activate popovers with hover states
	 * $("[rel=popover-hover]").popover({ trigger: "hover" });
	 *
	 * // activate inline charts
	 * runAllCharts();
	 *
	 * // setup widgets
	 * setup_widgets_desktop();
	 *
	 * // run form elements
	 * runAllForms();
	 *
	 ********************************
	 *
	 * pageSetUp() is needed whenever you load a page.
	 * It initializes and checks for all basic elements of the page
	 * and makes rendering easier.
	 *
	 */

	// pageSetUp();
	
	/*
	 * ALL PAGE RELATED SCRIPTS CAN GO BELOW HERE
	 * eg alert("my home function");
	 * 
	 * var pagefunction = function() {
	 *   ...
	 * }
	 * loadScript("js/plugin/_PLUGIN_NAME_.js", pagefunction);
	 * 
	 */

	 
	$(function() {
	
		// 查询出数据
		showPic();
		
		// 查询
		var widget = $('#fileAttach-widget');
		// 上传文件
		widget.find('.doRefresh').click(function() {
			layer.params = {
					fileTypeId: 1,	//左侧树选择的值
					fileCat: 'test/pic',
					//grid: grid
				};
			layer.open({
					type: 2,
					title: '<span class="glyphicon glyphicon-arrow-up"></span> 文件上传',
					area: ['600px', '360px'],
				    content: '../petshow/fileAttach_form.jsp',
				    btn: ['关闭'],
				    btn1: function() {
						location.reload()
						//刷新
				    	//treeGrid.trigger('reloadGrid');
				    },

				    success: function(layero, index) {
				    	// TODO: 刷新一次, 仍没有完全解决问题
				    	var iframeWin = layero.find('iframe')[0].contentWindow;
				    	var url = iframeWin.location.href;
						var times = url.split("?");
						if(times[1] != 1){
							url += "?1";
							iframeWin.location.replace(url);
						}
				    }
				});		
		});		
		
		// item selection
		$(document).on('click', 'li', function() {
			//移除其他选择
			$('li').each(function() {
				$(this).removeClass('selected');
			});
			$(this).toggleClass('selected');
			/*全部选择按钮
		  	if ($('li.selected').length == 0)
		    	$('.select').removeClass('selected');
		  	else
		    	$('.select').addClass('selected');
			*/
		  	counter();
		});
	
		// all item selection
		$(document).on('click', '.select', function() {
		  	if ($('li.selected').length == 0) {
		    	$('li').addClass('selected');
		    	$('.select').addClass('selected');
		  	}
		  	else {
		    	$('li').removeClass('selected');
		    	$('.select').removeClass('selected');
		  	}
		  	counter();
		});
		// number of selected items
		function counter() {
		  	if ($('li.selected').length > 0)
		    	$('.send').addClass('selected');
		  	else
		    	$('.send').removeClass('selected');
		  	$('.send').attr('data-counter',$('li.selected').length);
		}
	
		// end jquery
	});
	
	// 展示图片效果
	function showPic(id) {
		$.getJSON('<%=path%>/fileAttach/getPicByType', function(arr) {
			for(var i=0; i<arr.length; i++) {
				$('<li id='+arr[i].fileId+'><img src="<%=path%>/attachFiles'+arr[i].filePath+'"><cite>'+arr[i].fileName+'</cite></li>').appendTo($('ul'));
			}
		})
	}
	
	function getUrl(){
		var arr = [];
		$('.show-pic li.selected img').each(function() {
			arr.push($(this).attr('src'));
		});
		return arr;
	}
	
</script>
