<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="jpn">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="Materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
	<link href="Materialize/css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <title>入力内容確認</title>
    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
  </head>

  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
    <div class="container">
      <div class="py-5 text-center">
        <br><br>
        <h3>入力内容確認</h3>
			<c:if test="${validationMessage != null}">
			<P class="red-text">${validationMessage}</P>
			</c:if>
      </div>

        <div class="py5 center-block">
        <div class="col-md-6 mx-auto">
          <h5 class="mb-3">入力された情報</h5>
          <form action="RegistResult" method="POST">
              <div class="mb-3">
                <label for="Name">お名前</label>
                <input name="user_name" type="text" class="form-control" id="name" placeholder="例：山田　太郎" value="${udb.name}" readonly>
              </div>


            <div class="mb-3">
              <label for="email">メールアドレス<span class="text-muted">(ユーザIDとして使用します)</span></label>
              <input name="email" type="email" class="form-control" id="inputEmail" placeholder="you@example.com" value="${udb.email}" readonly>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="password">パスワード<span class="text-muted"></span></label>
                <input name="password" type="password" data-minlength="8" class="form-control" id="inputPassword"
                placeholder="8文字以上設定" data-required-error="パスワードの入力は必須です" value="${udb.password}"readonly>
               <div class="invalid-feedback"></div>
               </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="zip">郵便番号</label>
                <input name="zipcode" type="text" class="form-control" id="zip" placeholder="001-0001" value="${udb.zipcode}"readonly>
              </div>
            </div>
            <div class="mb-3">
              <label for="address">ご住所</label>
              <input name="user_address" type="text" class="form-control" id="address" placeholder="例：東京都杉並区荻窪" value="${udb.address}" readonly>
              <div class="invalid-feedback">
                住所の欄が未入力です。
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <label for="telephone">電話番号</label>
                <input name="phonenumber" type="text" class="form-control" id="telephone" placeholder="090-1234-5678" value="${udb.phonenumber}" readonly>
              </div>

            </div>

            <hr class="mb-4">
            	<div class="row">
            	<div class="col-md-6 mb-3">
            	<button class="btn btn-info btn-lg btn-block" type="submit" name="confirm_button" value="cancel">修正</button>
            	</div>
	            <div class="col-md-6 mb-3">
            	<button class="btn btn-info btn-lg btn-block" type="submit" name="confirm_button" value="regist">登録</button>
            	</div>
            	</div>
          </form>
        </div>
      </div>

	<jsp:include page="/baselayout/footer.jsp" />
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
  </body>
</html>
