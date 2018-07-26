<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang=jpn>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="Materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
	<link href="Materialize/css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <title>会員ログイン</title>


    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="css/signin.css" >
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
	<div class="container">
      <form class="form-signin text-center" action="LoginResult" method="POST">
      <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">

      <h1 class="h3 mb-3 font-weight-normal">会員様ログイン</h1>
		<c:if test="${loginErrorMessage != null}">
		<p class="red-text center-align">${loginErrorMessage}</p>
		</c:if>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input name="email" type="email" id="inputEmail" class="form-control" placeholder="メールアドレス" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input name="password" type="password" id="inputPassword" class="form-control" placeholder="パスワード" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> 次回の入力を省略する
        </label>
      </div>
      <button class="btn btn-lg btn-info btn-block" type="submit">ログイン</button><br><br>
       	<div class="row">
        <div class="col s8 offset-s2">
          <p class="center-align">
            初めての方は<a href="Regist">新規登録</a>
          </p>
        </div>

      </div>
      	<jsp:include page="/baselayout/footer.jsp" />
      </form>
</div>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
      <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    </body>
  </html>
