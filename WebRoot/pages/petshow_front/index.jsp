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
    <base href="<%=basePath%>">
    <title>宠物秀</title>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/petshow.css?6">
    <link rel="stylesheet" href="css/animate.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/amazeui.min.js"></script>
    <script src="js/countUp.min.js"></script>
    <script src="js/amazeui.lazyload.min.js"></script>


</head>
<body>
<header class="am-topbar am-topbar-inverse">
    <div class="amz-container">
        <h1 class="am-topbar-brand">
            <a href="javascript:void(0);" class="am-topbar-logo">
                <img src="img/logo.png?1" alt="">
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
<div class="get">
    <div class="am-g">
        <div class="am-u-lg-12">
            <div class="get-title">
                <div class="get_font_left"><img src="img/font_yjy.png" alt=""></div>
                <div class="get_font_center" id="banner_num"></div>
                <div class="get_font_rigth"><img src="img/font_zty.png" alt=""></div>
            </div>

            <div class="font_line"><img src="img/font_line.png" alt=""></div>
        </div>
    </div>
</div>
<div class="banner_navbg">
    <div class="am-g">
        <div class="banner_nav"><span class="am-icon-caret-right">  筛选：</span><a href="###">人气最高</a><a href="###"
                                                                                                       class="banner_hover">编辑推荐</a><a
                href="###">最新萌宠</a><a href="###">语言涂鸦</a></div>
    </div>
</div>

<div class="am-g am-imglist">
    <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  am-avg-md-3 am-avg-lg-6 am-gallery-default">
 			<c:forEach var="pet" items="${list}">
        <li>
            <div class="am-gallery-item am_list_block">
                <a href="javascript:void(0)" class="am_img_bg">
                    <img class="am_img animated" src="img/loading.gif"
                         data-original="${pet.pet_picture_path}"
                         alt="远方 有一个地方 那里种有我们的梦想"/>
                </a>

                <div class="am_listimg_info">
                <span class="am_imglist_time">${pet.petname}</span></div>

            </div>
            <c:forEach var="user" items="${list}">
            <c:if test="${user.id==pet.user.id}">
            <a class="am_imglist_user"><span class="am_imglist_user_ico"><img src="${pet.user.head_portrait_path}" alt=""></span><span
             class="am_imglist_user_font">${pet.user.username}</span></a>
             </c:if>
            </c:forEach>
        </li>
             </c:forEach>
    </ul>
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
                <dt><img src="img/footdon.png?1" alt=""></dt>
                <dd>一起Show我们的爱宠吧！宠物秀是图片配文字、涂鸦、COSPLAY的移动手机社区，这里有猫狗鱼龟兔子仓鼠龙猫等各种萌图。
                    <a href="###" class="footdon_pg ">
                        <div class="foot_d_pg am-icon-apple "> App store</div>
                    </a><a href="###" class="footdon_az animated">
                        <div class="foot_d_az am-icon-android "> Android</div>
                    </a></dd>

            </dl>
        </div>

        <div class="am_footer_erweima">
            <div class="am_footer_weixin"><img src="img/wx.jpg" alt="">

                <div class="am_footer_d_gzwx am-icon-weixin"> 关注微信</div>
            </div>
            <div class="am_footer_ddon"><img src="img/wx.jpg" alt="">

                <div class="am_footer_d_dxz am-icon-cloud-download"> 扫码下载</div>
            </div>

        </div>

    </div>
    <div class="am_info_line">Copyright(c)2015 <span>PetShow</span> All Rights Reserved</div>
</footer>
<script src="js/petshow.js"></script>
</body>
</html>