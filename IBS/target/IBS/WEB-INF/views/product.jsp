<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品列表</title>
    <%@include file="common.jsp" %>
    <script type="text/javascript" src="/js/product.js"></script>
    <script type="text/javascript" src="/plugin/jeasyui.extensions.base.tooltip.js"></script>
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
        <input type="text" class="in searchIn" name="name" placeholder="按名称模糊查询"/>
        <a data-method="search" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索</a>
        <a data-method="searchAll" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索全部</a>
    </form>
</div>
<div id="win" class="easyui-window" title="新增/编辑商品信息" style="width:300px;height:385px;"
     data-options="iconCls:'icon-save',modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,resizable:false">
    <form id="ffff">
        <br/><br/>
        <input type="hidden" name="id" id="productid">
        <div>
            <input class="in" type="text" name="name" placeholder="名称"/>
        </div>
        <div>
            <input class="in" type="color" name="color" placeholder="颜色"/>
        </div>
        <div>
            <input class="in easyui-filebox" name="imageFile" id="imageFile" data-options="prompt:'图片'"/>
            <input type="hidden" id="hiddenPic" name="pic"/>
        </div>
        <div>
            <input class="in" type="text" name="costprice" placeholder="成本价"/>
        </div>
        <div>
            <input class="in" type="text" name="saleprice" placeholder="销售价"/>
        </div>
        <div>
            <input type="text" name="types.id" class="easyui-combobox in" id="types_id"
                   data-options="url:'/productType/child',valueField:'id',textField:'name',
                   editable:false,prompt:'请选择商品类型',panelHeight:'auto'" />
        </div>
        <div>
            <input type="text" name="unit.id" class="easyui-combobox in" id="unit_id"
                   data-options="url:'/systemDictionaryDetail/loadAllUnits',valueField:'id',textField:'name',
                   editable:false,prompt:'请选择数量单位',panelHeight:'auto'" />
        </div>
        <div>
            <input type="text" name="brand.id" class="easyui-combobox in" id="brand_id"
                   data-options="url:'/systemDictionaryDetail/loadAllBrands',valueField:'id',textField:'name',
                   editable:false,prompt:'请选择商品品牌',panelHeight:'auto'" />
        </div>
        <div style="text-align: right;box-sizing: border-box;padding-right: 38px;">
            <a data-method="cancel" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="iconCls:'icon-undo'">取消</a>
            <a data-method="submit" href="javascript:void(0);" class="easyui-linkbutton"
               data-options="iconCls:'icon-redo'">提交</a>
        </div>
    </form>
</div>
</body>
</html>