<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Instagram</title>
<link rel="stylesheet" type="text/css" href="scroll.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<style>
.require {
	color: #666;
}

label small {
	color: #999;
	font-weight: normal;
}
</style>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- body -->
	<div
		style="width: 100%; background-color: rgb(250, 250, 250); padding-top: 80px; padding-bottom: 30%;">
		<!-- 본문 -->
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">

					<h1>Create post</h1>

					<form name="frm" action="/web/postadd.do" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="title">Category <span class="require">*</span></label>
							<select class="form-control" name="category">
								<option selected="selected" disabled="disabled">Please
									select a category</option>
								<option>Style</option>
								<option>Beauty</option>
								<option>Tv&Movies</option>
								<option>Food</option>
								<option>Travels</option>
								<option>Nature</option>
								<option>Animals</option>
								<option>Music</option>

							</select>
						</div>
						<div class="form-group">
							<label for="description">Contents</label>
							<textarea rows="3" class="form-control" name="contents"></textarea>
						</div>

						<div class="form-group">
							<label for="title">File <span class="require">*</span></label> <input
								type="file" class="form-control" name="file" />
						</div>

						<div class="form-group">
							<p>
								<span class="require">*</span> - required fields
							</p>
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-primary">Create</button>
							<button class="btn btn-default">Cancel</button>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>