<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>员工登录界面</title>
    <meta name="author" content="DeathGhost"/>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/style.css"
          tppabs="/bootstrap/css/style.css"/>
    <style>
        body {
            height: 100%;
            background: #16a085;
            overflow: hidden;
        }

        canvas {
            z-index: -1;
            position: absolute;
        }
    </style>
    <script type="text/javascript" src="/jquery-easyui-1.5/jquery.min.js"></script>
    <script src="/bootstrap/js/verificationNumbers.js"
            tppabs="/bootstrap/js/verificationNumbers.js"></script>
    <script src="/bootstrap/js/Particleground.js"
            tppabs="/bootstrap/js/Particleground.js"></script>
    <script type="text/javascript" src="/jquery-easyui-1.5/common.js"></script>

    <script>
        //如果当前窗口的最顶层父窗口不等于当前窗口对象自己，就表示已经在嵌套窗口了
        if (window.top != window) {
            //最顶层窗口跳转到登录页面
            window.top.location.href = "/login";
        }
        $(document).ready(function () {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //验证码
            createCode();
        });

        $(function () {
            $("#submit").click(function () {
                console.debug(validate());
                var val = validate();
                if (!val){
                    $("#errorMsg").text("验证码错误");
                    return;
                }
                $.postJSON("/login", $("#loginForm").toJson(), function (data) {
                    if (data.status == 200) {
                        //登录成功
                        location.href = "/index";
                    } else {
                        //登录失败
                        $("#errorMsg").text(data.msg);
                    }
                });
            });

            //给document绑定键盘事件
            $(document).keyup(function (event) {
                if (event.keyCode == 13) {
                    //keyCode等于13表示 回车
                    $("#submit").click();
                }
            });
        });
    </script>
</head>
<body>
<form id="loginForm">
    <dl class="admin_login">
        <dt>
            <strong>登录智能商贸管理系统</strong> <em>Management System</em>
        </dt>
        <dd class="user_icon ">
            <input type="text" placeholder="账号" class="login_txtbx"
                   name="userName"/>
        </dd>
        <dd class="pwd_icon">
            <input type="password" placeholder="密码" class="login_txtbx"
                   name="password"/>
        </dd>
        <dd class="val_icon">
            <div class="checkcode">
                <input type="text" id="J_codetext" placeholder="验证码" maxlength="4"
                       class="login_txtbx">
                <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
            <input type="button" value="验证码核验" class="ver_btn"
                   onClick="validate();">
        </dd>
        <dd>
            <input type="button" value="立即登陆" class="submit_btn" id="submit"/>
        </dd>
        <dd>
            <span id="errorMsg" style="color: red"></span>
        </dd>

    </dl>
</form>
</body>
</html>
