<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>出租房列表</title>

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
						<h1 class="col-md-5">代理名单管理</h1>
						<%--搜索功能未实现--%>
						<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="" id="form1" method="post">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="请输入姓名" name="findByName">
								<span class="input-group-addon btn" id="sub">搜索</span>
							</div>
						</form>

					</div>
				</div>
				<table class="table table-bordered">
					<thead>
					<tr>
						<th>id</th>
						<th>房屋标题</th>
						<th>房屋卖点</th>
						<th>价格</th>
						<th>位置</th>
						<th>发布时间</th>
						<th>面积</th>
						<th>类别id</th>
						<th>房屋层次</th>
						<th>小区id</th>
						<th>地铁名</th>
						<th>方向</th>
						<th>楼号</th>
						<th>单元号</th>
						<th>门牌号</th>
						<th>代理人id</th>
						<th>图片1</th>
						<th>图片2</th>
						<th>图片3</th>
						<th>图片4</th>
						<th>图片5</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach  items="${list}" var="item">
						<tr>
							<td>${item.id}</td>
							<td>${item.headline}</td>
							<td>${item.sell_point}</td>
							<td>${item.price}</td>
							<td>${item.location}</td>
							<td><fmt:formatDate value="${item.created}" pattern="yyyy-MM-dd HH-mm-ss"/></td>
							<td>${item.area}</td>
							<td>${item.cid}</td>
							<td>${item.storey_height}</td>
							<td>${item.villageid}</td>
							<td>${item.subway_name}</td>
							<td>${item.direction}</td>
							<td>${item.block_number}</td>
							<td>${item.unit_number}</td>
							<td>${item.house_number}</td>
							<td>${item.aid}</td>
							<td>${item.image_1}</td>
							<td>${item.image_2}</td>
							<td>${item.image_3}</td>
							<td>${item.image_4}</td>
							<td>${item.image_5}</td>
							<td>
								<button class="btn btn-default btn-xs btn-info" onClick="location.href='/house/${item.id}/pass'">通过</button>
								<button class="btn btn-default btn-xs btn-danger btn-primary" onClick="location.href='/house/${item.id}/rejectpass'">拒绝</button>
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
								<li><a href="/agent/passlist?current=${pageVo.current-1}">上一页</a></li>
								<c:if test="${pageVo.current-2 >= 1}">
									<li><a href="/agent/passlist?current=${pageVo.current-2}">${pageVo.current-2}</a></li>
								</c:if>
								<c:if test="${pageVo.current-1 >= 1}">
									<li><a href="/agent/passlist?current=${pageVo.current-1}">${pageVo.current-1}</a></li>
								</c:if>
								<li class="active"><a href="">${pageVo.current}</a></li>
								<c:if test="${pageVo.current+1 <= pageVo.pageCount}">
									<li><a href="/agent/passlist?current=${pageVo.current+1}">${pageVo.current+1}</a></li>
								</c:if>
								<c:if test="${pageVo.current+2 <= pageVo.pageCount}">
									<li><a href="/agent/passlist?current=${pageVo.current+2}">${pageVo.current+2}</a></li>
								</c:if>
								<c:if test="${pageVo.current+3 <= pageVo.pageCount}">
									<li><a href="/agent/passlist?current=${pageVo.current+3}">${pageVo.current+3}</a></li>
								</c:if>
								<c:if test="${pageVo.current+4 <= pageVo.pageCount}">
									<li><a href="/agent/passlistlist?current=${pageVo.current+4}">${pageVo.current+4}</a></li>
								</c:if>
								<li><a href="/agent/passlistlist?current=${pageVo.current+1}">下一页</a></li>
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