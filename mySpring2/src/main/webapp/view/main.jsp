<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Instagram</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="scroll.css">
<link rel="stylesheet" type="text/css" href="search.css">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="login.js"></script>
<script type="text/javascript">
	function ajaxList(url, dataType) {
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
											temp += "<a href=\"/web/maindetail.do?postno="
													+ dom.postno + " \">";
											temp += "<img alt=\"\"	src=\"upload/"
													+ dom.image + "\"";
											temp += "style=\"margin-left: 1%; margin-top: 1%; width: 300px; height: 300px;\"></a>";
										});
						$("div#maindiv").html(temp);
					},
					error : function(e) {
						alert('error' + e);
					}
				});
	}
	
	function ajaxCategory(url, dataType) {
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
											temp += "<a href=\"/web/maindetail.do?postno="
													+ dom.postno + " \">";
											temp += "<img alt=\"\"	src=\"upload/"
													+ dom.image + "\"";
											temp += "style=\"margin-left: 1%; margin-top: 1%; width: 300px; height: 300px;\"></a>";
										});
						$("div#maindiv").html(temp);
					},
					error : function(e) {
						alert('error' + e);
					}
				});
	}
	
	$(function() {
		$('.test_class').click(function() {
			alert($(this).val());
		});

	});
</script>
</head>
<body onload="ajaxList('/web/mainList.do?page=1','json')">
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<div
		style="width: 100%; background-color: rgb(250, 250, 250); padding-top: 120px;">
		<!-- category -->
		<div style="width: 80%; margin-left: 12%;">
			<table style="position: relative; padding-top: 2%">
				<tr>
					<th><img alt="" src="image/all.jpg" id="all" onclick="ajaxCategory('/web/category_click.do?category=All','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 858px;">All</b></th>
					<th><img alt="" src="image/style.jpg" onclick="ajaxCategory('/web/category_click.do?category=Style','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 747px;">Style</b></th>
					<th><img alt="" src="image/beauty.jpg" onclick="ajaxCategory('/web/category_click.do?category=Beauty','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 638px;">Beauty</b></th>
					<th><img alt="" src="image/tv.jpg" onclick="ajaxCategory('/web/category_click.do?category=Tv&Movies','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 524px;">Tv&Movies</b></th>
					<th><img alt="" src="image/food.jpg" onclick="ajaxCategory('/web/category_click.do?category=Food','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 439px;">Food</b></th>
					<th><img alt="" src="image/travel.jpg" onclick="ajaxCategory('/web/category_click.do?category=Travel','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 336px;">Travel</b></th>
					<th><img alt="" src="image/nature.jpg" onclick="ajaxCategory('/web/category_click.do?category=Nature','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 228px;">Nature</b></th>
					<th><img alt="" src="image/animals.jpg" onclick="ajaxCategory('/web/category_click.do?category=Animals','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 121px;">Animals</b></th>
					<th><img alt="" src="image/music.jpg" onclick="ajaxCategory('/web/category_click.do?category=Music','json')"
						style="margin-left: 1%; margin-top: 2%; width: 100px; border-radius: 20%; opacity: 0.8;">
						<b
						style="color: white; position: absolute; top: 80px; right: 25px;">Music</b></th>
				</tr>
			</table>
		</div>
		<!-- 본문 -->
		<div id="maindiv"
			style="width: 80%; margin-left: 11%; margin-top: 1%;"></div>
		<div class="paging"
			style="margin-top: 5%; text-align: center; padding-bottom: 5%;">${page }</div>

	</div>
</body>
</html>