$(function () {
    $("#dg").datagrid({
        url: '/role/list',
        method: 'post',
        striped: true,
        rownumbers: true,
        pagination: true,
        toolbar: '#toolbar',
        queryParams: {},
        frozenColumns: [[{field: 'hhhhhh', checkbox: true, width: '5%'}]],
        columns: [[
            {field: 'id', title: '编号', width: '10%', align: 'center', hidden: true},
            {field: 'name', title: '角色名称', width: '10%', align: 'left'},
            {field: 'sn', title: '角色编码', width: '10%', align: 'left'},
            {
                field: 'permissions',
                title: '当前角色拥有的权限',
                width: '55%',
                align: 'left',
                formatter: function (value, row, index) {
                    if (!value || !value.length) return "";
                    var str = "";
                    for (var i = 0; i < value.length; i++) {
                        str += value[i].name + "&nbsp;&nbsp;"
                    }
                    return str;
                }
            },
            {
                field: 'employees',
                title: '当前角色拥有的用户',
                width: '20%',
                align: 'left',
                formatter: function (value, row, index) {
                    if (!value || !value.length) return "";
                    var str = "";
                    for (var i = 0; i < value.length; i++) {
                        str += value[i].userName + "&nbsp;&nbsp;"
                    }
                    return str;
                }
            },
        ]]
    });
    $("#dg").datagrid("getPager").pagination({
        onSelectPage: function (pageNumber, pageSize) {
            $("#dg").datagrid('loading');
            //将翻页功能与高级查询整合到一起
            $("#pageSize").val(pageSize);
            $("#pageNo").val(pageNumber);
            $("#dg").datagrid("load", $("#searchForm").toJSON());
            $(this).pagination({
                pageNumber: pageNumber,
                pageSize: pageSize
            });
            $("#dg").datagrid('loaded');
        }
    });
    $("#allPermissions").datagrid({
        url: '/permission/list',//[必写]
        method: 'post',//默认就是post
        striped: true,//斑马线效果
        rownumbers: true,//显示行号
        pagination: true,//显示分页工具栏
        fit: true,
        fitColumns: true,//自适应列宽度[如果列上面写width之后此属性无效]
        queryParams: {pageNo: 1, pageSize: 10},
        columns: [[
            {field: 'id', title: '编号', width: '10%', align: 'center', hidden: true},
            {field: 'name', title: '权限名称', width: '30%', align: 'left'},
            {field: 'sn', title: '权限编码', width: '35%', align: 'left'},
            {field: 'url', title: '资源路径', width: '35%', align: 'left'},
        ]],
        //index：点击的行的索引值，该索引值从0开始。  row：对应于点击行的记录。
        onDblClickRow: function (index, row) {
            var rows = $("#myPermissions").datagrid("getRows");
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].id == row.id) {
                    //左侧的datagrid已经包含了当前双击的行，给出一个提示
                    $.messager.show({
                        title: '提示',
                        msg: '<b style="color: red;">当前角色已有这个权限：' + rows[i].name + '</b>'
                    });
                    return;
                }
            }
            //将双击的这一行添加到左边那个datagrid中
            $("#myPermissions").datagrid("appendRow", row);
        }
    });
    $("#allPermissions").datagrid("getPager").pagination({
        onSelectPage: function (pageNumber, pageSize) {
            $("#allPermissions").datagrid('loading');
            $("#allPermissions").datagrid("load", {pageNo: pageNumber, pageSize: pageSize});
            $(this).pagination({
                pageNumber: pageNumber,
                pageSize: pageSize
            });
            $("#allPermissions").datagrid('loaded');
        }
    });
    $("#myPermissions").datagrid({
        method: 'post',//默认就是post
        striped: true,//斑马线效果
        rownumbers: true,//显示行号
        fit: true,
        fitColumns: true,//自适应列宽度[如果列上面写width之后此属性无效]
        columns: [[
            {field: 'id', title: '编号', width: '10%', align: 'center', hidden: true},
            {field: 'name', title: '权限名称', width: '30%', align: 'left'},
            {field: 'sn', title: '权限编码', width: '35%', align: 'left'},
            {field: 'url', title: '资源路径', width: '35%', align: 'left'},
        ]],
        //index：点击的行的索引值，该索引值从0开始。  row：对应于点击行的记录。
        onDblClickRow: function (index, row) {
            //将双击的这一行从左边那个datagrid中删除
            $("#myPermissions").datagrid("deleteRow", index);
        }
    });

});
window.methods = {
    add: function () {
        //重置一下表单
        $("#ffff").form("reset");
        //手动再清空一下employeeid
        $("#roleid").val("");
        //弹出模态窗口
        $("#myPermissions").datagrid("loadData", []);
        $('#win').window('open');  // open a window
    },
    edit: function () {
        //重置一下表单
        $("#ffff").form("reset");
        $("#roleid").val("");
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
        $.getJSON("/role/findOne", {id: row.id}, function (data) {
            //表单回填
            $("#ffff").form("load", data);
            $("#myPermissions").datagrid("loadData", data.permissions);
            //弹出模态窗口
            $('#win').window('open');  // open a window
        });
    },
    remove: function () {
        //获取到datagrid内已经被选中的行
        var rows = $("#dg").datagrid("getSelections");
        if (rows.length == 0) {
            $.messager.alert('错误', "请选择你要编辑的员工！", "error");
            return;
        }
        var ids = [];
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
        }
        //发送请求
        $.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
            if (r) {
                $.getJSON("/role/delete", {ids: ids.join(",")}, function (data) {
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
        var rows = $("#myPermissions").datagrid("getRows");
        for (var i = 0; i < rows.length; i++) {
            params["permissions[" + i + "].id"] = rows[i].id;
        }
        $.postJSON("/role/save", params, function (data) {
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