<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 11.11.16
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
  <link rel="stylesheet" href="../../resources/style.css">
  <link rel="stylesheet" href="../../resources/style1.css">
  <title>Main show page</title>
  <style>
  </style>
</head>
<body>
<form:form action="/search" method="post">
  <table style="margin: 10px auto; width: 600px">
    <tr>
      <td><label for="name"></label>NAME:</td>
      <td>
        <input id="name" type="text" name="userNameForSearch" value="" size="20"/>
        <input type="hidden" name="requestedPageNumber" value="1">
      </td>
      <td>
        <input type="submit" value="Search User"/>
      </td>
      <td>
        <a href="/addNewUser"><input type="button" value="Add New User"/></a>
      </td>
      <td>
        <a href="/users"><input type="button" value="Show all users"/></a>
      </td>
    </tr>
  </table>
</form:form>
  <table class="tg" style="margin: 10px auto; width: 600px">
    <tr>
      <th width="60">ID</th>
      <th width="120">Name</th>
      <th width="60">Age</th>
      <th width="60">is_admin</th>
      <th width="200">updated_time</th>
      <th width="60">Edit</th>
      <th width="60">Delete</th>
    </tr>
    <c:forEach items="${users}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
        <td>${user.admin}</td>
        <td>${user.updated_time}</td>
        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
        <td><a href="<c:url value='/delete/${user.id}'/>">Delete</a></td>
      </tr>
    </c:forEach>
    <c:if test="${null != userNameForSearch}">
      <tr>
        <td colspan="7">
          <c:if test="${0 != users.size()}"><span>Search result for name: ${userNameForSearch}</span></c:if>
          <c:if test="${0 == users.size()}"><span class="err">No search results.</span></c:if>
        </td>
      </tr>
    </c:if>
  </table>
<c:if test="${totalPageCount > 1}">
  <div class="wrapper">
    <div class="paging">
      <span class="center-pages left-pages">
        <c:if test="${totalPageCount > 1}">
          <span> <a href="<c:url value='/${urlPart}/${1}'/>">First page</a> </span>
        </c:if>
        <c:if test="${currentPageNumber-1 > 0}">
          <span> <a href="<c:url value='/${urlPart}/${currentPageNumber-1}'/>">Prev</a> </span>
        </c:if>
      </span>
      <span class="center-pages">
        <c:if test="${prevPageNumber != 0}">
          <span> <a href="<c:url value='/${urlPart}/${prevPageNumber}'/>">${prevPageNumber}</a> </span>
        </c:if>
        <c:if test="${currentPageNumber != 0}">
          <span id="current">${currentPageNumber}</span>
        </c:if>
        <c:if test="${nextPageNumber != 0}">
          <span> <a href="<c:url value='/${urlPart}/${nextPageNumber}'/>">${nextPageNumber}</a> </span>
        </c:if>
      </span>
      <span class="center-pages right-pages">
        <c:if test="${currentPageNumber+1 <= totalPageCount}">
          <span> <a href="<c:url value='/${urlPart}/${currentPageNumber+1}'/>">Next</a> </span>
        </c:if>
        <c:if test="${totalPageCount > 1}">
          <span> <a href="<c:url value='/${urlPart}/${totalPageCount}'/>">Last page</a> </span>
        </c:if>
      </span>
    </div>
  </div>
</c:if>
</body>
</html>
