<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login page</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <link href="static/signin.css" rel="stylesheet">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


</head>
<body>

<form class="form-signin input-lg" role="form" action="" method="post">
    <h2 class="form-signin-heading">Please sign in</h2>
    <input type="text" class="form-control" placeholder="Login" required="" autofocus="" name="username">
    <input type="password" class="form-control" placeholder="Password" required="" name="password">
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>