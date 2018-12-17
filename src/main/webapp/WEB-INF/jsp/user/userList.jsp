<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>用户信息显示</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

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
					    	<h1 class="col-md-5">用户名单管理</h1>
							<%--搜索功能未实现--%>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="" id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入姓名" name="findByName">
									<span class="input-group-addon btn" id="sub">搜索</span>
								</div>
							</form>
							<button class="btn btn-default col-md-2" style="margin-top: 20px" onClick="location.href='/user/add'">
								添加用户信息
								<sapn class="glyphicon glyphicon-plus"/>
							</button>

						</div>
				    </div>
				    <table class="table table-bordered">
					        <thead>
					            <tr>
					                <th>Id</th>
				  					<th>昵称</th>
				  					<th>email</th>
				  					<th>手机号</th>
				  					<th>头像</th>
				  					<th>状态</th>
				  					<th>创建时间</th>
					            </tr>
					        </thead>
					        <tbody>
							<c:forEach  items="${list}" var="item">
								<tr>
									<td>${item.id}</td>
									<td>${item.nickname}</td>
									<td>${item.email}</td>
									<td>${item.phone_number}</td>
									<td><img src="${item.portrait}" width="250" height="150" /></td>
									<td>${item.status}</td>
									<td><fmt:formatDate value="${item.created}" pattern="yyyy-MM-dd HH-mm-ss"/></td>
									<td>
										<button class="btn btn-default btn-xs btn-info" onClick="location.href='/user/${item.id}/edit'">修改</button>
										<button class="btn btn-default btn-xs btn-danger btn-primary" onClick="location.href='/user/${item.id}/delete'">删除</button>
										<!--弹出框-->
									</td>
								</tr>
							</c:forEach>
					        </tbody>
				    </table>
				    <div class="panel-footer">
						<c:if test="${pageVo.pageCount != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a href="/user/list?current=${pageVo.current-1}">上一页</a></li>
									<c:if test="${pageVo.current-2 >= 1}">
										<li><a href="/user/list?current=${pageVo.current-2}">${pageVo.current-2}</a></li>
									</c:if>
									<c:if test="${pageVo.current-1 >= 1}">
										<li><a href="/user/list?current=${pageVo.current-1}">${pageVo.current-1}</a></li>
									</c:if>
									<li class="active"><a href="">${pageVo.current}</a></li>
									<c:if test="${pageVo.current+1 <= pageVo.pageCount}">
										<li><a href="/user/list?current=${pageVo.current+1}">${pageVo.current+1}</a></li>
									</c:if>
									<c:if test="${pageVo.current+2 <= pageVo.pageCount}">
										<li><a href="/user/list?current=${pageVo.current+2}">${pageVo.current+2}</a></li>
									</c:if>
									<c:if test="${pageVo.current+3 <= pageVo.pageCount}">
										<li><a href="/user/list?current=${pageVo.current+3}">${pageVo.current+3}</a></li>
									</c:if>
									<c:if test="${pageVo.current+4 <= pageVo.pageCount}">
										<li><a href="/user/list?current=${pageVo.current+4}">${pageVo.current+4}</a></li>
									</c:if>
									<li><a href="/user/list?current=${pageVo.current+1}">下一页</a></li>
								</ul>
							</nav>
						</c:if>
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
		$("#nav li:nth-child(2)").addClass("active");

        function confirmd() {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        };

        $("#sub").click(function () {
            $("#form1").submit();
        });

        <c:if test="${pageVo != null}">
			if (${pageVo.current} == ${pageVo.pageCount}) {
				$(".pagination li:last-child").addClass("disabled")
			};

			if (${pageVo.current} == ${1}) {
				$(".pagination li:nth-child(1)").addClass("disabled")
			};
        </c:if>
	</script>
</html>