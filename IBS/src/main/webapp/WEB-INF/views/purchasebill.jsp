<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <%@include file="common.jsp" %>
    <script type="text/javascript" src="/js/purchasebill.js"></script>
    <script src="/plugin/jeasyui.extensions.datagrid.getColumnInfo.js"></script>
    <script src="/plugin/jeasyui.extensions.datagrid.editors.js"></script>
    <script src="/plugin/jeasyui.extensions.datagrid.edit.cellEdit.js"></script>
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
        <a data-method="add" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true">新增</a>
        <a data-method="edit" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit',plain:true">编辑</a>
        <a data-method="remove" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-remove',plain:true">删除</a>
        <input type="hidden" name="pageNo" id="pageNo" value="1">
        <input type="hidden" name="pageSize" id="pageSize" value="10">
        采购日期：
        <input type="text" name="beginDate" class="in in-search easyui-datebox"
               data-options="editable:false,prompt:'开始日期'"/>
        -
        <input type="text" name="endDate" class="in in-search easyui-datebox"
               data-options="editable:false,prompt:'结束日期'"/>
        状态：
        <select class="easyui-combobox" name="status" data-options="panelHeight:'auto',editable:false">
            <option value="">--请选择--</option>
            <option value="0">待审</option>
            <option value="-1">作废</option>
            <option value="1">已审</option>
        </select>
        <a data-method="search" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索</a>
        <a data-method="searchAll" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索全部</a>
    </form>
</div>
<div id="win" class="easyui-window" title="新增/编辑采购单" style="width:800px;height:450px;padding:20px;"
     data-options="iconCls:'icon-user-add',modal:true,closed:true,height:'auto'">
    <form id="ffff">
        <input type="hidden" id="purchasebillid" name="id"/>
        <div>
            <input type="text" name="vdate" class="easyui-datebox in" id="vdate"
                   data-options="required:true,editable:false,prompt:'采购日期'"/>
        </div>
        <div>
            <input type="text" name="supplier.id" class="easyui-combobox in" id="supplierId"
                   data-options="required:true,editable:false,prompt:'请选择供应商',panelHeight:'auto',
                            url:'/supplier/findAll',valueField:'id',textField:'name'"/>
        </div>
        <div>
            <input type="text" name="buyer.id" class="easyui-combobox in" id="buyerId"
                   data-options="required:true,editable:false,prompt:'请选择采购员',
                            url:'/employee/findAllBuyer',valueField:'id',textField:'userName'"/></div>
    </form>
    <div style="clear: both;height: 5px;"></div>
    <table id="billItems"></table>
    <div id="billItems-tb">
        <a href="javascript:void(0);" id="btnInsert" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true">添加</a>
        <a href="javascript:void(0);" id="btnRemove" class="easyui-linkbutton"
           data-options="iconCls:'icon-remove',plain:true">删除</a>
        <a href="javascript:void(0);" id="btnAudite" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">审核</a>
    </div>
    <div style="text-align: center;margin-top: 10px;">
        <button type="button" class="easyui-linkbutton" data-method="cancel" data-options="iconCls:'icon-undo'">取消
        </button>
        <button type="button" class="easyui-linkbutton" data-method="submit" data-options="iconCls:'icon-redo'">确定
        </button>
    </div>
</div>
</body>
</html>