<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <g:if test="resu">
        <p>Hello ${resu.userName} you have ${resu.walletAmount} Rs. left in your wallet.</p>
        <a href="/logout">Logout</a><br>
        <g:link controller="dashBoard" action="reminder">Add Reminder</g:link><br>
        <g:link controller="wallet" action="index">Expense</g:link>
    </g:if>
    <g:else>
        <p> hello </p>
    </g:else>
</body>
</html>