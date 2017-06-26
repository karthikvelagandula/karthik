<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
function save()
{
  document.forms[0].action="insert.do";
  document.forms[0].submit();
}
function update()
{
  document.forms[0].action="update.do";
  document.forms[0].submit();
}
function delete1()
{
  document.forms[0].action="delete.do";
  document.forms[0].submit();
}
function getAll()
{
  document.forms[0].action="getall.do";
  document.forms[0].submit();
}

</script>
</head>
<body bgcolor="Orange">
<fieldset>

<legend>Registration Page</legend><br><br>
<form:form commandName="user">

<table>
<tr>
<td>
PersonId::<form:input type="text" path="pid"/><br><br>

PersonName::<form:input type="text" path="pname"/><br><br>

PersonAge::<form:input type="text" path="page"/><br><br>

PersonAddr::<form:input type="text" path="paddr"/><br><br> 
</td>
</tr>
<tr>
<td>
<input type="button"  value="Save" onclick= "save()">
<input type="button" onclick="update()" value="Update">
<input type="button" onclick="delete1()" value="Delete">
<input type="button" onclick="getAll()" value="GetAll">
</td>
</tr>
</fieldset>
</table>
</form:form>

</body>
</html>