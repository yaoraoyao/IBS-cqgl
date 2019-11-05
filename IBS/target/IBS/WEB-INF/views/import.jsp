<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>导入功能</title>
    <%@include file="common.jsp" %>
</head>
<body>
<form style="padding: 20px;" action="/import" method="post" enctype="multipart/form-data">
    <input name="importFile" class="easyui-filebox" style="width:500px;" data-options="buttonText: '选择文件'">
    <button id="btn" class="easyui-linkbutton" data-options="iconCls:'icon-ibs-import'">导入</button>
    <span style="color: red">${uploadError}</span>
</form>
</body>
</html>