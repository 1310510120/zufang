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
							<button class="btn btn-default col-md-2" style="margin-top: 20px" onClick="location.href='/content/houseContent'">
								添加广告位
								<sapn class="glyphicon glyphicon-plus"/>
							</button>
						</div>
				    </div>
				    <table class="table table-bordered">
					        <thead>
					            <tr>
					                <th>Id</th>
				  					<th>类别</th>
				  					<th>houseId</th>
				  					<th>压缩图片</th>
				  					<th>高清图片</th>
				  					<th>标题</th>
				  					<th>价格</th>
					            </tr>
					        </thead>
					        <tbody>
							<c:forEach  items="${list}" var="item">
								<tr>
									<td>${item.id}</td>
									<td>${item.content_cat}</td>
									<td>${item.house_id}</td>
									<td>${item.small_pic}</td>
									<td><img src="${item.big_pic}" width="250" height="150" /></td>
									<td>${item.headline}</td>
									<td>${item.price}</td>
									<td>
										<button class="btn btn-default btn-xs btn-info" onClick="setmo(${item.id})">修改</button>
										<button class="btn btn-default btn-xs btn-danger btn-primary" onClick="location.href='/content/deleteContent/${item.id}/'">删除</button>
										<!--弹出框-->
									</td>
								</tr>
							</c:forEach>
					        </tbody>
				    </table>
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