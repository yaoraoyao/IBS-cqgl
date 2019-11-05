<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>光明智能商贸系统</title>
    <%@include file="common.jsp" %>
    <script type="text/javascript" src="/js/index.js"></script>
    <style type="text/css"> #north img {
        margin-left: 120px;
    }

    #north b {
        font-size: 24px;
    }
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
    </style>
    <script type="text/javascript">
        $(function () {
            $("#treemenu").tree({
                method: "get", url: "/menu/treeMenu", onClick: function (node) {
                    if (node.url) {/* 在用户点击的时候提示 判断点击的名称对应的选项卡是否已存在【如果存在就选中它并且刷新它，如果不存就添加它】*/
                        var exists = $("#tabs").tabs("exists", node.text);
                        if (exists) {/*选中它*/
                            $('#tabs').tabs("select", node.text);
                            /*刷新它*/
                            var tab = $('#tabs').tabs('getTab', node.text);
                            /* 获取选择的面板 var tab = $('#tabs').tabs('getSelected');  // 获取选择的面板*/
                            $('#tabs').tabs('update', {
                                tab: tab,
                                options: {content: '<iframe src="' + node.url + '" frameborder="0" scrolling="auto" height="625px" width="100%"></iframe>'}
                            });
                        } else {/*添加选项卡*/
                            $('#tabs').tabs('add', {
                                title: node.text,
                                selected: true,
                                closable: true,
                                content: '<iframe src="' + node.url + '" frameborder="0" scrolling="auto" height="625px" width="100%"></iframe>'
                            });
                        }
                    }
                }
            });
        });

        function showTabMenu(e, title, index) {
            //第0个位置的面板不支持相应功能
            e.preventDefault();
            if (index == 0) return;
            $('#tabMenu').menu('show', {
                left: e.pageX,
                top: e.pageY,
                onClick: function (item) {
                    if (item.text == "关闭窗口") {
                        $('#tabs').tabs('close', index);
                    } else if (item.text == "关闭所有窗口") {
                        var tabs = $('#tabs').tabs('tabs');
                        //第0个位置的面板不关闭
                        for (var i = 1; i <= tabs.length; i++) {
                            //注意，这时永远关掉第一个面板
                            $('#tabs').tabs('close', 1);
                        }
                    }
                }
            });
        }

    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" id="north" style="height: 180px;" >
    <div class="north" style="margin-left: 80px">
        <b>华鲸智能商贸系统</b>
        <img src="/img/img.png" style="width: 200px;height: 160px;margin-left: 310px">
        <span style="margin-left: 480px">
            欢迎[<a data-method="edit" href="javascript:void(0);">${loginUser.userName}</a>]登录!&nbsp;&nbsp;&nbsp;
            <a href="/logout" onclick="return confirm('你确定要注销吗？');" class="easyui-linkbutton"
               data-options="iconCls:'icon-undo'">注销</a>
        </span>
    </div>
    <%--<div class="north" style="text-align: right;line-height: 60px;padding-right: 60px; ">--%>

    <%--</div>--%>
</div>
<div data-options="region:'west',title:'系统菜单',iconCls:'icon-list2'" style="width: 200px;">
    <ul id="treemenu"></ul>
</div>
<div data-options="region:'center'" style="padding-left: 5px; background: #eee;">
    <div id="tabs" class="easyui-tabs" data-options="fit:true,onContextMenu:showTabMenu">
        <div title="欢迎你" style="padding: 10px;">
            <div class="easyui-calendar" data-options="fit:true"></div>
        </div>
    </div>
</div>
<div id="tabMenu" class="easyui-menu" style="width:120px;">
    <div data-options="iconCls:'icon-clear'">关闭窗口</div>
    <div data-options="iconCls:'icon-remove'">关闭所有窗口</div>
</div>
<div id="win" class="easyui-window" title="修改密码" style="width:300px;height:385px;"
     data-options="iconCls:'icon-save',modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false,resizable:false">
    <form id="ffff">
        <br/><br/>
        <input type="hidden" name="id" id="employeeid" value="${loginUser.id}">
        <div>
        <input class="easyui-validatebox in" type="text" name="password" placeholder="密码"
        data-options="required:true,validType:'password3'"/>
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
