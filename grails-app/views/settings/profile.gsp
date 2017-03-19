<html>
<head></head>
<body>
    <g:if test="${profileDetails}">
        <p>Full Name: ${profileDetails.fullName}</p>
        <p>User Name: ${profileDetails.userName}</p>
        <p>Gender: ${profileDetails.gender}</p>
        <p>Contact: ${profileDetails.contactNumber}</p>
        <p>Email: ${profileDetails.email.username}</p>
        <p>Wallet Amount: ${profileDetails.walletAmount}</p>
        <g:link controller="settings" action="updateProfile">Edit</g:link>
    </g:if>
</body>
</html>