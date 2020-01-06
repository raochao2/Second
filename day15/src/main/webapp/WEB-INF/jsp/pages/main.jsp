<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css ">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/init/addproject" method="post">
<table class="table table-striped  table-hover table-bordered"  >
   <tr style="text-align: center">   <h2 style="text-align: center">  企业工单管理系统  </h2>   </tr>
    <tr style="text-align: center">
        <td>   选择项目：</td>
        <td>
            <select name="xiangmu" id="project">
                <%--动态--%>
                <c:forEach items="${plist}" var="pro">
                    <option value="${pro.id}">${pro.projectname}</option>
                </c:forEach>
            </select>
        </td>
    </tr>
    <tr style="text-align: center">
        <td> 内容1: </td>
        <td><input type="text" placeholder="输入你想要添加的内容"> </td>
    </tr>
    <tr style="text-align: center">
        <td> 内容1: </td>
        <td><input type="text" placeholder="输入你想要添加的内容"> </td>
    </tr>
    <tr style="text-align: center">
        <td>输入日期</td>
        <td>
            <input type="text" id="test">
        </td>
    </tr>
     <tr style="text-align: center">
         <td colspan="2">
             <button class="btn btn-primary" >确定</button>
             <button class="btn btn-danger" type="button" onclick="gotopage()">取消</button>
         </td>
     </tr>
</table>

    </form>
</div>
</body>
<script>
    function  gotopage() {
      var id=$("#project").val();
      location.href="${pageContext.request.contextPath}/init/listtwo";
    }
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test' //指定元素
        });
    });
</script>
</html>
