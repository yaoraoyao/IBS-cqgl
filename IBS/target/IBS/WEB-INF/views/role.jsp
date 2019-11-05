<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <%@include file="common.jsp" %>
    <script type="text/javascript" src="/js/role.js"></script>
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
        <input type="text" class="in searchIn" name="name" placeholder="按名称搜索"/>
        <a data-method="search" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索</a>
        <a data-method="searchAll" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索全部</a>
    </form>
</div>
<div id="win" class="easyui-window" title="新增/编辑角色信息" style="width:800px;height:450px;padding:20px;"
     data-options="iconCls:'icon-save',modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,resizable:false">
    <form id="ffff">
        <input type="hidden" id="roleid" name="id" />
        <div style="width: 200px;float: left;">
            <input type="text" name="name" class="easyui-validatebox in" id="name" data-options="" placeholder="角色名称" />
        </div>
        <div style="width: 200px;float: left;margin-left: 20px;">
            <input type="text" name="sn" class="easyui-validatebox in" id="sn" data-options="" placeholder="角色编码" />
        </div>
    </form>
    <div style="clear: both;width: 100%;height: 5px;"></div>
    <div class="easyui-layout" style="width: 100%;height: 300px;">
        <div data-options="region:'west',title:'当前角色已有的权限',collapsible:false" style="width:50%;">
            <table id="myPermissions"></table>
        </div>
        <div data-options="region:'center',title:'所有权限'" style="width:50%;">
            <table id="allPermissions"></table>
        </div>
    </div>
    <div style="text-align: center;margin-top: 10px;">
        <button type="button" class="easyui-linkbutton" data-method="cancel" data-options="iconCls:'icon-undo'">取消</button>
        <button type="button" class="easyui-linkbutton" data-method="submit" data-options="iconCls:'icon-redo'">确定</button>
    </div>
</div>
</body>
</html>