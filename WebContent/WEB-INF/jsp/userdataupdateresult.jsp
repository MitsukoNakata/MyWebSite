<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="jpn">
  <head>
  	<!-- Required meta tags -->
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.ico">
	<style>
  	#validationMessage {
   	 font-size: 80%;
	  }
	 .card-content>span{
	font-size:18px !important;
	height:150px;
	}
	</style>
    <title>マイページ</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="Materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
	<link href="Materialize/css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />


    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="css/form-validation.css" >
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
	<br><br><br><br><br>
	<div class="container">
		<div class="row center">
			<h5 class=" col s12 light">更新完了</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<div class="row">
								<div class="input-field col s4">
									名前
									<input type="text" value="${udb.name}" readonly>
								</div>
								<div class="input-field col s4">
								メールアドレス
									<input type="text" value="${udb.email}" readonly>
								</div>
								<div class="input-field col s4">
								電話番号
									<input type="text" value="${udb.phonenumber}" readonly>
								</div>

							</div>
							<div class="row">
								<div class="input-field col-2">
								郵便番号
									<input type="text" value="${udb.zipcode}" readonly>
								</div>
								<div class="input-field col-10">
								ご住所
									<input type="text" value="${udb.address}" readonly>
								</div>
							</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">上記内容で更新しました</p>
							</div>
						</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">
									<a href="UserData" class="btn waves-effect waves-light  col s4 offset-s4">ユーザー情報へ</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2018 PC Robin</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>


  </body>
</html>
