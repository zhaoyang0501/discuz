<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugins/simditor/simditor.css" />
</head>
<body >
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                 
      		 	<div class="ibox-content">
 		 			<div class="row">
                            <div class="col-sm-12 b-r">
		                           <form class="form-horizontal" action="${pageContext.request.contextPath}/bbs/article/goupdate" method="post">
		                           <input name='id' type="hidden" value="${article.id }"/>
		                           	<table class='table table-bordered'>
		                           		<thead>
		                           		<tr style="text-align: center;" ><td colspan="6" ><h3>修改帖子<h3></h3></td></tr>
		                           		</thead>
		                           		<tbody>
		                           			<tr>
		                           				<td>板块</td>
		                           				<td> 
		                           					<select class="form-control" name="category.id">
		                           						<c:forEach items="${categorys }" var="bean">
		                           							<option s value="${bean.id}">${bean.name }</option>
		                           						</c:forEach>
		                           						
		                           					</select>
		                           				</td>
		                           			</tr>
		                           			<tr>
		                           				<td>帖子标题</td>
		                           				<td> <input name='title' value="${article.title }" type="text" class="form-control"></td>
		                           			</tr>
											<tr>
												<td>内容</td>
		                           				<td> <textarea  id='body' name='body' rows="4" cols="" style="width: 80%">${article.body }</textarea></td>
		                           			</tr>
		                           			
		                           			
		                           			
		                           			<tr>
		                           				<td>提示</td>
		                           				<td > 
		                           					 <h4>提示</h4>
		                               					 <ol>
									    					<li>文章长度不能超过10000个字长度</li>
									    				</ol>
		                           				</td>
		                           			</tr>
		                           			<tr>
		                           				<td colspan="6"> 
		                           					 <div class="col-sm-4 col-sm-offset-2">
		                                  			  		<button  class="btn btn-primary" type="submit" >提交</button>
		                               				 </div>
		                           				</td>
		                           			</tr>
		                           		</tbody>
		                           	</table>
		                           	</form>
                            </div>
                        </div>
                        </div>
                    
                </div>
            </div>
        </div>
   </div>
   
   
   <script>
    $(document).ready(function(){
    	var editor=new Simditor({
    				textarea:$("#body"),
    				 upload : {
    	    	            url : '${pageContext.request.contextPath}/simditorupload', //文件上传的接口地址
    	    	            fileKey: 'file', //服务器端获取文件数据的参数名
    	    	            leaveConfirm: '正在上传文件'
    	    	        } 
    			}
    			);
    	$("select[category.id]").val('${article.category.id}');
   });
    </script>
    
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/simditor/module.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/simditor/uploader.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/simditor/hotkeys.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/simditor/simditor.js"></script>
</body>

</html>
