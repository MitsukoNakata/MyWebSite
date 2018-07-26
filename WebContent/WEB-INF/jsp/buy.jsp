<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>注文内容を確認・変更</title>

    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />

    <div class="container">

      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>注文内容を確認・変更する</h2>
      </div>
      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">カートの内容</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">商品名</h6>
                <small class="text-muted">${customName}</small>
              </div>
              <span class="text-muted"><fmt:formatNumber>${bdb.totalPrice}</fmt:formatNumber>円</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">配送方法</h6>
                <small class="text-muted">${bdb.deliveryMethodName}</small>
              </div>
              <span class="text-muted"><fmt:formatNumber>${bdb.deliveryMethodPrice}</fmt:formatNumber>円</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>合計金額</span>
              <fmt:formatNumber>${bdb.totalPrice + bdb.deliveryMethodPrice}</fmt:formatNumber>円
            </li>
          </ul>
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">お届け先情報</h4>
          <form action="BuyResult" method="POST" class="needs-validation" novalidate>
              <div class="mb-3">
                <label for="Name">お名前</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="${udb.name}" readonly>
                </div>
            <div class="row">
              <div class="col-md-3">
                <label for="zip">郵便番号</label>
                <input type="text" class="form-control" id="zip" placeholder="" value="${udb.zipcode}" readonly>
              </div>
            </div>
            <div class="mb-3">
              <label for="address">ご住所</label>
              <input type="text" class="form-control" id="address" placeholder="例：東京都" value="${udb.address}" readonly>
            </div>
            <div class="row">
              <div class="col-md-6">
                <label for="telephone">電話番号</label>
                <input type="text" class="form-control" id="telephone" placeholder="090-1234-5678" value="${udb.phonenumber}" readonly>
              </div>
            </div>
            <hr class="mb-4">

            <h4 class="mb-3">お支払い方法</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                <label class="custom-control-label" for="credit">クレジットカード</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="debit">デビットカード</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="paypal">PayPal</label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">カードの名義</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" required>
                <small class="text-muted">カード上に表示されているフルネーム</small>
                <div class="invalid-feedback">
                  カードの名義を入力してください
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">クレジットカード番号</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                <div class="invalid-feedback">
                  クレジットカード番号を入力してください
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">有効期限</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                <div class="invalid-feedback">
                  有効期限を入力してください
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-cvv">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                <div class="invalid-feedback">
                  セキュリティコードを入力してください
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-danger btn-lg btn-block" type="submit">入力した内容で注文する</button>
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
    <script src="js/validator.js"></script>
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
