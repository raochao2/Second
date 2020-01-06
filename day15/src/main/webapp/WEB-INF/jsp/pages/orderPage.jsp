<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎你啊</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css ">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
</head>
<body>
<br>
   <div style="text-align: center">
     <span style="color: #28a4c9" style="margin-left: 260px;font-size: xx-large">欢迎你！尊贵的用户：[${username}]</span>
   </div>
<br>
  <div class="container">
      <form action="${pageContext.request.contextPath}/init/listtwo" id="myform" method="post" class="form-horizontal">
          <input type="hidden" id="pageNum" name="pageNum">
            图书分类：
          <select name="categoryid">
              <option value="0">请选择分类</option>
           <c:forEach items="${categorylist}" var="category">
              <option value="${category.id}" <c:if test="${condition==category.id}">selected</c:if>>
               ${category.name}</option>
           </c:forEach>
          </select>
           <span class="glyphicon glyphicon-search"></span>
          <div  class="form-control">
              <button class="btn btn-primary" type="submit">查询</button>
              <a class="btn btn-danger" href="${pageContext.request.contextPath}/init/exit"> 退出登录 </a>
          </div>
      </form>
      <button class="btn btn-primary" onclick="addbook()" type="button">新增电子图书</button>

    <table class="table table-striped  table-hover table-bordered">
    <tr style="text-align: center"> <td colspan="6"> 电子图书列表</td> </tr>
  <tr style="text-align: center"> <th>图书编号</th>   <th>图书名称</th> <th>图书摘要</th>
      <th>上传人</th> <th>上传时间</th> <th>操作</th>
  </tr>
  <c:forEach items="${pageInfo.list}" var="order">
      <tr>
          <td>${order.id} </td>
          <td>${order.title}</td>
          <td>${order.summary} </td>
          <td>${order.uploaduser} </td>
          <td>
          <fmt:formatDate value="${order.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate>
          </td>
          <td>
          <button class="btn btn-primary " onclick="toModifyUI(${order.id})">修改</button>
          <button  class="btn btn-danger"  onclick="toDelete(${order.id})"> 删除 </button>
          </td>
      </tr>
  </c:forEach>
</table>
    <div class="row">
          <div class="col-md-10 col-md-offset-3">
              <%--必须要写ul标签: 分页的数据都放在ul标签中--%>
              <ul id="pagination"></ul>
          </div>
      </div>
  </div>

</body>
<script>

    <c:if test="${insert=='success'}">
      alert("增加图书成功！");
    </c:if>
    $(function () {
        var element = $('#pagination');
        options = {
            bootstrapMajorVersion:3, //对应的bootstrap版本
            currentPage: ${pageInfo.pageNum}, //当前页数，这里是用的EL表达式，获取从后台传过来的值
            totalPages:${pageInfo.pages}, //总页数，这里是用的EL表达式，获取从后台传过来的值
            itemTexts: function (type, page, current) {//设置显示的样式，默认是箭头
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },
            //点击事件  page:当前的页码
            onPageClicked: function (event, originalEvent, type, page) {
                //处理具体的业务
                //把当前页码发送到后台的controller做分页查询
                //给隐藏域赋值
                $("#pageNum").val(page);
                //提交表单
                $("#myform").submit();
            }
        };
        element.bootstrapPaginator(options);
    })
</script>
<script>
 function addbook() {
    location.href="${pageContext.request.contextPath}/init/goAddbook";
 }
 <c:if test="${insert=='success'}">
      alert("添加图书信息成功！");
 </c:if>
 <c:if test="${delete=='success'}">
      alert("删除图书信息成功！");
 </c:if>
 <c:if test="${update=='success'}">
     alert("修改图书信息成功！");
 </c:if>
    function  toDelete(id){
       if(confirm("确定要删除这条图书信息吗？")){
         location.href="${pageContext.request.contextPath}/init/deletebook?delId="+id;
       }
    }
 function  toModifyUI(id){
     if(confirm("确定要修改这条图书信息吗？")){
      location.href="${pageContext.request.contextPath}/init/toModifyUI?upid="+id;
     }
 }
</script>
</html>
