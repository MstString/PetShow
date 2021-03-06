<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>pages/petshow_front/">
    <title>宠物医院</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../../css/amazeui.min.css">
    <link rel="stylesheet" href="../../css/petshow.css?6">
    <link rel="stylesheet" href="../../css/animate.min.css">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/amazeui.min.js"></script>
    <script src="../../js/amazeui.lazyload.min.js"></script>

</head>
<body>
	<header class="am-topbar am-topbar-inverse">
    <div class="amz-container">
        <h1 class="am-topbar-brand">
            <a href="#" class="am-topbar-logo">
                <img src="../../img/logo.png?1" alt="">
            </a>
        </h1>
        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
                data-am-collapse="{target: '#doc-topbar-collapse-5'}">
            <span class="am-sr-only">
                导航切换
            </span>
            <span class="am-icon-bars">
            </span>
        </button>
        <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse-5">
            <ul class="am-nav am-nav-pills am-topbar-nav">
                <li>
                    <a href="<%=basePath%>user_pet/listAll">
                        发现萌宠
                    </a>
                </li>
                <li>
                    <a href="<%=basePath%>essay/listAll">
                        萌宠趣闻
                    </a>
                </li>
                   <li class="am-dropdown" data-am-dropdown="">
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle="" href="javascript:;">
                        萌宠服务
                        <span class="am-icon-caret-down">
                        </span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li class="am-active">
                            <a href="<%=basePath%>pet_hospital/listAll">
                                宠物医院
                            </a>
                        </li>
                        <li>
                            <a href="<%=basePath%>pet_shop/listAll">
                                宠物商店
                            </a>
                        </li>
                        <li>
                            <a href="<%=basePath%>pet_beauty/listAll">
                                宠物美容院
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%=basePath%>user_main.jsp">
                        用户中心
                    </a>
                </li>
            </ul>
        </div>
    </div>
</header>

	
	<div class="am-g ztlb_nr">
		<div class="am-u-sm-12">
			<c:forEach var="pet_hospital" items="${list}">
			<div class="ztlb_nr_blockc">
				<div class="ztlb_nr_blockc_l">
					<img src="${pet_hospital.hospital_picture_path}" alt="">
				</div>
				<div class="ztlb_nr_blockc_r">
					<div class="ztlb_nr_blockc_r_info"></div>
					<a class="ztlb_nr_blockc_r_title">宠物医院名称：${pet_hospital.hospital_name}</a>
					<span class="ztlb_nr_blockc_r_nr">地址：${pet_hospital.address}</span>
					<span class="ztlb_nr_blockc_r_nr">电话 ：${pet_hospital.phonenum}</span>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	

	<footer class="am_footer">
<div class="am_footer_con">
<div class="am_footer_link">
<span>关于宠物秀</span>
<ul>
  <li><a href="###">关于我们</a></li>
  <li><a href="###">发展历程</a></li>
  <li><a href="###">友情链接</a></li>
</ul>
</div>


<div class="am_footer_don">
<span>宠物秀</span>
<dl>
  <dt><img src="../../img/footdon.png?1" alt=""></dt>
  <dd>一起Show我们的爱宠吧！宠物秀是图片配文字、涂鸦、COSPLAY的移动手机社区，这里有猫狗鱼龟兔子仓鼠龙猫等各种萌图。
  <a href="###" class="footdon_pg "><div class="foot_d_pg am-icon-apple ">  App store</div></a><a href="###" class="footdon_az animated"><div class="foot_d_az am-icon-android ">  Android</div></a></dd>

</dl>
</div>

<div class="am_footer_erweima">
<div class="am_footer_weixin"><img src="../../img/wx.jpg" alt=""><div class="am_footer_d_gzwx am-icon-weixin"> 关注微信</div></div>
<div class="am_footer_ddon"><img src="../../img/wx.jpg" alt=""><div class="am_footer_d_dxz am-icon-cloud-download"> 扫码下载</div></div>

</div>

</div>
<div class="am_info_line">Copyright(c)2015 <span>PetShow</span> All Rights Reserved </div>
</footer>
<script>
 $(function(){
  auto_window_height();
  ZhuanTi_list_user()
$(window).resize(function() {
  auto_window_height();
  ZhuanTi_list_user()
});
function ZhuanTi_list_user(){
if($(window).width() < 810)
$('.ztlb_nr_blockc_r_user').each(function(){$(this).children().each(function(index){if(index>3){$(this).hide()}else{$(this).show()}})});
 }
  function auto_window_height(){
  $('.ztlb_nr').css('min-height',$(window).height() - 52 - 220);
  }
});

</script>
</body>
</html>