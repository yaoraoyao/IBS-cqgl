<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <%@include file="common.jsp" %>
    <!-- datagrid-隐藏列菜单的支持 -->
    <script src="http://www.easyui-extlib.com/Scripts/jquery-extensions/jquery.jdirk.js"></script>
    <link href="http://www.easyui-extlib.com/Content/Site.css" rel="stylesheet"/>
    <link href="http://www.easyui-extlib.com/Content/icons/icon-standard.css" rel="stylesheet"/>
    <link href="http://www.easyui-extlib.com/Scripts/jquery-easyui-extensions/datagrid/jeasyui.extensions.datagrid.css"
          rel="stylesheet"/>
    <script src="http://www.easyui-extlib.com/Scripts/jquery-easyui-extensions/menu/jeasyui.extensions.menu.js"></script>
    <script src="http://www.easyui-extlib.com//Scripts/jquery-easyui-extensions/datagrid/jeasyui.extensions.datagrid.getColumnInfo.js"></script>
    <script src="http://www.easyui-extlib.com/Scripts/jquery-easyui-extensions/datagrid/jeasyui.extensions.datagrid.columnToggle.js"></script>
    <script type="text/javascript" src="/js/employee.js"></script>
    <style type="text/css">
        #ffff > div {
            width: 100%;
            height: 40px;
            text-align: center;
        }

        #ffff > div:first-child {
            margin-top: 20px;
        }

        .in {
            width: 200px;
            height: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .in:focus {
            border: 1px solid #66AFE9;
            box-shadow: 0px 0px 10px 1px #66AFE9;
        }

        .searchIn {
            width: 100px;
        }
    </style>

</head>
<body>
<table id="dg"></table>
<div id="toolbar">
    <form id="searchForm">
        <input type="hidden" name="pageNo" id="pageNo">
        <input type="hidden" name="pageSize" id="pageSize">
        <a data-method="add" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true">新增</a>
        <a data-method="edit" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit',plain:true">编辑</a>
        <a data-method="remove" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-remove',plain:true">删除</a>
        <input type="text" class="in searchIn" name="userName" placeholder="按用户名模糊查询"/>
        <input type="text" class="in searchIn" name="email" placeholder="按邮箱模糊查询"/>
        <input type="text" class="in searchIn" name="age1" placeholder="按年龄范围查询"/>
        <input type="text" class="in searchIn" name="age2" placeholder="按年龄范围查询"/>
        <select id="department_id" class="easyui-combobox in" name="departmentId" style="width:100px;"
                data-options="url:'/department/list',valueField:'id',textField:'name',value:'-1',editable:false"></select>
        <a data-method="search" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索</a>
        <a data-method="searchAll" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索全部</a>
        <a href="/employee/export" class="easyui-linkbutton" data-options="iconCls:'icon-ibs-export',plain:true">导出</a>
    </form>
</div>
<div id="win" class="easyui-window" title="新增/编辑员工信息" style="width:300px;height:385px;"
     data-options="iconCls:'icon-save',modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,resizable:false">
    <form id="ffff">
        <br/><br/>
        <input type="hidden" name="id" id="employeeid">
        <div>
            <input class="easyui-validatebox in" type="text" name="userName" placeholder="用户名"
                   data-options="required:true,validType:['username','checkUsername']"/>
        </div>
        <%--<div>--%>
            <%--<input class="easyui-validatebox in" type="text" name="password" placeholder="密码"--%>
                   <%--data-options="required:true,validType:'password3'"/>--%>
        <%--</div>--%>
        <div>
            <input class="easyui-validatebox in" type="text" name="age" placeholder="年龄"
                   data-options="required:true,validType:'integerRange[18,60]'"/>
        </div>
        <div>
            <input class="easyui-validatebox in" type="text" name="email" placeholder="邮箱"
                   data-options="validType:'email'"/>
        </div>
        <div>
            <input class="in easyui-filebox" name="imageFile" id="imageFile" data-options="prompt:'头像'"/>
            <input type="hidden" id="hiddenHeadImage" name="headImage"/>
        </div>
        <div>
            <select id="departmentId" class="easyui-combobox easyui-validatebox in" name="department.id" style="width:200px;"
                    data-options="required:true,url:'/department/list',valueField:'id',textField:'name',value:'-1',editable:false"></select>
        </div>
        <div style="text-align: right;box-sizing: border-box;padding-right: 38px;">
            <a data-method="cancel" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="iconCls:'icon-undo'">取消</a>
            <a data-method="submit" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="iconCls:'icon-redo'">提交</a>
        </div>
    </form>
</div>
<div id="gridMenu" class="easyui-menu" style="width:120px;">
    <div data-options="iconCls:'icon-add'" data-method="add">添加</div>
    <div data-options="iconCls:'icon-edit'" data-method="edit">修改</div>
    <div data-options="iconCls:'icon-remove'" data-method="remove">删除</div>
</div>

</body>
</html>
