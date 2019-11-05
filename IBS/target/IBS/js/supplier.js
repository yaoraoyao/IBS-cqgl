$(function () {
    $("#dg").datagrid({
        url: '/supplier/list',
        method: 'post',
        striped: true,
        rownumbers: true,
        pagination: true,
        toolbar: '#toolbar',
        queryParams: {},
        frozenColumns: [[{field: 'hhhhhh', checkbox: true, width: '5%'}]],
        columns: [[
            {field: 'id', title: 'id', width: '100', align: 'center', hidden: true},
            {field: 'name', title: '名称', width: '100', align: 'center'},
        ]]
    });
    $("#dg").datagrid("getPager").pagination({
        onSelectPage:function(pageNumber, pageSize){
            $("#dg").datagrid('loading');
            //往两个隐藏文本框中填值
            $("#pageNo").val(pageNumber);
            $("#pageSize").val(pageSize);
            //load方法传入一个json对象用来取代datagrid的queryParams属性，将其放入请求中作为请求参数传递到后端，每次翻页的请求地址不变
            $("#dg").datagrid('load', $("#searchForm").toJson());
            //修改一下分页工具栏中显示的当前页码
            $(this).pagination({
                pageNumber:pageNumber,
                pageSize:pageSize
            });
            $("#dg").datagrid('loaded');
        }
    });
});
window.methods = {
    add: function () {
        //重置一下表单
        $("#ffff").form("reset");
        //手动再清空一下employeeid
        $("#supplierid").val("");
        //弹出模态窗口
        $('#win').window('open');  // open a window
    },
    edit: function () {
        //重置一下表单
        $("#ffff").form("reset");
        $("#supplierid").val("");
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
        $.getJSON("/supplier/findOne", {id: row.id}, function (data) {
            //表单回填
            $("#ffff").form("load", data);
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
                $.getJSON("/supplier/delete", {ids: ids.join(",")}, function (data) {
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
                    }else {
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
        $.postJSON("/supplier/save", params, function (data) {
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
            }else {
                $.messager.alert('错误', data.msg, "error");
            }
        });
    },
    cancel: function () {
        $("#ffff").form("reset");
        $("#win").window("close");
    }
};