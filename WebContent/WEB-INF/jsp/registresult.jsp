<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="jpn">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/pcrobinfavicon.ico">


    <title>登録完了</title>

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
  </head>

  <body class="bg-light">
    <header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info">
      <a class="navbar-brand" href="Index"><img src="img/logo_w.png" width="113" height=auto></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">

        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="Index">ホーム<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Cart">カート</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Login">会員ログイン</a>
          </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
          <input class="form-control mr-sm-2" type="text" placeholder="例:core i7" aria-label="Search">
          <button class="btn btn-light" type="submit">検索</button>
        </form>
      </div>
    </nav>
  </header>

    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>登録完了</h2>

      </div>

        <div class="py5 center-block">

              <div class="mb-3">ご登録ありがとうございます
              </div>


            <div class="mb-3">
              ログイン用メールアドレス：${udb.email}
              </div>
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
                <div class="invalid-feedback">
                  郵便番号の欄が未入力です.
                </div>
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
                <div class="invalid-feedback">
                  郵便番号の欄が未入力です.
                </div>
              </div>

            </div>

            <hr class="mb-4">
	            <div class="col-md-6 mb-3">
            	<a href="Login"><button class="btn btn-info btn-lg btn-block"name="confirm_button" value="regist">ログイン画面へ</button></a>
            	</div>
            	</div>
        </div>

      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2018 Company Name</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
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
