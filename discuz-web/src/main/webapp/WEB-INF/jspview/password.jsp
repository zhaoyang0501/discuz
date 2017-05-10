<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="aw-container-wrap">
	<div class="container">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="aw-user-setting">
					<div class="tabbable">
						<ul class="nav nav-tabs aw-nav-tabs active">
							<h2><i class="icon icon-setting"></i>密码修改</h2>
						</ul>
					</div>
					
					<div class="tab-content clearfix">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/password" method="post" >
<div class="aw-mod">
	<div class="mod-body">
		<div class="aw-mod aw-user-setting-bind">
			<div class="mod-head">
				<h3 style="color: red">修改密码：密码必须包含数字及字母，且长度必须大于8位！</h3>
			</div>
				<div class="mod-body">
					<div class="form-group">
						<label class="control-label" for="input-password-old">当前密码</label>
						<div class="row">
							<div class="col-lg-4">
								<input type="password" class="form-control" id="input-password-old" name="pw">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label" for="input-password-new">新的密码</label>
						<div class="row">
							<div class="col-lg-4">
							    <input type="password" class="form-control" id="input-password-new" name="pw1">
							</div>
						</div>
					</div> 
					<div class="form-group">
						<label class="control-label" for="input-password-re-new">确认密码</label>
						<div class="row">
							<div class="col-lg-4">
							    <input type="password" class="form-control" id="input-password-re-new" name="pw2">
							</div>
						</div>
					</div>      
				</div>
			
		</div>
	</div>
	<div class="mod-footer clearfix">
	<button type="submit" class="btn btn-large btn-success pull-left" >保存</button>
	</div>
</div>

</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
