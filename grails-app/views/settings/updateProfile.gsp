<html>
<head>
</head>
<body>
    <g:form controller="settings" action="saveUpdated">
        <g:textField name="fullname" value="${edited.fullName}"/>
        <g:textField name="username" value="${edited.userName}"/>
        <g:textField name="contact" value="${edited.contactNumber}"/>
        <select class="form-control" name="gender" id="gender" required="required">
            <option disabled selected value="">--Select a status--</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select>
        <g:submitButton name="save" value="save"/>
    </g:form>
</body>
</html>