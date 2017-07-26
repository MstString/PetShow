<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <base href="<%=basePath%>">
  <title>宠物秀</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="i/favicon.png">
  <link rel="stylesheet" href="css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>宠物秀</h1>
    <p>PetShow Development Environment<br/>宠物交流，一个萌萌哒的宠物网站</p>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3>登录</h3>
    <hr>
   	<div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">普通用户</a></li>
        <li><a href="#tab2">小小编辑</a></li>
        <li><a href="#tab3">管理员</a></li>
      </ul>

      <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
          <form action="<%=path%>/user/login" method="post" class="am-form">
            <label for="username">用户名:</label>
            <input type="text" name="username" autocomplete="off" id="email" value="">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="password" autocomplete="off" id="password" value="">
            <br>
            <div class="am-cf">
              <input type="submit" name="" value="登 陆" class="am-btn am-btn-primary am-btn-sm am-fr">
            </div>
          </form>
      </div>

        <div class="am-tab-panel am-fade" id="tab2">
          <form action="<%=path%>/editor/login" method="post" class="am-form">
            <label for="editorname">用户名:</label>
            <input type="text" name="editorname" autocomplete="off" id="email" value="">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="password" autocomplete="off" id="password" value="">
            <br>
            <div class="am-cf">
              <input type="submit" name="" value="登 陆" class="am-btn am-btn-primary am-btn-sm am-fr">
            </div>
          </form>
        </div>

        <div class="am-tab-panel am-fade" id="tab3">
          <form action="<%=path%>/admin/login" method="post" class="am-form">
            <label for="adminname">用户名:</label>
            <input type="text" name="adminname" autocomplete="off" id="email" value="">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="password" autocomplete="off" id="password" value="">
            <br>
            <div class="am-cf">
              <input type="submit" name="" value="登 陆" class="am-btn am-btn-primary am-btn-sm am-fr">
            </div>
          </form>
        </div>

      </div>
    </div>
    <hr>
    <p>© PetShow.</p>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>
