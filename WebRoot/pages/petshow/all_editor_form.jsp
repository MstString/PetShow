<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en-us">	
	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>pages/petshow/">
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
	                     		<td width="80">用户名：</td>
	                     		<td><input class="form-control" name ="editorname" type="text" value="${editor.editorname}"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td width="80">密码：</td>
	                     		<td><input class="form-control" name ="password" type="password" value="${editor.password}"/></td>
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
	                     		<td>
	                     			<input name="roleId" id="editor.roleId" type="hidden" class="form-control" value="2"/>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>
	                     			<input name="roleName" id="editor.roleName" type="hidden" class="form-control" value="编辑"/>
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
	</body>

</html>
