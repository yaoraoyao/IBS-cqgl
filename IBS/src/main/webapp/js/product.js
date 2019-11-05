$(function () {
    $("#dg").datagrid({
        url: '/product/list',
        method: 'post',
        striped: true,
        rownumbers: true,
        pagination: true,
        onLoadSuccess:loadSuccess,
        toolbar: '#toolbar',
        queryParams: {},
        frozenColumns: [[{field: 'hhhhhh', checkbox: true, width: '5%'}]],
        columns: [[
            {field: 'id', title: 'id', width: '100', align: 'center', hidden: true},
            {field: 'name', title: '名称', width: '100', align: 'center'},
            {field: 'color', title: '颜色', width: '100', align: 'center', formatter: function (value, row, index) {
                    return value ? "<div style='width: 80px;height: 20px;margin-left:6px;background-color: "+value+"'></div>" : "没有颜色";
                }},
            {field: 'pic', title: '图片', width: '100', align: 'center', hidden:true},
            {field: 'smallpic', title: '缩略图', width: '100', align: 'center', formatter: function (value, row, index) {
                    return value ? "<img src='" + value + "' style='width:38px;height:38px;margin-top:5px;' />" : "没有缩略图";
                }},
            {field: 'costprice', title: '成本价', width: '100', align: 'center'},
            {field: 'saleprice', title: '销售价', width: '100', align: 'center'},
            {field: 'types', title: '类型', width: '100', align: 'center',formatter:formatObj},
            {field: 'unit', title: '单位', width: '100', align: 'center',formatter:formatObj},
            {field: 'brand', title: '品牌', width: '100', align: 'center',formatter:formatObj},
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
            formData.append("pic", file);
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/product/upload", true);
            /*请求完毕*/
            xhr.onload = function () {
                if (xhr.responseText != "") {
                    $("#hiddenPic").val(xhr.responseText);
                }
            };
            xhr.send(formData);
        }
    });
});
window.methods = {
    add: function () {
        //重置一下表单
        $("#ffff").form("reset");
        //手动再清空一下employeeid
        $("#productid").val("");
        //弹出模态窗口
        $('#win').window('open');  // open a window
    },
    edit: function () {
        //重置一下表单
        $("#ffff").form("reset");
        $("#productid").val("");
        //获取到datagrid内已经被选中的行
        var rows = $("#dg").datagrid("getSelections");
        if (rows.length == 0) {
            $.messager.alert('错误', "请选择你要编辑的商品！", "error");
            return;
        }
        if (rows.length > 1) {
            $.messager.alert('错误', "你只能选择一行进行修改！", "error");
            return;
        }
        var row = rows[0];
        $.getJSON("/product/findOne", {id: row.id}, function (data) {
            //表单回填
            $("#ffff").form("load", data);
            if (data.types==null){
                $("#types_id").combobox("setValue", null);
                $('#win').window('open');
            }
            $("#types_id").combobox("setValue", data.types.id);
            $("#unit_id").combobox("setValue", data.unit.id);
            $("#brand_id").combobox("setValue", data.brand.id);
            $("#imageFile").filebox("setText", data.pic);
            //弹出模态窗口
            $('#win').window('open');  // open a window
        });
    },
    remove: function () {
        //获取到datagrid内已经被选中的行
        var rows = $("#dg").datagrid("getSelections");
        if (rows.length == 0) {
            $.messager.alert('错误', "请选择你要删除的商品！", "error");
            return;
        }
        var ids = [];
        var paths = [];
        for (var i = 0; i < rows.length; i++) {
            ids.push(rows[i].id);
            paths.push(rows[i].pic);
        }
        //发送请求
        $.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
            if (r) {
                $.getJSON("/product/delete", {ids: ids.join(","),paths:paths.join(",")}, function (data) {
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
        $.postJSON("/product/save", params, function (data) {
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
}
function loadSuccess(data) {
    var rows = data.rows;
    for(var i=0;i<rows.length;i++){
        var result = rows[i];
        $.easyui.tooltip.init($("img[src='"+result.smallpic+"']"), {
            position: "right",
            content: "<div style=\"width:600px;height:480px;\"><img src='"+result.pic+"'  /></div>"
        });
    }
}


