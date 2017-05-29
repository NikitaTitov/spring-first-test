<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Numl
  Date: 17.05.2017
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style id="holderjs-style" type="text/css"></style>
</head>
<body>

<c:forEach items="${listUsers}" var="user">
<div class="modal fade" id="${user.id}" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Edit user ${user.login} </h4>
            </div>
            <div class="modal-body">
                <form class="form" method="post" action="/admin/update">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input id="id" type="text" class="form-control" value="${user.id}" name="id">
                    </div>
                    <div class="form-group">
                        <label for="login">Login</label>
                        <input id="login" type="text" class="form-control" value="${user.login}" name="login">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" type="password" class="form-control" value="${user.password}" name="password">
                    </div>
                    <div class="form-group">
                        <label for="roles">Login</label>
                        <input id="roles" type="text" class="form-control" value="${user.roles}" name="roles">
                    </div>
                    <input class="btn-primary btn-lg" type="submit" value="Update User"/>
                </form>
            </div>
        </div>
    </div>
</div>
</c:forEach>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">

            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">

                <li><a href="/logout">Logout</a></li>


            </ul>

        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">


                <li><a href="/admin">Admin</a></li>
                <li><a href="/user">User</a></li>
            </ul>


        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <h1 class="sub-header"><strong>Admin panel</strong></h1>


            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#home" data-togge="tab">User table</a></li>
                <li><a href="#newUser" data-togge="tab">New User</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Название панели</h3>
                    </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>ROLE</th>
                                            <th>LOGIN</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listUsers}" var="user">
                                        <tr>
                                            <td><c:out value="${user.id}"/></td>
                                            <td><c:out value="${user.login}"/></td>
                                            <td><c:out value="${user.roles}"/></td>
                                            <td>
                                                <button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#${user.id}">Edit</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="newUser">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Название панели</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form" action="/admin/create" method="post">
                                <div class="form-group">
                                    <label for="login">Login</label>
                                    <input id="login" type="text" class="form-control" name="login" >
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input id="password" type="password" class="form-control" name="password">
                                </div>
                                <div class="form-group">
                                    <label for="roles">Login</label>
                                    <input id="roles" type="text" class="form-control" name="roles">
                                </div>
                                <input type="submit" value="Add person" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="static/docs.min.js"></script>
<%--<script type="text/javascript">
    $(document).ready(function(){
        $("#myTab a").click(function(e){
            e.preventDefault();
            $(this).tab('show');
        });
    });
</script>--%>
</body>
</html>
