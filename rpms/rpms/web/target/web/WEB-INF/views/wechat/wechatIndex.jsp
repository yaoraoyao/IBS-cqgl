<%--
  Created by IntelliJ IDEA.
  User: qiuyu
  Date: 2019/9/17
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js">
    </script>
</head>
<body>
<div id="login_container" style="text-align: center;">


</div>
<script type="text/javascript">

    var obj = new WxLogin({
        self_redirect:true,
        id:"login_container",
        appid: "wxd853562a0548a7d0",
        scope: "snsapi_login",
        redirect_uri: "http://bugtracker.itsource.cn/wechat/callback",
        state: "1",
        style: "black",
        href: ""
    });

</script>
</body>
</html>
