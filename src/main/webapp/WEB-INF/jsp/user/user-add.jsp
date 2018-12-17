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
						<form class="form-horizontal" role="form" action="/user/add" id="editfrom" method="post" enctype="multipart/form-data">
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
								<label for="logoFile" class="col-sm-2 control-label">头像</label>
								<div class="col-sm-10">
										<input type="file" name="logoFile" id="logoFile" onchange="setImg(this);">
										<%--显示图片--%>
										<span><img id="photourlShow2" src="" width="300" height="197"/></span>
								</div>
							</div>
							<%--将图片地址存在这里作为表单上传--%>
							<input type="hidden" name="portrait"  id="photoUrl" value=""/>
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
	<%--上传头像模态框--%>


	<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	</div>
</body>
	<script type="text/javascript">
		$("#nav li:nth-child(2)").addClass("active")

        //用于进行图片上传，返回地址
        function setImg(obj){
            var f=$(obj).val();
            alert(f);
            console.log(obj);
            if(f == null || f ==undefined || f == ''){
                return false;
            }
            if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
            {
                alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
                $(obj).val('');
                return false;
            }
            var data = new FormData();
            console.log(data);
            $.each($(obj)[0].files,function(i,file){
                data.append('file', file);
            });
            console.log(data);
            $.ajax({
                type: "POST",
                url: "/picture/upload",
                data: data,
                cache: false,
                contentType: false,    //不可缺
                processData: false,    //不可缺
                dataType:"json",
                success: function(ret) {
                    console.log(ret);
                    if(ret.code==0){
                        $("#photoUrl").val(ret.url);//将地址存储好
                        $("#photourlShow2").attr("src",ret.url);//显示图片
                    }else{
                        alertError(ret.message);
                        $("#url").val("");
                        $(obj).val('');
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("上传失败，请检查网络后重试");
                }
            });
        }

	</script>
</html>