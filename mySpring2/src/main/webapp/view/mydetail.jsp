0<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Instagram</title>
<link rel="stylesheet" type="text/css" href="scroll.css">
<link rel="stylesheet" type="text/css" href="button.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="login.js"></script>
<style>
td, font {
	color: rgb(35, 31, 32);
}
</style>
<script type="text/javascript">
	$(function() {
		$("input[type=button]#modify").click(function() {
			if (confirm("게시물을 수정하시겠습니까?") == true) {
				var postno = $("input[name=postno]").val();
				var email = $("input[name=email]").val();
				ajaxModify('/web/detailmodify.do?postno=' + postno, 'json');
			} else {
				return false;
			}
		});
		$("input[type=button]#delete").click(function() {
			if (confirm("게시물을 삭제하시겠습니까?") == true) {
				frm.submit();
			} else {
				return false;
			}
		});
	});
	function ajaxModify(url, dataType, postno) {
		var temp = '';
		$
				.ajax({
					type : 'POST',
					url : url,
					data : 'postno=' + postno,
					dataType : dataType,
					success : function(v) {
						temp += "<div class=\"container\"><div class=\"row\"><div class=\"col-md-8 col-md-offset-2\">	<h1>Modify post</h1>";
						temp += "<form name=\"frm\" action=\"/web/modifysuccess.do\" method=\"post\" enctype=\"multipart/form-data\">";
						temp += "<div class=\"form-group\"><label for=\"title\">Category </label>";
						temp += "<input type=\"hidden\" name=\"postno\" value=\""+v.postno+"\">";
						temp += "<select class=\"form-control\" name=\"category\">";
						temp += "<option>Please select a category</option>";
						if (v.category == 'Style') {
							temp += "<option selected=\"selected\">Style</option>";
						} else {
							temp += "<option>Style</option>";
						}
						if (v.category == 'Tv&Movies') {
							temp += "<option selected=\"selected\">Tv&Movies</option>";
						} else {
							temp += "<option>Tv&Movies</option>";
						}
						if (v.category == 'Beauty') {
							temp += "<option selected=\"selected\">Beauty</option>";
						} else {
							temp += "<option>Beauty</option>";
						}
						if (v.category == 'Food') {
							temp += "<option selected=\"selected\">Food</option>";
						} else {
							temp += "<option>Food</option>";
						}
						if (v.category == 'Travels') {
							temp += "<option selected=\"selected\">Travels</option>";
						} else {
							temp += "<option>Travels</option>";
						}
						if (v.category == 'Nature') {
							temp += "<option selected=\"selected\">Nature</option>";
						} else {
							temp += "<option>Nature</option>";
						}
						if (v.category == 'Animals') {
							temp += "<option selected=\"selected\">Animals</option>";
						} else {
							temp += "<option>Animals</option>";
						}
						if (v.category == 'Music') {
							temp += "<option selected=\"selected\">Music</option>";
						} else {
							temp += "<option>Music</option>";
						}
						temp += "<div class=\"form-group\"><label for=\"description\">Contents</label>";
						temp += "<textarea rows=\"3\" class=\"form-control\" name=\"contents\">"
								+ v.contents + "</textarea></div>";
						temp += "<div class=\"form-group\"><label for=\"title\">File </label> ";
						temp += "<input type=\"file\" class=\"form-control\" name=\"file\" />";
						temp += "<label for=\"title\">게시된 파일 </label><input type=\"text\" name=\"filename\" class=\"form-control\" value=\""+v.image+"\"></div>";
						temp += "<div class=\"form-group\"><button type=\"submit\" class=\"btn btnimary\">Modify</button>";
						temp += "<div class=\"btn btn-default\">Cancel</button></div></form></div></div></div>";
						$("span#info").html(temp);
					},
					error : function(e) {
						alert('error' + e);
					}
				});
	}
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- body -->
	<div
		style="width: 100%; background-color: rgb(250, 250, 250); padding-top: 80px; padding-bottom: 30%;">
		<!-- 본문 -->
		<span id="info">
			<form name="frm"
				action="/web/mydetaildelete.do?postno=${myDetail.postno}"
				method="post">
				<input type="hidden" name="postno" value="${myDetail.postno}">
				<input type="hidden" name="email" value="${myDetail.email}">
				<div
					style="width: 60%; margin-left: 20%; padding-top: 4%; padding-bottom: 5%;">
					<img alt="" src="upload/${myDetail.image }"
						style="width: 400px; float: left;">
					<!-- 수정/삭제 버튼-->
					<table
						style="float: right; width: 46%; height: 40px; background-color: white; border-bottom: 1px solid rgb(242, 242, 242); table-layout: fixed;">
						<tr>
							<td align="right"><input id="modify" type="button"
								value="modify"
								style="width: 70px; height: 30px; background-color: white;"><input
								id="delete" type="button" value="delete"
								style="width: 70px; height: 30px; background-color: white; margin-left: 1%; margin-right: 1%"></td>
						</tr>
					</table>
					<!-- 내가쓴글 -->
					<table
						style="float: right; width: 46%; height: 120px; background-color: white; border-bottom: 1px solid rgb(242, 242, 242); table-layout: fixed; display: block; overflow-x: hidden; overflow-y: scroll;">
						<tr>
							<th style="width: 70px"><img alt=""
								src="upload/${myDetail.memberimage }"
								style="width: 40px; border-radius: 50%;"></th>
							<td><font style="font-weight: bold; font-size: 13px;">${myDetail.email }</font>
								<font style="margin-left: 3%; font-size: 12px;">${myDetail.contents }</font></td>
						</tr>
					</table>
					<!-- 댓글창 -->
					<table
						style="float: right; width: 46%; height: 240px; background-color: white; border-bottom: 1px solid rgb(242, 242, 242); table-layout: fixed; display: block; overflow-x: hidden; overflow-y: scroll;">
						<c:forEach items="${myReply }" var="reply">
						<tr>
							<th style="width: 70px"><img alt=""
								src="upload/${reply.image}"
								style="width: 40px; border-radius: 50%;"></th>
							<td><font style="font-weight: bold; font-size: 13px;">${reply.email}</font>
								<font style="margin-left: 3%; font-size: 12px;">${reply.contents}</font></td>
						</tr>
						</c:forEach>						
					</table>
				</div>
			</form>
		</span>
	</div>
</body>
</html>