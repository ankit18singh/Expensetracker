<html>
<head></head>
<body>
    <g:form controller="settings" action="changePassword" method="post">
        <g:passwordField name="current_password"/>
        <g:passwordField name="new_password"/>
        <g:passwordField name="confirm_password"/>
        <g:submitButton name="save" value="save"/>
    </g:form>
</body>
</html>