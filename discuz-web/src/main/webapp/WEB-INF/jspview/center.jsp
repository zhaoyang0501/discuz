<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-9 aw-main-content">
                    <!-- 用户数据内容 -->
                    <div class="aw-mod aw-user-detail-box">
                        <div class="mod-head">
                            <img src="http://wenda.ghostchina.com/uploads/avatar/000/00/13/34_avatar_max.jpg" alt="朝阳">
                            <span class="pull-right operate">
                                                                <a href="#" class="btn btn-mini btn-success">编辑</a>
                                                            </span>
                            <h1>${user.chinesename } </h1>
                            <p class="text-color-999"></p>
                            <p class="aw-user-flag">
                                                                                                                            </p>
                        </div>
                        <div class="mod-body">
                            <div class="meta">
                                <span><i class="icon icon-prestige"></i> 积分: <em class="aw-text-color-green">120分</em></span>
                                 <span><i class="icon icon-prestige"></i> 您的等级: <em class="aw-text-color-green">学徒</em></span>
                            </div>
                            
                        </div>
                        <div class="mod-footer">
                            <ul class="nav nav-tabs aw-nav-tabs">
                                <li class="active"><a href="#article" id="page_overview" data-toggle="tab">发帖<span class="badge">${fn:length(articles)}</span></a></li>
                                <li class=""><a href="#comment" id="page_articles" data-toggle="tab">我的回帖<span class="badge">${fn:length(comments)}</span></a></li>
                             </ul>
                        </div>
                    </div>
                    <!-- end 用户数据内容 -->
                    <div class="aw-user-center-tab">
                        <div class="tab-content">
                            
                            <div class="tab-pane active" id="article">
                                <!-- 回复 -->
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3><a class="pull-right aw-more-content" href="javascript:;" onclick="$('#page_answers').click();">更多 »</a>发帖</h3>
                                    </div>
                                    
                                    <div class="mod-body">
                                         <c:forEach items="${articles }" var="bean">
	                                         <div class="aw-profile-answer-list">
	                                            <div class="aw-item">
	                                                    <div class="mod-head">
	                                                        <h4><a href="${pageContext.request.contextPath}/bbsdetail/${bean.id}">${bean.title }</a> (${bean.commentcount }回复)</h4>
	                                                    </div>
	                                                    <div class="mod-body">
	                                                        <p class="text-color-999">
	                                                        	<fmt:formatDate value="${bean.createDate }" pattern="MM月dd日"/>
	                                                        </p>
	                                                    </div>
	                                                </div>
	                                            </div>
                                         </c:forEach>
                                    </div>
                                </div>
                                <!-- end 回复 -->
                            </div>
                            
                         
                            
                            
                            
                             <div class="tab-pane " id="comment">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3><a class="pull-right aw-more-content" href="javascript:;" onclick="$('#page_answers').click();">更多 »</a>评论</h3>
                                    </div>
                                    
                                    <div class="mod-body">
                                        <div id="contents_user_actions">
	                                          <c:forEach items="${comments}" var="bean">
	                                          	<div class="aw-item">
													<p>
														<em class="pull-left"> <fmt:formatDate pattern="MM月dd日" value="${bean.createDate }"/>发表了评论:</em>
														<a class="aw-hide-txt" href="${pageContext.request.contextPath}/bbsdetail/${bean.article.id}">${ bean.body}</a>
													</p>
												</div>
	                                          </c:forEach>
										 </div>
                                    </div>
                                </div>
                                <!-- end 回复 -->
                            </div>
                            
                            
                            
                            <div class="tab-pane" id="questions">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>发问</h3>
                                    </div>
                                    <div class="mod-body">
                                        <div class="aw-profile-publish-list" id="contents_user_actions_questions"><p style="padding: 15px 0" align="center">没有内容</p></div>
                                    </div>
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content disabled" id="bp_user_actions_questions_more" data-page="0">
                                            <span>没有更多了</span>
                                        </a>
                                        <!-- end 加载更多内容 -->
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="answers">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>回复</h3>
                                    </div>
                                    <div class="mod-body">
                                        <div class="aw-profile-answer-list" id="contents_user_actions_answers">	
<div class="aw-item">
	<div class="aw-mod">
		<div class="mod-head">
			<h4 class="aw-hide-txt">
				<a href="http://wenda.ghostchina.com/question/548">asdfasdfadf</a>
			</h4>
		</div>
		<div class="mod-body">
			<span class="aw-border-radius-5 count pull-left"><i class="icon icon-agree"></i>0</span>
			<p class="text-color-999">111</p>
			<p class="text-color-999">1 天前</p>
		</div>
	</div>
</div>
</div>
                                    </div>
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content" id="bp_user_actions_answers_more" data-page="1">
                                            <span>更多</span>
                                        </a>
                                        <!-- end 加载更多内容 -->
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="articles">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>文章</h3>
                                    </div>
                                    <div class="mod-body">
                                        <div class="aw-profile-publish-list" id="contents_user_actions_articles"><p style="padding: 15px 0" align="center">没有内容</p></div>
                                    </div>
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content disabled" id="bp_user_actions_articles_more" data-page="0">
                                            <span>没有更多了</span>
                                        </a>
                                        <!-- end 加载更多内容 -->
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="focus">
                                <!-- 自定义切换 -->
                                <div class="aw-mod">
                                    <div class="aw-tabs text-center">
                                        <ul>
                                            <li class=""><a>关注的人</a></li>
                                            <li class="active"><a>关注者</a></li>
                                            <li><a>关注的话题</a></li>
                                        </ul>
                                    </div>
                                    <div class="mod-body">
                                        <div class="aw-tab-content">
                                            <div class="aw-mod aw-user-center-follow-mod" style="display: none;">
                                                <div class="mod-body">
                                                    <ul id="contents_user_follows" class="clearfix"><p style="padding: 15px 0" align="center">没有内容</p></ul>
                                                </div>
                                                <div class="mod-footer">
                                                    <!-- 加载更多内容 -->
                                                    <a class="aw-load-more-content disabled" id="bp_user_follows_more" data-page="0">
                                                        <span>没有更多了</span>
                                                    </a>
                                                    <!-- end 加载更多内容 -->
                                                </div>
                                            </div>
                                            <div class="aw-mod aw-user-center-follow-mod hide" style="display: block;">
                                                <div class="mod-body">
                                                    <ul class="clearfix" id="contents_user_fans"><p style="padding: 15px 0" align="center">没有内容</p></ul>
                                                </div>
                                                <div class="mod-footer">
                                                    <!-- 加载更多内容 -->
                                                    <a class="aw-load-more-content disabled" id="bp_user_fans_more" data-page="0">
                                                        <span>没有更多了</span>
                                                    </a>
                                                    <!-- end 加载更多内容 -->
                                                </div>
                                            </div>
                                            <div class="aw-mod aw-user-center-follow-mod hide" style="display: none;">
                                                <div class="mod-body">
                                                    <ul id="contents_user_topics" class="clearfix"><p style="padding: 15px 0" align="center">没有内容</p></ul>
                                                </div>
                                                <div class="mod-footer">
                                                    <!-- 加载更多内容 -->
                                                    <a class="aw-load-more-content disabled" id="bp_user_topics_more" data-page="0">
                                                        <span>没有更多了</span>
                                                    </a>
                                                    <!-- end 加载更多内容 -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end 自定义切换 -->
                            </div>
                            <div class="tab-pane" id="actions">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>最新动态</h3>
                                    </div>
                                    <div class="mod-body">
                                        <div id="contents_user_actions"><div class="aw-item">
	<p>
		<span class="pull-right text-color-999">1 天前</span>
		<em class="pull-left"><a href="#" class="aw-user-name" data-id="1334">朝阳</a> 回答了问题:</em>
		
		<a class="aw-hide-txt" href="#">asdfasdfadf</a>

	</p>
</div>
<div class="aw-item">
	<p>
		<span class="pull-right text-color-999">1 天前</span>
		<em class="pull-left"><a href="#" class="aw-user-name" data-id="1334">朝阳</a> 关注了该问题:</em>
		
		<a class="aw-hide-txt" href="#">Ghost如何去除商业水印</a>

	</p>
</div>
</div>
                                    </div>
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content" id="bp_user_actions_more" data-page="1">
                                            <span>更多</span>
                                        </a>
                                        <!-- end 加载更多内容 -->
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="detail">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>详细资料</h3>
                                    </div>
                                    <div class="mod-body aw-user-center-details">
                                                                            <dl>
                                        <dt><span>个人成就:</span></dt>
                                        <dd>
                                            <p class="meta">
                                                <span><i class="icon icon-prestige"></i>威望: <em class="aw-text-color-green">0</em></span>
                                                                                                <span><i class="icon icon-agree"></i>赞同: <em class="aw-text-color-orange">0</em></span>
                                                <span><i class="icon icon-thank"></i>感谢: <em class="aw-text-color-orange">0</em></span>
                                            </p>
                                        </dd>
                                    </dl>
                                    
                                    
                                    
                                                                        <dl>
                                        <dt><span>最后活跃:</span></dt>
                                        <dd>11 秒前</dd>
                                    </dl>
                                    
                                                                        </div>
                                </div>
                            </div>
                                                    </div>
                    </div>
                </div>

                <!-- 侧边栏 -->
                <div class="col-sm-12 col-md-3 aw-side-bar">
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            <a onclick="$('#page_focus').click();$('#focus .aw-tabs ul li').eq(0).click();$.scrollTo($('#focus').offset()['top'], 600, {queue:true})" class="pull-right font-size-12">更多 »</a>
                            <span>
                                关注 <em class="aw-text-color-blue">0</em> 人                            </span>
                                                    </div>
                    </div>
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            <a onclick="$('#page_focus').click();$('#focus .aw-tabs ul li').eq(1).click();$.scrollTo($('#focus').offset()['top'], 600, {queue:true})" class="pull-right font-size-12">更多 »</a>
                            <span>
                                被 <em class="aw-text-color-blue">0</em> 人关注                            </span>

                                                    </div>
                        
                    </div>
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            关注 <em class="aw-text-color-blue">0</em> 话题                                                    </div>
                    </div>
                    <div class="aw-mod">
                        <div class="mod-body">
                            <span class="aw-text-color-666">
                                主页访问量 : 13 次访问                            </span>
                        </div>
                    </div>
                </div>
                <!-- end 侧边栏 -->
            </div>
        </div>
</body>

