<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<div
	style="width: 100%; height: 80px; border-bottom: 1px solid rgb(242, 242, 242); position: fixed; left: 0px; top: 0px; background-color: white; z-index: 1;">
	<a href="main.jsp"><img alt="" src="image/logo.png"
		style="width: 150px; height: 40px; margin-left: 10%; margin-top: 1%"></a>

	<img alt="" src="image/login.png" onclick="ajax_login_click('/web/like_click.do')"
		style="width: 27px; height: 27px; margin-left: 48%;margin-top: 9px;">
		<img alt=""
		src="image/logout.png" onclick="ajax_logout_click('/web/like_click.do')"
		style="width: 27px; height: 27px; margin-left: 3%; margin-top: 1%">
	<a href="/web/mypage.do"><img alt="" src="image/mypage.png"
		style="width: 30px; height: 30px; margin-left: 3%; margin-top: 12px;"></a>
</div>