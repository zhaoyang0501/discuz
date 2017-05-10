<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<body class="home-template">
<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content">
					<!-- tab切换 -->
					<ul class="nav nav-tabs aw-nav-tabs active ">
						<li><a href="${pageContext.request.contextPath}/bbstobereply">等待回复</a></li>
						<li  class="active"><a href="${pageContext.request.contextPath}/bbshot">热门</a></li>
						<li><a href="${pageContext.request.contextPath}/bbsgood">精华</a></li>
						<li><a href="${pageContext.request.contextPath}/bbs">最新</a></li>

						<h2 class="hidden-xs"><i class="icon icon-list"></i> 发现</h2>
					</ul>
					<!-- end tab切换 -->

					
					<div class="aw-mod aw-explore-list">
						<div class="mod-body">
							<div class="aw-common-list">
								
								<c:forEach items="${bbs }" var="bean">
														
								<div class="aw-item active" data-topic-id="5,">
										<a class="aw-user-name hidden-xs" data-id="1325" href="#" rel="nofollow"><img src="http://wenda.ghostchina.com/uploads/avatar/000/00/13/25_avatar_max.jpg" alt=""></a>	<div class="aw-question-content">
														<h4>
															<a href="${pageContext.request.contextPath}/bbsdetail/${bean.id}">${bean.title }</a>
														</h4>
	 												<a href="${pageContext.request.contextPath}/bbsdetail/${bean.id}" class="pull-right ">回复</a>
															<p>
																<a class="aw-question-tags" href="#">${bean.category.name }</a>
															• 													<a href="#" class="aw-user-name">${bean.user.chinesename }</a> 
													<span class="text-color-999">发起了讨论 •${fn:length(bean.comments)}个回复 • ${bean.click } 次浏览 • <fmt:formatDate value="${bean.createDate }" pattern="MM月dd日"/> 
													</span>
																		<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
											</p>
											
												</div>
									</div>
								</c:forEach>
								
								
							</div>
						</div>
						
						<div class="mod-footer">
						</div>
				</div>
				</div>

				<!-- 侧边栏 -->
				<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs hidden-sm">
					<div class="aw-mod aw-text-align-justify">
						<div  style="padding-bottom: 20px">
							<a href="${pageContext.request.contextPath}/bbsnew" class='btn btn-info'>发帖</a>
						</div>
						<div class="mod-head">
							<h3>所有板块</h3>
						</div>
				
						<div class="mod-body">
							<c:forEach items="${categorys }" var="category">
								<dl>
									<dt class="pull-left aw-border-radius-5">
										<a href="#"><img alt="" src="${category.logo }"></a>
									</dt>
									<dd class="pull-left">
										<p class="clearfix">
											<span class="topic-tag">
												<a href="${pageContext.request.contextPath}/bbscategory?id=${category.id }" class="text" data-id="5">${category.name }</a>
											</span>
										</p>
									</dd>
								</dl>
							</c:forEach>
			  			</div>
					</div>
					
					<div class="aw-mod aw-text-align-justify">
						<div class="mod-head">
							<h3>热门用户</h3>
						</div>
						<div class="mod-body">
							<c:forEach items="${hotuser }" var="user">
								<dl>
									<dt class="pull-left aw-border-radius-5">
										<a href="#"><img alt="" src="http://wenda.ghostchina.com/uploads/avatar/000/00/12/19_avatar_max.jpg"></a>
									</dt>
									<dd class="pull-left">
										<a href="#" data-id="1326" class="aw-user-name">${user.chinesename }</a>
										<p class="signature"></p>
									</dd>
								</dl>
							</c:forEach>
					</div>
</div>				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
</body>

