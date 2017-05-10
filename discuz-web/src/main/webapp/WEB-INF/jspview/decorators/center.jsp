<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title>贵州移动培训系统</title>
    <meta name="description" content="贵州移动培训系统" />
    <meta name="keywords" content="贵州移动培训系统">

    <meta name="HandheldFriendly" content="True" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="/favicon.ico">
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/screen.css?v=7dddbe75bf" />
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_oj3a1u59acoqd7vi.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css?v=7dddbe75bf" />
  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/user.css?v=7dddbe75bf" />
  
    <link rel="canonical" href="" />
    <meta name="referrer" content="origin" />
    <meta name="generator" content="贵州移动 0.7" />
    <style type="text/css">
    .error{
    color: red;
    background-color: red !important;
    }
    </style>
   <decorator:head />
</head>
 <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<body >

    <!-- start header -->
    <header class="main-header"  style="background-image: url(http://static.ghostchina.com/image/6/d1/fcb3879e14429d75833a461572e64.jpg)"">
       
        <div class="container">
            <div class=" pull-right">
        	<c:if test="${sessionScope.user!=null }">
        		<div class="aw-user-nav">
						<a href="${pageContext.request.contextPath}/center" class="login ghost btn btn-normal btn-primary aw-user-nav-dropdown">
							您好：${user.chinesename }
						</a>
						
						<div class="aw-dropdown dropdown-list pull-right">
							<ul class="aw-dropdown-list">
								<li class="hidden-xs"><a href="${pageContext.request.contextPath}/center"><i class="icon icon-setting"></i>个人中心</a></li>
									<li class="hidden-xs"><a href="${pageContext.request.contextPath}/password"><i class="icon "></i>密码重置</a></li>
									
								<li><a href="${pageContext.request.contextPath}/loginout"><i class="icon icon-logout"></i> 退出</a></li>
							</ul>
						</div>
			</div>
        	</c:if>
        	<c:if test="${sessionScope.user==null }">
        		<span>
					<a class="login btn  ghost  btn-normal btn-primary" href="${pageContext.request.contextPath}/login">登录</a>
				</span>
        	</c:if>
        	</div>
           
            <div class="row">
                <div class="col-sm-12">
                    <h2 class="text-hide">快来参加培训考试吧。</h2>
                    <img src="" alt="" class="hide">
                </div>
            </div>
        </div>
    </header>
    <!-- end header -->

    <!-- start navigation -->
    <nav class="main-navigation">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="navbar-header">
                        <span class="nav-toggle-button collapsed" data-toggle="collapse" data-target="#main-menu">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-bars"></i>
                        </span>
                    </div>
                    <div class="collapse navbar-collapse" id="main-menu">
                        <ul class="menu">
				          <li class="" role="presentation"><a href="${pageContext.request.contextPath}/bbs">首页</a></li>
				        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/login">登录</a></li>
				        <li class="" role="presentation"><a href="${pageContext.request.contextPath}/register">注册</a></li>
				          <li  role="presentation"><a href="/center">个人中心</a></li>
						</ul>   
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <!-- end navigation -->

  <c:if test="${response!=null }">
    	<div class="container text-center">
					<div class=" alert-success" role="alert" style="padding: 10px">
		      				<strong>提示，${response.msg }</strong> 
		   			 </div>
		</div>
    </c:if>
		
    <!-- start site's main content area -->
    <section class="aw-container-wrap" style="margin-top: 0px">
       	 <div class="container">
					<decorator:body />
            </div>
    </section>

   <%@include file="./footer.jsp" %>


    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <span>Copyright &copy; <a href="http://www.ghostchina.com/">贵州移动培训</a></span> | 
                    <span><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备11008151号</a></span> | 
                    <span>京公网安备11010802014853</span>
                </div>
            </div>
        </div>
    </div>

    <a href="#" id="back-to-top"><i class="fa fa-angle-up"></i></a>
</body>
</html>
