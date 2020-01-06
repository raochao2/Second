<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改电子图书</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css ">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    </head>
<body>
<form action="${pageContext.request.contextPath}/init/modifiThebook"  method="post" onsubmit="return check()" class="form-inline">
    <div class="container">
        <table  class="table table-striped  table-hover table-bordered " >
            <tr style="text-align: center">   <h2 style="text-align: center">  修改电子图书  </h2>   </tr>
            <input type="hidden" name="categoryid" value="${entryInfo.categoryid}">
            <tr>
                <td>图书编号</td>
                <td>
                    <input type="text" value="${entryInfo.id}" disabled>
                </td>
            </tr>
            <tr>
                <td>图书名称（*）</td>
                <td>
                    <input type="text" name="title"  id="title" value="${entryInfo.title}">
                </td>
            </tr>
            <tr>
                <td>图书摘要</td>
                <td><textarea name="summary" id="summary">${entryInfo.summary}</textarea> </td>
            </tr>
            <tr>
                <td>上传人</td>
                <td><input type="text" name="uploaduser" id="uploaduser" value="${entryInfo.uploaduser}"></td>
            </tr>
            <tr>
                <td>上传时间</td>
                <td>
                    <input type="date" name="createdate" value="${entryInfo.createdate}">
                </td>
            </tr>

            <tr style="text-align: center">
                <td colspan="2">
                    <button type="submit" class="btn-primary">提交</button>
                    <button class="btn-danger" type="button" onclick="gotoMainpage()">返回</button>
                </td>
            </tr>
        </table>
    </div>
</form>

</body>
<script>
    function gotoMainpage() {
        location.href="${pageContext.request.contextPath}/init/listtwo";
    }
    function check() {
        if($("#title").val().trim()==''){
            alert("图书的名字不可以不写啊老铁！");
            return false;
        }
        if($("#summary").val().trim()==''){
            alert("图书摘要没有写啊！");
            return false;
        }
        if($("#uploaduser").val().trim()==''){
            alert("上传者的名字没有写啊！");
            return false;
        }
        if($("#test").val().trim()==''){
            alert("上传的时间没有写啊！");
            return false;
        }
        return true;
    }
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test' //指定元素
        });
    });


    //把日期转换成字符串 = 支持 yyyy-MM-dd
    function timeStamp2String(time){
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate(); return year + "-" + month + "-" + date;
    }
    //把字符串转换成日期
    function convertDateFromString(dateString) {
        var date = new Date(dateString);
        return date;
    }
</script>
</html>

