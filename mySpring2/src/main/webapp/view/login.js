function ajax_login_click(url) {
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			/* 로그인 세션이 있을 때 */
			if (data == 1) {
				alert('이미 로그인하였습니다.');
			} else {
				/* 로그인 세션이 없을 때 */
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

function ajax_logout_click(url) {
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			/* 로그인 세션이 있을 때 */
			if (data == 1) {
				if (confirm("로그아웃 하시겠습니까?") == true) {
					logout_function('/web/logout.do');
				} else {
					return false;
				}
			} else {
				/* 로그인 세션이 없을 때 */
				alert('로그인 세션이 없습니다.');
			}
		},
		error : function(e) {
			alert('error' + e);
		}
	});
}

function logout_function(url) {
	$.ajax({
		type : 'POST',
		url : url,
		success : function() {
			alert('로그아웃 되었습니다.');
			location.href = "main.jsp";
		},
		error : function(e) {
			alert('error' + e);
		}
	});
}