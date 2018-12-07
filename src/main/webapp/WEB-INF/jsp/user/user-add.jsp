<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title></title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="../common/top.jsp"></jsp:include>
	<!-- 中间主体 -->
		<div class="container" id="content">
		<div class="row">
			<jsp:include page="../common/menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 style="text-align: center;">添加学生信息</h1>
						</div>
				    </div>
				    <div class="panel-body">
						<form class="form-horizontal" role="form" action="/user/add" id="editfrom" method="post">
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">昵称</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="inputEmail3" name="nickname" placeholder="请输入昵称">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="请输入密码">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword4" class="col-sm-2 control-label">邮箱</label>
								  <div class="col-sm-10">
									  <input type="text" class="form-control" id="inputPassword4" name="email" placeholder="请输入邮箱">
								  </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword5" class="col-sm-2 control-label">电话号码</label>
								  <div class="col-sm-10">
									  <input type="text" class="form-control" id="inputPassword5" name="phone_number" placeholder="请输入电话号码">
								  </div>
							  </div>
							<div class="form-group">
								<label for="inputPassword6" class="col-sm-2 control-label">头像</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPassword6" name="portrait" placeholder="请上传头像">
								</div>
							</div>
							  <div class="form-group" style="text-align: center">
								<button class="btn btn-default" type="submit">提交</button>
								<button class="btn btn-default" type="reset">重置</button>
							  </div>
						</form>
				    </div>
				    
				</div>

			</div>
		</div>
	</div>
	<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	</div>
</body>
	<script type="text/javascript">
		$("#nav li:nth-child(2)").addClass("active")
	</script>
</html>