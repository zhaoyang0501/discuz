<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
     <body > 
     <c:forEach items="${news }" var="bean">
    		 <article class='post'>
					<div class='post-head'>
						<h1 class='post-title'>
							<a href='${pageContext.request.contextPath}/newsdetail/${bean.id }'>${bean.title }</a>
						</h1>
						<div class='post-meta'>
							<span class='author'>作者：管理员</span>
							&bull;
							<time class='post-date' datetime='' title=''>
								<fmt:formatDate value="${bean.createDate }" pattern="yyyy年MM月dd日"/>
							</time>
						</div>
					</div>
					<div class='post-content'>
						<p>
							${bean.body }
						</p>
					  </div>
					<div class="post-permalink">
				        <a href="${pageContext.request.contextPath}/newsdetail/${bean.id }" class="btn btn-default">阅读全文</a>
				    </div>

					<footer class='post-footer clearfix'>
						<div class='pull-right share'></div>
					</footer>
				</article>
    	 </c:forEach>
			
			<nav class="pagination" role="navigation">
				<c:if test="${curpage>1 }">
						<a class="newer-posts" href="${pageContext.request.contextPath}/news/${curpage-1 }"><i class="fa fa-angle-left"></i></a>
				</c:if>
			    <span class="page-number">第 ${curpage } 页 &frasl; 共 ${totalpage } 页</span>
			    
			    <c:if test="${curpage<totalpage }">
						<a class="newer-posts" href="${pageContext.request.contextPath}/news/${curpage+1 }"><i class="fa fa-angle-right"></i></a>
				</c:if>
				
			</nav>
			
                </body>