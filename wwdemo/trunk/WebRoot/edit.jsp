<%@ taglib uri="/webwork" prefix="ww" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>添加/修改用户</title>
    <ww:head/>
</head>

<body>

<ww:form  action="save" method="post">
	<ww:textfield label="帐号" name="user.account"/> 
    <ww:textfield label="Employee Id" name="currentEmployee.empId"/>
    <ww:textfield label="%{getText('employee.firstName')}" name="currentEmployee.firstName"/>
    <ww:textfield label="%{getText('employee.lastName')}" name="currentEmployee.lastName"/>
    <ww:datepicker label="Birthdate" name="currentEmployee.birthDate"/>
    <ww:textfield label="Salary" name="currentEmployee.salary"/>
    <ww:checkbox fieldValue="true" label="Married" name="currentEmployee.married"/>
    <ww:combobox list="availablePositions" label="Position" name="currentEmployee.position"/>
    <ww:select list="#skillAction.availableItems" listKey="name" label="Main Skill"
               name="currentEmployee.mainSkill.name"/>
    <ww:select list="#skillAction.availableItems" listKey="name" listValue="description" label="Other Skills"
               name="selectedSkills" multiple="true"/>
    <ww:password label="Password" name="currentEmployee.password"/>
    <ww:radio list="availableLevels" name="currentEmployee.level"/>
    <ww:textarea label="Comment" name="currentEmployee.comment" cols="50" rows="3"/>
    <ww:submit value="保存" />
</ww:form>
<p><a href="<ww:url action="list"/>"><ww:text name="employee.backtolist"/></a></p>
</body>
</html>
