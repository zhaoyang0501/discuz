<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="贵州移动培训系统" />
<meta name="keywords" content="贵州移动培训系统">
<meta name="HandheldFriendly" content="True" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="/favicon.ico">
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css?v=7dddbe75bf" />
<link href="${pageContext.request.contextPath}/assets/css/login.css?v=7dddbe75bf" rel="stylesheet" type="text/css" />

<!--[if lte IE 8]>
	<script type="text/javascript" src="http://wenda.ghostchina.com/static/js/respond.js"></script>
<![endif]-->
</head>
<noscript unselectable="on" id="noscript">
	<div class="aw-404 aw-404-wrap container">
		<p>你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!</p>
	</div>
</noscript>

<div id="wrapper">
	<div class="aw-login-box">
		<div class="mod-body clearfix">
			<div class="content pull-left" style="width: 340px">
				<h2>欢迎登陆论坛系统</h2>
				<form id="login_form" method="post"
					action="${pageContext.request.contextPath}/login">
					<input type="hidden" name="return_url" value="" />
					<ul>
						<li>
							<input type="text" id="aw-login-user-name"class="form-control" placeholder="工号 / 手机号码" name="username" />
						</li>
						
						<li>
							<input type="password" id="aw-login-user-password" 	class="form-control" placeholder="密码" name="password" />
						</li>
						
						<c:if test="${tip!=null }">
							<li class="alert alert-danger  error_message"
									style="display: list-item;"><i class="icon icon-delete"></i>
									<em>${tip }</em>
							</li>
						</c:if>

						<li class="last">
							<button type="submit"
								class="pull-right btn btn-large btn-primary">登录</button> <label>
								<input type="checkbox" value="1" name="net_auto_login" /> 记住我
						</label> <a href="">&nbsp;&nbsp;忘记密码</a>
						</li>
					</ul>
				</form>
			</div>

		</div>
		<div class="mod-footer">
			<span>使用您的工号或者139邮箱登录</span>&nbsp;&nbsp;

		</div>
	</div>
</div>
<div class="aw-footer-wrap">
	<div class="aw-footer">
		Copyright © 2016<span class="hidden-xs"> - 京ICP备xxx号, All
			Rights Reserved</span> <span class="hide">Powered By <a
			href="http://www.wecenter.com/?copyright" target="blank">WeCenter
				3.0 Beta 2</a></span>

	</div>
</div>

</body>
</html>