<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css ">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
</head>
<body>
&nbsp;&nbsp;&nbsp;<h1>退出登录！</h1>
  &nbsp;&nbsp;&nbsp; <button class="btn btn-default" onclick="gotoMain()">点击登录！</button>
</body>

<script>
    function gotoMain(){
      location.href="${pageContext.request.contextPath}/" ;
    }
</script>
</html>
