<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/9
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/updateImg/imageUpload.css">
    <script type="text/javascript" src="/updateImg/uploadImgMore.js"></script>
</head>
<body>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <div class="row clearfix">
            <%@include file="/common/left.jsp"%>
            <div class="panel panel-default col-sm-9" style="padding-right: 0;padding-left: 0">
                <div class="panel-heading" style="background-color: #337ab7;color:white;">
                    <h3 class="panel-title" >
                        center title
                    </h3>
                </div>
                <div class="panel-body">
                    <div style="width: 100%;height: 100vh;position: relative;" class="col-md-6">
                        <form id="upBox">
                            <input type="hidden" name="itemId"/>
                            <div id="inputBox"><input name="files" type="file" title="请选择图片" id="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片</div>
                            <div id="imgBox"></div>
                            <a id="btn">上传</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div style="width: 100%;height: 100vh;border-style:ridge" id="showImg" class="col-md-6">
</div>
<script type="text/javascript">
    //启用插件设置相应的参数
    imgUpload({
        inputId:'file', //input框id
        imgBox:'imgBox', //图片容器id
        buttonId:'btn', //提交按钮id
        upUrl:'${pageContext.request.contextPath}/manager/imgUp',  //提交地址
        data:'files', //type="file"控件的name名
        formId:"upBox",//form表单的id
        num:"10"//上传个数
    })
</script>
</body>
</html>
