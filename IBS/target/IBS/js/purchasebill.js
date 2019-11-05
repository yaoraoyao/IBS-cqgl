$(function () {
    $("#dg").datagrid({
        url: '/purchasebill/list',
        method: 'post',
        striped: true,
        rownumbers: true,
        pagination: true,
        toolbar: '#toolbar',
        queryParams: $("#searchForm").toJson(),
        frozenColumns: [[{field: 'hhhhhh', checkbox: true, width: '5%'}]],
        columns: [[
            {field: 'id', title: 'id', width: '10%', align: 'center', hidden: true},
            {field: 'vdate', title: '采购日期', width: '10%', align: 'center'},
            {field: 'totalamount', title: '总金额', width: '10%', align: 'center'},
            {field: 'totalnum', title: '总数量', width: '10%', align: 'center'},
            {field: 'inputuser', title: '录入人', width: '10%', align: 'center', formatter: formatEmp, hidden: true},
            {field: 'inputtime', title: '录入时间', width: '10%', align: 'center', hidden: true},
            {field: 'auditor', title: '审核人', width: '10%', align: 'center', formatter: formatEmp},
            {field: 'auditortime', title: '审核时间', width: '10%', align: 'center'},
            {field: 'supplier', title: '供应商', width: '10%', align: 'center', formatter: formatObj},
            {field: 'buyer', title: '采购员', width: '10%', align: 'center', formatter: formatEmp},
            {field: 'status', title: '状态', width: '10%', align: 'center', formatter: formatStatus},
        ]]
    });
    $("#dg").datagrid("getPager").pagination({
        onSelectPage: function (pageNumber, pageSize) {
            $("#dg").datagrid('loading');
            //往两个隐藏文本框中填值
            $("#pageNo").val(pageNumber);
            $("#pageSize").val(pageSize);
            //load方法传入一个json对象用来取代datagrid的queryParams属性，将其放入请求中作为请求参数传递到后端，每次翻页的请求地址不变
            $("#dg").datagrid('load', $("#searchForm").toJson());
            //修改一下分页工具栏中显示的当前页码
            $(this).pagination({
                pageNumber: pageNumber,
                pageSize: pageSize
            });
            $("#dg").datagrid('loaded');
        }
    });

    //通过id获取到一个table标签用来生成datagrid
    var dg = $("#billItems"),
        //默认行【指定行内有哪些字段】
        defaultRow = {ID: "", product: "", productColor: "", productImage: "", price: 0, num: 1, amount: 0, descs: ""},
        //新增一行的时候，插入到哪里？bottom表示插入到最下边 top表示插入到最上边
        insertPosition = "bottom";
    //datagrid的初始化方法
    var dgInit = function () {
        //拿到columns属性的值【一个二维数组，里面设置的是那些field对象组成的数组】
        var getColumns = function () {
            var result = [];
            var normal = [
                {
                    field: 'product', title: '商品', width: 180,
                    editor: {
                        type: "combobox",
                        options: {
                            required: true,
                            url: '/product/findAll',
                            valueField: "id",
                            textField: "name",
                            editable: false,
                            promot: "请选择商品"
                        }
                    },
                    formatter: function (value, row, index) {
                        return value.name;
                    }
                },
                {
                    field: 'productColor', title: '颜色', width: 180, formatter: function (value, row, index) {
                        return row.product ? "<div style='width:20px;height:20px;background-color:" + row.product.color + ";'></div>" : "";
                    }
                },
                {
                    field: 'productImage', title: '图片', width: 100, formatter: function (value, row, index) {
                        return row.product ? "<img src='" + row.product.smallpic + "' alt='没有图片' style='height:30px;' />" : "";
                    }
                },
                {
                    field: 'price', title: '采购单价', width: 100,
                    editor: {
                        type: "numberbox",
                        options: {
                            precision: 2,
                            prefix: "￥",
                            required: true
                        }
                    }
                },
                {
                    field: 'num', title: '采购数量', width: 100,
                    editor: {
                        type: "numberbox",
                        options: {
                            required: true
                        }
                    }
                },
                {
                    field: 'amount', title: '小计金额', width: 100, formatter: function (value, row, index) {
                        return row.price && row.num ? "￥" + (row.price * row.num) : "￥0.00";
                    }
                }
                ,
                {
                    field: 'descs', title: '备注', width: 100,
                    editor: {
                        type: "textarea",
                        options: {
                            readonly: false
                        }
                    }
                }
            ];
            result.push(normal);
            return result;
        };
        //datagrid初始化的其他属性
        var options = {
            idField: "ID",
            title: '采购单明细',       //标题
            height: '300px',         //datagrid的高度
            rownumbers: true,       //是否显示行号
            toolbar: "#billItems-tb",//工具栏
            fitColumns: true,       //是否填充列
            border: true,           //是否显示边框
            singleSelect: true,     //是否只能单选
            columns: getColumns(),  //列属性
            enableCellEdit: true    //表示开启单元格编辑功能
        };
        dg.datagrid(options);
    };
    //获取到插入一行数据到datagrid中的行号【索引】
    var getInsertRowIndex = function () {
        return insertPosition == "top" ? 0 : dg.datagrid("getRows").length;
    }
    //给按钮绑定事件
    var buttonBindEvent = function () {
        $("#btnInsert").click(function () {
            var targetIndex = getInsertRowIndex(), targetRow = $.extend({}, defaultRow, {ID: $.util.guid()});
            dg.datagrid("insertRow", {index: targetIndex, row: targetRow});   //添加一行
            dg.datagrid("editCell", {index: targetIndex, field: "product"});  //开始编辑
        });
        $("#btnRemove").click(function () {
            //  获取选中的行
            var row = $("#billItems").datagrid("getSelected");
            //  通过行对象返回指定行的索引号
            var index = $("#billItems").datagrid("getRowIndex", row);
            //  通过行的索引删除行。
            $("#billItems").datagrid("deleteRow", index);
        });
        $("#btnAudite").click(function () {
            //获取到入库单id
            var id = $("#purchasebillid").val();
            $.postJSON("/purchasebill/audite",{id: id}, function (data) {
                if (data.status == 200) {
                    $.messager.alert('消息', data.msg, "info");
                    //关闭模态窗口
                    $('#win').window('close');  // close a window
                    //重新刷新表格的数据
                    $("#dg").datagrid('load', {
                        pageNo: 1,
                        pageSize: 10
                    });
                    $("#dg").datagrid("getPager").pagination({
                        pageNumber: 1,
                        pageSize: 10
                    });
                } else {
                    $.messager.alert('错误', data.msg, "error");
                }
            });
        });
    };
    //执行这2个方法，创建datagrid并且绑定事件
    dgInit();
    buttonBindEvent();
});
window.methods = {
    add: function () {
        //重置一下表单
        $("#ffff").form("reset");
        //手动再清空一下employeeid
        $("#purchasebillid").val("");
        //弹出模态窗口
        $('#win').window('open');  // open a window
    },
    edit: function () {
        //重置一下表单
        $("#ffff").form("reset");
        $("#purchasebillid").val("");
        //获取到datagrid内已经被选中的行
        var rows = $("#dg").datagrid("getSelections");
        if (rows.length == 0) {
            $.messager.alert('错误', "请选择你要编辑的员工！", "error");
            return;
        }
        if (rows.length > 1) {
            $.messager.alert('错误', "你只能选择一行进行修改！", "error");
            return;
        }
        var row = rows[0];
        $.getJSON("/purchasebill/findOne", {id: row.id}, function (data) {
            //表单回填
            $("#ffff").form("load", data);
            $("#supplierId").combobox("setValue",data.supplier.id);
            $("#buyerId").combobox("setValue",data.buyer.id);
            //回填一下采购单明细datagrid
            $("#billItems").datagrid("loadData", data.billItems);
            //弹出模态窗口
            $('#win').window('open');  // open a window
        });
    },
    remove: function () {
        //获取到datagrid内已经被选中的行
        var rows = $("#dg").datagrid("getSelections");
        if (rows.length == 0) {
            $.messager.alert('错误', "请选择你要删除的员工！", "error");
            return;
        }
        var ids = [];
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
        }
        //发送请求
        $.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
            if (r) {
                $.getJSON("/purchasebill/delete", {ids: ids.join(",")}, function (data) {
                    if (data.status == 200) {
                        $.messager.alert('消息', data.msg, "info");
                        //重新刷新表格的数据
                        $("#dg").datagrid('load', {
                            pageNo: 1,
                            pageSize: 10
                        });
                        $("#dg").datagrid("getPager").pagination({
                            pageNumber: 1,
                            pageSize: 10
                        });
                    } else {
                        $.messager.alert('错误', data.msg, "error");
                    }
                });
            }
        });
    },
    search: function () {
        $("#dg").datagrid('loading');
        //往两个隐藏文本框中填值
        $("#pageNo").val(1);
        $("#pageSize").val(10);
        //load方法传入一个json对象用来取代datagrid的queryParams属性，将其放入请求中作为请求参数传递到后端，每次翻页的请求地址不变
        $("#dg").datagrid('load', $("#searchForm").toJson());
        //修改一下分页工具栏中显示的当前页码
        $(this).pagination({
            pageNumber: 1,
            pageSize: 10
        });
        $("#dg").datagrid('loaded');
    },
    searchAll: function () {
        $("#searchForm").form("reset");
        this.search();
    },
    submit: function () {
        var params = $("#ffff").toJson();
        var rows = $("#billItems").datagrid("getRows");
        for(var i=0;i<rows.length;i++){
            params["billItems["+i+"].price"] = rows[i].price;
            params["billItems["+i+"].num"] = rows[i].num;
            params["billItems["+i+"].descs"] = rows[i].descs;
            params["billItems["+i+"].product.id"] = rows[i].product.id;
        }
        $.postJSON("/purchasebill/save", params, function (data) {
            if (data.status == 200) {
                $.messager.alert('消息', data.msg, "info");
                //关闭模态窗口
                $('#win').window('close');  // close a window
                //重新刷新表格的数据
                $("#dg").datagrid('load', {
                    pageNo: 1,
                    pageSize: 10
                });
                $("#dg").datagrid("getPager").pagination({
                    pageNumber: 1,
                    pageSize: 10
                });
            } else {
                $.messager.alert('错误', data.msg, "error");
            }
        });
    },
    cancel: function () {
        $("#ffff").form("reset");
        $("#win").window("close");
    }
};

function formatObj(value, row, index) {
    return value ? value.name : "";
}

function formatEmp(value, row, index) {
    return value ? value.userName : "";
}

function formatStatus(value, row, index) {
    if (value == 0) return "<b style='color: #ff7025;'>待审</b>";
    else if (value == 1) return "<b style='color: #11801c;'>已审</b>";
    else return "<b style='color: #80797e;'>作废</b>";
}