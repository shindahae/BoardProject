<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Instagram</title>
<link rel="stylesheet" type="text/css" href="scroll.css">
<script src="login.js"></script>
<style>
td, font {
	color: rgb(35, 31, 32);
	font-weight: 600;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- body -->
	<div
		style="width: 100%; background-color: rgb(250, 250, 250); padding-top: 80px;">
		<!-- 내 프로필 -->
		<table
			style="width: 76%; margin-left: 11%; margin-top: 1%; border-bottom: 1px solid rgb(242, 242, 242);">
			<tr>
				<th style="width: 400px; height: 200px;"><img alt=""
					src="upload/${mypageInfo.image }"
					style="width: 150px; border-radius: 50%; border: 5px solid rgb(242, 242, 242);"></th>
				<td><font style="font-size: 35px;">${mypageInfo.name }</font>
					<table style="margin-top: 2%; margin-bottom: 5%; width:50%">
						<tr>
							<td>게시물 ${mypageInfo.postnumber }</td>
							<td>팔로워 ${mypageInfo.follower }</td>
							<td>팔로우 ${mypageInfo.follow }</td>
						</tr>
					</table> 
					<table>
					<tr>
					<th style="width: 60%">
					<font style="font-size: 17px;">${mypageInfo.introduce }</font> 
					</th>
					<th>
					<a
					href="/web/write.do"><input type="button" value="write"
						style="width: 70px; height: 30px; background-color: white; margin-left: 30%"></a>
					</th>
					</tr>
					</table>
					</td>

			</tr>
		</table>
		<!-- 본문 -->
		<div style="width: 80%; margin-left: 11%; margin-top: 1%;">
			<c:forEach items="${mypageList }" var="post">
				<a href="/web/mydetail.do?postno=${post.postno} "><img alt=""
					src="upload/${post.image}" style="margin-left: 1%; margin-top: 1%; width: 300px;height: 300px"></a>
			</c:forEach>
		</div>
	</div>
</body>
</html>