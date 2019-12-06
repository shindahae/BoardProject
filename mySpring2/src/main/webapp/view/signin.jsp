<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Instagram</title>
<link rel="stylesheet" type="text/css" href="scroll.css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
td, font {
	color: rgb(35, 31, 32);
}
</style>
<script type="text/javascript">
	$(function() {
		$("input[type=radio]#selectgender").click(function() {
			$("input[type=hidden]#gender").val($(this).val());
		});

		$(document).ready(
				function() {
					$("input[type=hidden]#birth").val(
							$('select[name=year]').val() + "-"
									+ $('select[name=month]').val() + "-"
									+ $('select[name=day]').val());
					$('select[name=year]').change(
							function() {
								$("input[type=hidden]#birth").val(
										$('select[name=year]').val() + "-"
												+ $('select[name=month]').val()
												+ "-"
												+ $('select[name=day]').val());
							});
					$('select[name=month]').change(
							function() {
								$("input[type=hidden]#birth").val(
										$('select[name=year]').val() + "-"
												+ $('select[name=month]').val()
												+ "-"
												+ $('select[name=day]').val());
							});
					$('select[name=day]').change(
							function() {
								$("input[type=hidden]#birth").val(
										$('select[name=year]').val() + "-"
												+ $('select[name=month]').val()
												+ "-"
												+ $('select[name=day]').val());
							});
				});
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- body -->
	<form name="frm" action="/web/memberAdd.do" method="post" enctype="multipart/form-data">
		<div
			style="width: 100%; padding-top: 80px; margin-top: 3%; margin-left: 30%">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 well well-sm">
						<legend>
							<a href="http://www.jquery2dotnet.com"><i
								class="glyphicon glyphicon-globe"></i></a> Sign up!
						</legend>
						<form action="#" method="post" class="form" role="form">
							<div class="row">
								<div class="col-xs-6 col-md-6">
									<input class="form-control" name="name" placeholder="Name"
										type="text" required autofocus />
								</div>
							</div>
							<input class="form-control" name="email" placeholder="Email"
								type="email" style="margin-top: 1%" /> <input
								class="form-control" name="password" placeholder="New Password"
								type="password" style="margin-top: 2%" /> <label for=""
								style="margin-top: 1%"> Birth Date</label>
							<div class="row" style="margin-top: 1%">
								<div class="col-xs-4 col-md-4">
									<select class="form-control" id="selectdate" name="year">
										<c:forEach begin="1950" end="2019" var="i">
											<option>${i }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-xs-4 col-md-4">
									<select class="form-control" id="selectdate" name="month">
										<c:forEach begin="1" end="12" var="i">
											<option>${i }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-xs-4 col-md-4">
									<select class="form-control" id="selectdate" name="day">
										<c:forEach begin="1" end="31" var="i">
											<option>${i }</option>
										</c:forEach>
									</select>
								</div>
								<input type="hidden" id="birth" name="birth">
							</div>
							<label for="" style="margin-top: 2%"> Gender</label><br> <label
								class="radio-inline"> <input type="radio"
								id="selectgender" name="radiogender" value="male" /> Male
							</label> <label class="radio-inline"> <input type="radio"
								id="selectgender" name="radiogender" value="female" /> Female
							</label> <input type="hidden" id="gender" name="gender"> <br />
							<br />
							<textarea class="radio-inline" rows="3" cols="45" name="introduce">Introduce Yourself</textarea>
							<label style="margin-top: 3%">Upload your image!</label>
							<input class="radio-inline" type="file" name="file" style="margin-bottom: 3%">
							<button class="btn btn-lg btn-primary btn-block" type="submit">
								Sign up</button>
							<button class="btn btn-lg btn-primary btn-block" type="button">
								Cancel</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>