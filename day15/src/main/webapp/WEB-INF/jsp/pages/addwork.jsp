<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加电子图书</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css ">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/init/addThebook"  method="post" onsubmit="return check()" class="form-inline">
    <div class="container">
       <table  class="table table-striped  table-hover table-bordered " >
    <tr style="text-align: center">   <h2 style="text-align: center">  增加电子图书  </h2>   </tr>
     <tr>
        <td>图书分类</td>
        <td>
            <select name="categoryid"  value="0">
                 <c:forEach items="${categorylist}" var="category">
                    <option value="${category.id}">${category.name}</option>
                 </c:forEach>
            </select>
        </td>
    </tr>
    <tr>
       <td>图书名称（*）</td>
         <td>
           <input type="text" name="title"  id="title">
         </td>
    </tr>
    <tr>
        <td>图书摘要</td>
        <td><textarea name="summary" id="summary"></textarea> </td>
    </tr>
    <tr>
        <td>上传人</td>
        <td><input type="text" name="uploaduser" id="uploaduser"></td>
    </tr>
    <tr>
          <td>上传时间</td>
          <td><input type="text" name="createdate" id="test">
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
</script>
</html>
