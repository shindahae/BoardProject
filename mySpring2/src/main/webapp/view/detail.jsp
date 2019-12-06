<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Instagram</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="scroll.css">
<script src="login.js"></script>
<style>
td, font {
	color: rgb(35, 31, 32);
}
</style>
<script type="text/javascript">
	/*
	 * 댓글 리스트 ajax로 가져옴
	 */
	function ajaxReplyList(url, dataType) {
		var temp = '';
		$
				.ajax({
					type : 'POST',
					url : url,
					dataType : dataType,
					success : function(v) {
						$(v)
								.each(
										function(index, dom) {
											temp += "<tr><th style=\"width: 70px\"><img alt=\"\" src=\"upload/"+dom.image+"\" style=\"width: 40px; border-radius: 50%;\"></th>";
											temp += "<td><font style=\"font-weight: bold; font-size: 13px;\">"
													+ dom.email + "</font>";
											temp += "<font style=\"margin-left: 3%; font-size: 12px;\">"
													+ dom.contents
													+ "</font></td></tr>";
										});
						$("table#replydiv").html(temp);
					},
					error : function(e) {
						alert('error' + e);
					}
				});
	}

	/*
	 * 좋아요 클릭 시 로그인 세션 확인
	 */
	function ajax_like_click(url) {
		$.ajax({
			type : 'POST',
			url : url,
			success : function(data) {
				/* 로그인 세션이 있을 때  */
				if (data == 1) {
					$('#like_img').attr('src', 'image/liketrue.png');
				} else {
					/* 로그인 세션이 없을 때  */
					if (confirm("로그인 하시겠습니까?") == true) {
						location.href = "login.jsp";
					} else {
						return false;
					}
				}
			},
			error : function(e) {
				alert('error' + e);
			}
		});
	}

	/*
	 *댓글 게시 버튼 클릭시 insert function으로 이동
	 */
	function ajax_reply_send(url) {
		$.ajax({
			type : 'POST',
			url : url,
			success : function(data) {
				/* 로그인 세션이 있을 때  */
				if (data == 1) {
					if ($('#replycontents').val() == '') {
						alert('댓글을 입력하세요.');
					} else {
						reply_insert();
					}
				} else {
					/* 로그인 세션이 없을 때  */
					if (confirm("로그인 하시겠습니까?") == true) {
						location.href = "login.jsp";
					} else {
						return false;
					}
				}
			},
			error : function(e) {
				alert('error' + e);
			}
		});
	}
	/*
	 *댓글을 DB에 insert한 후 댓글 리스트 ajax로 다시 불러옴
	 */
	function reply_insert() {
		location.href = ('/web/reply_send.do?postno=' + $('#postno').val()
				+ '&replycontents=' + $('#replycontents').val());
		ajaxReplyList('/web/replyList.do?postno=${postDetail.postno}', 'json');
	}

	$(function() {
		$('#reply_insert').click(function() {
			var temp="<input id=\"replycontents\" type=\"text\" style=\"margin-left:4%; font-size: 17px; color: gray; width: 200px\">";
			$("td#replytd").html(temp);
		});

		$('#reply_send').click(function() {
			ajax_reply_send('/web/like_click.do');
		});

	});
</script>
</head>
<body
	onload="ajaxReplyList('/web/replyList.do?postno=${postDetail.postno}','json')">
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- body -->
	<div
		style="width: 100%; background-color: rgb(250, 250, 250); padding-top: 80px; padding-bottom: 30%;">
		<!-- 본문 -->
		<div
			style="width: 60%; margin-left: 20%; padding-top: 4%; padding-bottom: 5%;">
			<img alt="" src="upload/${postDetail.image }"
				style="width: 400px; float: left;"> <input type="hidden"
				id="postno" name="postno" value="${postDetail.postno}">
			<!-- 상단 프로필 -->
			<table
				style="float: right; width: 46%; height: 70px; background-color: white; border-bottom: 1px solid rgb(242, 242, 242);">
				<tr>
					<th style="width: 70px"><img alt=""
						src="upload/${postDetail.memberimage }"
						style="width: 40px; border-radius: 50%;"></th>
					<td><font style="font-weight: bold; font-size: 13px;">${postDetail.email }</font>
						<font
						style="margin-left: 3%; font-weight: bold; font-size: 13px; color: rgb(93, 170, 243);">팔로우</font></td>
				</tr>
			</table>
			<!-- 댓글창 -->
			<table id="replydiv"
				style="float: right; width: 46%; height: 230px; background-color: white; border-bottom: 1px solid rgb(242, 242, 242); table-layout: fixed; display: block; overflow-x: hidden; overflow-y: scroll;">
			</table>
			<!-- 좋아요 -->
			<table
				style="float: right; width: 46%; height: 50px; background-color: white; border-bottom: 1px solid rgb(242, 242, 242);">
				<tr>
					<th style="width: 20px; padding-left: 4%;"><img id="like_img"
						alt="" src="image/likefalse.png" style="width: 25px;"
						onclick="ajax_like_click('/web/like_click.do')"></th>
					<td><font
						style="font-weight: bold; font-size: 13px; margin-left: 6%;">좋아요
							2개</font> <%-- <font
						style="font-weight: bold; font-size: 13px; margin-left: 6%;">좋아요
							${postDetail.postlike }개</font> --%></td>
				</tr>
			</table>
			<!-- 댓글쓰기 -->
			<table
				style="float: right; width: 46%; height: 50px; background-color: white;">
				<tr>
						<td id="replytd"><font id="reply_insert"
							style="margin-left: 7%; font-size: 10px; color: gray;">댓글
								달기</font></td>

					<td align="right"><font id="reply_send"
						style="font-size: 10px; color: rgb(93, 170, 243); margin-right: 36%">게시</font></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>