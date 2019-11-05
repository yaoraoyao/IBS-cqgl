<%--
  Created by IntelliJ IDEA.
  User: qiuyu
  Date: 2019/9/19
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/static/js/vue.min.js"></script>
    <%@include file="/WEB-INF/views/common.jsp"%>
</head>
<body>
    <div id="u">

    </div>
    <script type="text/javascript">
        var u = new Vue({
            el:"#u",
            data:{},
            methods:{
            },
            mounted(){
                var params = {"username":"admin", "password":"admin"}
                axios.post("/login", params).then(function () {
                    <%request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);%>
                })
            }
        })
    </script>
</body>
</html>
