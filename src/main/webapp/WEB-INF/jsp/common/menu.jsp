<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--需要一个ajax，在点击左侧菜单，左侧菜单不需要刷新--%>
<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="/user/list/">用户管理<span class="badge pull-right">59</span></a></li>

        <li>
        <a href="#systemSetting1" class="nav-header collapsed" data-toggle="collapse">
            代理管理
            <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
        </a>
        <ul id="systemSetting1" class="nav nav-list collapse secondmenu" style="height: 0px;">
            <li class="active"><a href="/agent/checklist"><i class="glyphicon glyphicon-user"></i>&nbsp;代理审核</a></li>
            <li><a href="/agent/passlist"><i class="glyphicon glyphicon-th-list"></i>&nbsp;代理列表</a></li>
        </ul>
        </li>

        <li>
            <a href="#systemSetting2" class="nav-header collapsed" data-toggle="collapse">
                出租屋管理
                <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
            </a>
            <ul id="systemSetting2" class="nav nav-list collapse secondmenu" style="height: 0px;">
                <li class="active"><a href="/house/checklist"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;出租屋审核</a></li>
                <li><a href="/house/passlist"><i class="glyphicon glyphicon-th-list"></i>&nbsp;出租屋列表</a></li>
            </ul>
        </li>
        <li><a href="/admin/userPasswordRest">小区管理<sapn class="glyphicon pull-right" /></a></li>
        <li><a href="/admin/userPasswordRest">首页内容管理<sapn class="glyphicon pull-right" /></a></li>
        <li><a href="/admin/passwordRest">修改密码<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="/logout">退出系统<sapn class="glyphicon glyphicon-log-out pull-right" /></a></li>
        <li class="disabled"><a href="##">Responsive</a></li>
    </ul>
</div>

<style type="text/css">

    .secondmenu a {
        font-size: 12px;
        color: #4A515B;

    }

    .secondmenu li.active {

        border-color: #428bca;
    }
</style>