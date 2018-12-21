<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>首页内容管理</title>

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
					    	<h1 class="col-md-5">首页内容管理</h1>
							<%--搜索功能未实现--%>
							<%--<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="" id="form1" method="post">--%>
								<%--<div class="input-group">--%>
									<%--<input type="text" class="form-control" placeholder="请输入姓名" name="findByName">--%>
									<%--<span class="input-group-addon btn" id="sub">搜索</span>--%>
								<%--</div>--%>
							<%--</form>--%>
							<c:forEach  items="${catCount_list}" var="catCount">
								${catCount.content_cat}，
								${catCount.content_cat_count}个，
								<br/>
							</c:forEach>
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
									<th>代理人id</th>
									<th>主图片</th>
									<th>出租方式</th>
									<th>推送内容</th>
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
									<td>${item.village_name}</td>
									<td>${item.subway_name}</td>
									<td>${item.direction}</td>
									<td>${item.aid}</td>
									<td><img src="${item.image_1 }" width="50" height="50"></td>
									<td>${item.rent_way}</td>
									<td>${item.content_cat}</td>
									<td>
										<button class="btn btn-default btn-xs btn-info" onClick="setmo(${item.id})">推到首页</button>
										<button class="btn btn-default btn-xs btn-danger btn-primary" onClick="location.href='/content/deleteContent/${item.id}/'">取消推送</button>
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
									<li><a href="/content/houseContent?current=${pageVo.current-1}">上一页</a></li>
									<c:if test="${pageVo.current-2 >= 1}">
										<li><a href="/content/houseContent?current=${pageVo.current-2}">${pageVo.current-2}</a></li>
									</c:if>
									<c:if test="${pageVo.current-1 >= 1}">
										<li><a href="/content/houseContent?current=${pageVo.current-1}">${pageVo.current-1}</a></li>
									</c:if>
									<li class="active"><a href="">${pageVo.current}</a></li>
									<c:if test="${pageVo.current+1 <= pageVo.pageCount}">
										<li><a href="/content/houseContent?current=${pageVo.current+1}">${pageVo.current+1}</a></li>
									</c:if>
									<c:if test="${pageVo.current+2 <= pageVo.pageCount}">
										<li><a href="/content/houseContent?current=${pageVo.current+2}">${pageVo.current+2}</a></li>
									</c:if>
									<c:if test="${pageVo.current+3 <= pageVo.pageCount}">
										<li><a href="/content/houseContent?current=${pageVo.current+3}">${pageVo.current+3}</a></li>
									</c:if>
									<c:if test="${pageVo.current+4 <= pageVo.pageCount}">
										<li><a href="/content/houseContent?current=${pageVo.current+4}">${pageVo.current+4}</a></li>
									</c:if>
									<li><a href="/content/houseContent?current=${pageVo.current+1}">下一页</a></li>
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
	<%--模态框--%>
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">推送信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addcontent">
						<div class="form-group">
							<input type="hidden" id="inputid" class="form-control" name="id">
						</div>
						<div class="form-group">
							<label for="house_id" class="col-sm-2 control-label">house_id</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="house_id" name="house_id">
							</div>
						</div>
						<div class="form-group">
							<label for="content_cat" class="col-sm-2 control-label">广告类别</label>
							<div class="col-sm-10">
								<%--多选框--%>
								<select id="content_cat" name="content_cat">
									<option value="二手房广告" type="text">二手房广告</option>
									<option value="出租房广告" type="text">出租房广告</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="headline" class="col-sm-2 control-label">标题</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="headline" name="headline">
							</div>
						</div>
						<div class="form-group">
							<label for="price" class="col-sm-2 control-label">价格</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="price" name="price">
							</div>
						</div>
						<div class="form-group">
							<label for="big_pic" class="col-sm-2 control-label">高清图片</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="big_pic" name="big_pic">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onClick="submitfrom()">保存</button>
						</div>
					</form>
				</div>

			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

</body>
	<script type="text/javascript">
		function setmo(houseId){
            $.ajax({
                type:"get",
                url:"/content/houseContent/"+houseId,
                success:function(res) {
                    console.log(res)
                    var str = ""
                    if (res.code == 250) {
                        alert(res.msg);
                    } else {
                        $("#house_id").val(res.data.house_id);
                        $("#headline").val(res.data.headline);
                        $("#price").val(res.data.price);
                        $("#id").val(res.data.id);
                        $('#myModal').modal('show');
                        var num = res.data.content_cat   //获取input中输入的数字
                        var numbers = $("#content_cat").find("option"); //获取select下拉框的所有值
                        for (var j = 1; j < numbers.length; j++) {
                            if ($(numbers[j]).val() == num) {
                                $(numbers[j]).attr("selected", "selected");
                            }
                        }
                    }
                }
        })
		}

		function submitfrom(){
            $.ajax({
                type:"post",
                url:"/content/UpdateContent",
				data: $('#addcontent').serialize(),
                success:function(res) {
                    if(res.code=200){
                        alert("成功");
					}else {
                        alert("失败");
					}
            }
		})}

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