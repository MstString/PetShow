<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.kzw.petshow.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User currUser = (User)session.getAttribute("User");
%>
<!DOCTYPE html>
<html lang="en-us">	
	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>pages/system/">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
		
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
		
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/your_style.css">
	</head>

<body>

<div class="container">
	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div>
				<div class="widget-body">
					<form class="form-horizontal">
						<input type="hidden" name="id" value="${editor.id}">
	                    <table class="bs-table">	                     	
	                     	<tr>
	                     		<td width="80">账号：</td>
	                     		<td><input class="form-control" name ="uname" type="text" value="${editor.editorname}"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td width="80">密码：</td>
	                     		<td><input class="form-control" name ="passwd" type="password" value="${editor.password}"/></td>
	                     	</tr>	    	                     	
	                     	<tr>
	                     		<td width="80">姓名：</td>
	                     		<td><input class="form-control" name ="realName" type="text" value="${editor.realName}"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td width="80">性别：</td>
	                     		<td>
	                     			<k:dictSelect name="sex.id" itemName="性别" className="text" value="${editor.sex.id}"/>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td width="80">角色：</td>
	                     		<td>
	                     			<input name="roleName" id="roleName" readonly="readonly" class="form-control" value="${editor.roleName}"/>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td width="70">选择照片</td>
	                     		<td colspan="2"> 
	                     			<input class="form-control" type="hidden" id="head_portrait_path" style="width:78%;display:inline;float:left;" name ="head_portrait_path" type="text" value="${editor.head_portrait_path}"/>
	                     			<img id="imgS" width="100" src="${editor.head_portrait_path}" style="width:120px;"/>
	                     			<a href="javascript:selectFileAttach()" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> 选择</a>
	                     		</td>
	                     	</tr>
	                     </table>
					</form>
	
				</div>
			</div>
	
		</article>
		<!-- WIDGET END -->
		
	</div>
	<!-- end row -->
</div>
	<script src="../../js/libs/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		// 选择附件
		function selectFileAttach() {
			top.layer.open({
				type: 2,
				title: '文件选择器',
				content: '<%=path%>/pages/selector/fileAttach_selector_pic.jsp',
				area: ['800px', '600px'],
				maxmin: true,
				btn: ['确定', '取消'],
				yes: function(index, layero) {
					// 获得值
					var arr = layero.find('iframe')[0].contentWindow.getUrl();
					if(arr.length == 0) {
						top.layer.msg('请选择一张图片');
						return;
					}
					$('#head_portrait_path').val(arr[0]);
					$('#imgS').attr('src', arr[0]);
					top.layer.close(index);
				}
			});	
		}
	</script>
	</body>

</html>
