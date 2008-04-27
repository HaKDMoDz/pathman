<%@ taglib uri="/webwork" prefix="ww" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Available Employees</title></head>

<body>
<h1>Users</h1>
<table>
    <tr>
        <th>xx</th>
        <th>帐号</th>
        <th>名称</th>
    </tr>
    <ww:iterator value="allUsers">
        <tr>
            <td><ww:checkbox name="toDeletes" value="id" /></td>
            <td><a href="<ww:url action="edit"><ww:param name="id" value="id"/></ww:url>"><ww:property value="account"/></a></td>
            <td><ww:property value="name"/></td>
        </tr>
    </ww:iterator>
</table>
<p><a href="<ww:url action="edit" includeParams="none"/>">添加用户</a></p>
</body>
</html>
