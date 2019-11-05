$(function () {
    $("#dg").datagrid({
        url: '/employee/list',
        method: 'post',
        striped: true,
        rownumbers: true,
        pagination: true,
        enableHeaderClickMenu: true,
        onRowContextMenu:showMenu,
        toolbar: '#toolbar',
        queryParams: {},
        frozenColumns: [[{field: 'hhhhhh', checkbox: true, width: '5%'}]],
        columns: [[{field: 'id', title: '编号', width: '5%', align: 'center', hidden: true}, {
            field: 'userName',
            title: '姓名',
            width: '10%',
            align: 'center',
            sortable: "true"
        }, {
            field: 'headImage', title: '头像', width: 50, formatter: function (value, row, index) {
                return value ? "<img src='" + value + "' style='width:38px;height:38px;margin-top:5px;' />" : "没有头像";
            }
        }, {field: 'password', title: '密码', width: '15%', align: 'center', hidden: true}, {
            field: 'email',
            title: '邮箱',
            width: '15%',
            align: 'center'
        }, {field: 'age', title: '年龄', width: '6%', align: 'center', sortable: "true"}, {
            field: 'department',
            title: '部门',
            width: '10%',
            align: 'center',
            sortable: "true",
            formatter: function (value, row, index) {
                return value && value.name ? value.name : "";
            }
        }]]
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
    $("#imageFile").filebox({
        onChange: function (newValue, oldValue) {
            var file = $("input[name=imageFile]")[0].files[0];
            console.debug(file);
            console.debug(file.type.indexOf("image/"));
            if (!file.type || file.type.indexOf("image/") != 0) {/*上传的文件类型不是图片*/
                $.messager.alert("错误", "请选择头像图片【建议使用正方形图片】！", "error");
                return;
            }
            var formData = new FormData();
            formData.append("headImage", file);
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/employee/upload", true);
            /*请求完毕*/
            xhr.onload = function () {
                if (xhr.responseText != "") {
                    $("#hiddenHeadImage").val(xhr.responseText);
                }
            };
            xhr.send(formData);
        }
    });
});
function showMenu(e, rowIndex, rowData) {
    //选中这个行
    $("#employeeGrid").datagrid("selectRow",rowIndex);
    //第0个位置的面板不支持相应功能
    e.preventDefault();
    $('#gridMenu').menu('show', {
        left: e.pageX,
        top: e.pageY
    });
}

window.methods = {
    add: function () {
        //重置一下表单
        $("#ffff").form("reset");
        //手动再清空一下employeeid
        $("#employeeid").val("");
        //弹出模态窗口
        $('#win').window('open');  // open a window
    },
    edit: function () {
        //重置一下表单
        $("#ffff").form("reset");
        //手动再清空一下employeeid
        $("#employeeid").val("");
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
        $.getJSON("/employee/findOne", {id: row.id}, function (data) {
            //表单回填
            $("#ffff").form("load", data);
            //回填一下文件框
            $("#imageFile").filebox("setText", data.headImage);
            //回填一下部门下拉框
            $("#departmentId").combobox("setValue", data.department.id);
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
                // delete from employee where id in (12,2,5)
                $.getJSON("/employee/delete", {ids: ids.join(",")}, function (data) {
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
        $.postJSON("/employee/save", params, function (data) {
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
    // export: function () {
    //     var params = $("#searchForm").toJson();
    //     $.postJSON("/employee/export", params, function (data) {
    //
    //     });
    // }
};