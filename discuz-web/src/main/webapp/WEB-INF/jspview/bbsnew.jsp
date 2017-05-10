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
					<!-- tab 切换 -->
					<ul class="nav nav-tabs aw-nav-tabs active">
						<h2 class="hidden-xs"><i class="icon icon-ask"></i> 发帖子</h2>
					</ul>
					<!-- end tab 切换 -->
					<form action="${pageContext.request.contextPath}/bbsnew" method="post" >
						

					<div class="aw-mod aw-mod-publish">
						<div class="mod-body">
							<h3>帖子标题:</h3>
							<div class="row">
								<div class='col-sm-8'>
									<input  required="required"  type="text" placeholder="帖子标题..." name="title" id="question_contents" value="" class="form-control">
								</div>
								<div class='col-sm-4'>
								<select required="required" name='category.id' class="form-control">
									  <option value="">--选择版块--</option>
									  <c:forEach items="${categorys }" var="bean">
									  		<option value="${bean.id }">${bean.name }</option>
									  </c:forEach>
									</select>
								</div>
							</div>

							<h3>帖子:</h3>
							<div>
							<textarea  id='body' name='body' rows="5" cols="" style="width: 100%"></textarea>
							</div>
						</div>
						<div class="mod-footer clearfix">
							<span class="aw-anonymity"> </span> 
							<button class="btn btn-large btn-success btn-publish-submit" type="submit">确认发起</button>
						</div>
					</div>
				</form>
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
						<div class="col-lg-6">
						    <div class="input-group">
						      <input type="text" class="form-control" placeholder="Search for...">
						      <span class="input-group-btn">
						        <button class="btn btn-default" type="button">Go!</button>
						      </span>
						    </div><!-- /input-group -->
						  </div><!-- /.col-lg-6 -->
  
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
					</div>			
				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.extend($.validator.messages, {
		required: "必须填写！"
	});
	 $("form").validate({
		 errorPlacement: function(error, element) {  
			    error.appendTo(element.parent());  
			}
	    });
	 
	 
	 	var editor=new Simditor({
			textarea:$("#body"),
			 upload : {
    	            url : '${pageContext.request.contextPath}/simditorupload', //文件上传的接口地址
    	            fileKey: 'file', //服务器端获取文件数据的参数名
    	            leaveConfirm: '正在上传文件'
    	        } 
		}
		);
	
});
</script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/module.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/uploader.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/hotkeys.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/simditor/simditor.js"></script>
</body>

