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
							<h2><i class="icon icon-setting"></i>注册用户</h2>
						</ul>
					</div>
					
					<div class="tab-content clearfix">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/doregister" method="post" >
<div class="aw-mod">
	<div class="mod-body">
		<div class="aw-mod aw-user-setting-bind">
			<div class="mod-head">
				<h3 style="color: red">修改密码：必须遵守论坛规则！</h3>
			</div>
				<div class="mod-body">
					<div class="form-group">
						<label class="control-label" for="input-password-old">用户名</label>
						<div class="row">
							<div class="col-lg-4">
								<input type="text" class="form-control" id="input-password-old" name="username">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label" for="input-password-old">昵称</label>
						<div class="row">
							<div class="col-lg-4">
								<input type="text" class="form-control" id="input-password-old" name="chinesename">
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label" for="input-password-new">密码</label>
						<div class="row">
							<div class="col-lg-4">
							    <input type="password" class="form-control" id="input-password-new" name="password">
							</div>
						</div>
					</div> 
					  
					
					<div class="form-group">
						<label class="control-label" for="input-password-new">等级</label>
						<div class="row">
							<div class="col-lg-4">
							    <select name="level" class="form-control">
							    	<option value="学徒">学徒</option>
							    	<option value="团级">团级</option>
							    	<option  value="营级">营级</option>
							    	<option  value="尉级">尉级</option>
							    	<option  value="旅级">旅级</option>
							    </select>
							</div>
						</div>
					</div> 
					
					  
					  <div class="form-group">
						<label class="control-label" for="input-password-new">个性签名</label>
						<div class="row">
							<div class="col-lg-4">
							    <input type="text" class="form-control" name="remark">
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
