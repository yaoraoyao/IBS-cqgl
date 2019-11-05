<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <%@include file="common.jsp" %>
    <script type="text/javascript" src="/plugin/datagrid-groupview.js"></script>
    <script type="text/javascript" src="/js/purchasebillitem.js"></script>
    <script type="text/javascript" src="/plugin/Highcharts-6.2.0/code/highcharts.js"></script>
    <script type="text/javascript" src="/plugin/Highcharts-6.2.0/code/highcharts-3d.js"></script>
    <script type="text/javascript" src="/plugin/Highcharts-6.2.0/code/modules/exporting.js"></script>
    <script type="text/javascript" src="/plugin/Highcharts-6.2.0/code/modules/export-data.js"></script>
    <style type="text/css">
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
<%--<table id="purchaseBillItemGrid"></table>--%>
<table id="dg"></table>
<div id="toolbar" >
    <form id="searchForm">
        <input type="text" name="beginDate" class="in in-search easyui-datebox"
               data-options="prompt:'采购开始日期',editable:false"/>
        <input type="text" name="endDate" class="in in-search easyui-datebox"
               data-options="prompt:'采购结束日期',editable:false"/>
        <input type="text" name="supplierId" class="easyui-combobox in" id="supplierId"
               data-options="editable:false,prompt:'请选择供应商',panelHeight:'auto',
                            url:'/supplier/findAll',valueField:'id',textField:'name'"/>
        <input type="text" name="buyerId" class="easyui-combobox in" id="buyerId"
               data-options="editable:false,prompt:'请选择采购员',
                            url:'/employee/findAllBuyer',valueField:'id',textField:'userName'"/>
        <select name="status" class="in in-search easyui-combobox" data-options="editable:false">
            <option value="">请选择状态</option>
            <option value="0">待审</option>
            <option value="1">已审</option>
            <option value="-1">作废</option>
        </select>
        <select name="groupBy" class="in in-search easyui-combobox" data-options="editable:false">
            <option value="o.bill.supplier.name">按供应商分组</option>
            <option value="o.bill.buyer.userName">按采购员分组</option>
            <option value="o.product.types.name">按商品类型分组</option>
            <option value="DATE_FORMAT(o.bill.vdate, '%Y年%m月')">按月份分组</option>
        </select>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-method="search"
           data-options="iconCls:'icon-search',plain:true">搜索</a>
        <a data-method="searchAll" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="iconCls:'icon-search',plain:true">搜索全部</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-method="charts_3d"
           data-options="iconCls:'icon-large-chart',plain:true">饼状图</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-method="charts_3d_column"
           data-options="iconCls:'icon-large-shapes',plain:true">柱状图</a>
    </form>
</div>
<div id="container" class="easyui-dialog" title="采购报表-饼图" style="width:600px;height:400px;"
     data-options="resizable:false,modal:true,closed:true">
</div>
<div id="container2" class="easyui-dialog" title="采购报表-柱状图" style="width:600px;height:400px;"
     data-options="resizable:false,modal:true,closed:true">
</div>
</body>
</body>
</html>