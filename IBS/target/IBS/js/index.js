window.methods = {
    cancel: function () {
        $("#ffff").form("reset");
        $("#win").window("close");
    },
    submit: function () {
        var params = $("#ffff").toJson();
        $.postJSON("/employee/updatePassword", params, function (data) {
            if (data.status == 200) {
                $.messager.alert('消息', data.msg, "info");
                //关闭模态窗口
                $('#win').window('close');  // close a window
            } else {
                $.messager.alert('错误', data.msg, "error");
            }
        });
    },
    edit: function () {
        $('#win').window('open');
    },
};