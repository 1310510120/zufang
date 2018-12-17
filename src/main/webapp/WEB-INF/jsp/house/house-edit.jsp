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
					    	<h1 style="text-align: center;">修改房屋信息</h1>
						</div>
				    </div>
				    <div class="panel-body">
						<form class="form-horizontal" role="form" action="/house/update" id="editfrom" method="post">
								<%--隐藏id--%>
							<input type="hidden" id="inputid" class="form-control" name="id" value="${house.id}">
							<%--图片1--%>
							<div class="form-group">
								<label for="logoFile1" class="col-sm-2 control-label">图片1</label>
								<div class="col-sm-10">
									<input type="file" name="logoFile" id="logoFile1" onchange="setImg(this,1);">
									<%--显示图片--%>
									<span><img id="photourlShow1" src="${house.image_1}" width="150" height="150"/></span>
								</div>
							</div>
							<%--将图片地址存在这里作为表单上传--%>
							<input type="hidden" name="image_1"  id="photoUrl_1" value=""/>
							<%--图片二--%>
							<div class="form-group">
								<label for="logoFile2" class="col-sm-2 control-label">图片2</label>
								<div class="col-sm-10">
									<input type="file" name="logoFile" id="logoFile2" onchange="setImg(this,2);">
									<%--显示图片--%>
									<span><img id="photourlShow2" src="${house.image_2}" width="150" height="150"/></span>
								</div>
							</div>
							<%--将图片地址存在这里作为表单上传--%>
							<input type="hidden" name="image_2"  id="photoUrl_2" value=""/>
							<%--图片3--%>
							<div class="form-group">
								<label for="logoFile3" class="col-sm-2 control-label">图片3</label>
								<div class="col-sm-10">
									<input type="file" name="logoFile" id="logoFile3" onchange="setImg(this,3);">
									<%--显示图片--%>
									<span><img id="photourlShow3" src="${house.image_3}" width="150" height="150"/></span>
								</div>
							</div>
							<%--将图片地址存在这里作为表单上传--%>
							<input type="hidden" name="image_3"  id="photoUrl_3" value=""/>
							<%--图片四--%>
							<div class="form-group">
								<label for="logoFile4" class="col-sm-2 control-label">图片4</label>
								<div class="col-sm-10">
									<input type="file" name="logoFile" id="logoFile4" onchange="setImg(this,4);">
									<%--显示图片--%>
									<span><img id="photourlShow4" src="${house.image_4}" width="150" height="150"/></span>
								</div>
							</div>
							<%--将图片地址存在这里作为表单上传--%>
							<input type="hidden" name="image_4"  id="photoUrl_4" value=""/>
							<%--图片5--%>
							<div class="form-group">
								<label for="logoFile5" class="col-sm-2 control-label">图片5</label>
								<div class="col-sm-10">
									<input type="file" name="logoFile" id="logoFile5" onchange="setImg(this,5);">
									<%--显示图片--%>
									<span><img id="photourlShow5" src="${house.image_5}" width="150" height="150"/></span>
								</div>
							</div>
							<%--将图片地址存在这里作为表单上传--%>
							<input type="hidden" name="image_5"  id="photoUrl_5" value=""/>

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

        function setImg(obj,img){
            var f=$(obj).val();
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
                        $("#photoUrl_"+img).val(ret.url);//将地址存储好
                        $("#photourlShow"+img).attr("src",ret.url);//显示图片
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