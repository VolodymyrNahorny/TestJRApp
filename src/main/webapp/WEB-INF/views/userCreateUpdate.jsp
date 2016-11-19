<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 13.11.16
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Redact page</title>
    <link rel="stylesheet" href="../../resources/style1.css">
</head>
<body>
<div class="createUpdate">
    <c:url var="createUpdateAction" value="/user/createUpdate"></c:url>
    <form:form action="${createUpdateAction}" modelAttribute="user">
        <table>
            <c:if test="${user.id != 0}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID:"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input readonly="true" path="id" size="20" disabled="true"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="NAME:"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name" size="20"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="age">
                        <spring:message text="AGE:"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="age" size="20"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="admin">
                        <spring:message text="isAdmin:"/>
                    </form:label>
                </td>
                <td>
                    <form:checkbox path="admin"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${user.id != 0}">
                        <input type="submit"
                               value="<spring:message text="Edit User"/>"/>
                    </c:if>
                    <c:if test="${user.id == 0}">
                        <input type="submit"
                               value="<spring:message text="Add User"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
