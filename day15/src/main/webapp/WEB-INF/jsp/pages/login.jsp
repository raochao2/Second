<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css ">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>

<div style="background:url(${pageContext.request.contextPath}/bootstrap/weichate.jpg)">
  <h1 style="text-align: center;background-color: green"><span style="color: yellow">用户登录 </span></h1>
  <form action="${pageContext.request.contextPath}/init/login" method="post" class="form-inline" >
      <div class="container">
          <div class="col-md-4 col-md-offset-3" style="line-height: 150%;background-color: #dca7a7">
             <div class="form-group has-feedback">
                 <lable>名字：</lable>
                 <input type="text" name="name" id="myname">
                 <span class="glyphicon glyphicon-user form-control-feedback"></span>
             </div>
              <span id="span"></span>
          </div>
          <br>
          <div class="col-md-4 col-md-offset-3" style="line-height: 150%;background-color: #dca7a7">
              <div class="form-group has-feedback">
                  <lable>密码：</lable>
                  <input type="password"  name="password">
                  <span class="glyphicon glyphicon-star form-control-feedback"></span>
              </div>
          </div>
          <br>
          <div class="col-md-4 col-md-offset-3" style="line-height: 30px;background-color: #dca7a7">
              <div class="form-group">
                <i class="layui-icon layui-icon-login-wechat" style="font-size: 40px;color:darkgreen"></i>
               &nbsp; &nbsp;  <button class="btn btn-primary">登录</button>
              </div>
          </div>
      </div>
  </form>
    <div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
</div>
</body>
<script>
$(function () {
    $("#myname").keyup(function () {
        var $myname = $("#myname").val();
        $.post(
            "init/check",
            {"check":$myname},
            function (data) {
                $("#span").empty();
                $("#span").html(data);
            },"text"
        )
    })
})
</script>
</html>
