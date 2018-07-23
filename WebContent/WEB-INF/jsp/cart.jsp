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
<style type="text/css"><!--
/*ここに調整CSS記述*/
 #validationMessage {
   	 font-size: 80%;
	  }

.form-control-text {
  padding-top: $input-padding-y;
  padding-bottom: $input-padding-y;
  margin-bottom: 0; // match inputs if this class comes on inputs with default margins
  line-height: $input-line-height;
  color: $input-plaintext-color;
  background-color: transparent;
  border: solid transparent;
  border-width: $input-border-width 0;

  &.form-control-sm,
  &.form-control-lg {
    padding-right: 0;
    padding-left: 0;
  }
}
--></style>

    <title>カート</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="dist/css/bootstrap.min.css">

  </head>

  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />

  <div class ="container">
		<div class="py-5 text-center">

        	<img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        	<h2>カートの中</h2>
        </div>
	<form action="Buy" method="POST">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">商品名</th>
              <th scope="col">単価</th>
              <th scope="col">数量</th>
              <th scope="col">金額</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td> <!--カスタマイズした商品詳細-->
              	<h5>${customName}</h5>
				<c:set var="customPrice" value="${0}" />
				<c:forEach var="type" items="${typeList}">
				  <c:set var="itemType" value="${type.itemType}" /> <!-- パーツ名取得用 -->
				   <c:set var="customPrice" value="${customPrice + requestScope[itemType].price}" /><!-- カスマイズ金額取得用 -->
				  <p><input type="hidden" name="${itemType}" value="${requestScope[itemType].id}">
				  ・${requestScope[itemType].name}</p>
				</c:forEach>
              </td>
				<td>${customPrice}
				<td>1
				<td>${customPrice}</td>
            </tr>
             <tr>

              <td>
              </td>

              <td></td>
              <th>合計金額</th>
              <td><p>${customPrice}円</td>
            </tr>
            <tr>
              <td></td>

              <th>配送方法</th>
              <td colspan="2"><select class="form-control" data-style="text-right" name="delivery_method_id">
				<c:forEach var="dmdb" items="${dmdbList}" >
				<option value="${dmdb.id}" class="text-right"> ${dmdb.name}  　　${dmdb.price}円</option>
				</c:forEach>
				</select></td>
            </tr>
          </tbody>
        </table>

      <div class="float-right">
      <input type="hidden" name="totalPrice" value="${customPrice}">
			<button type="submit" name="action" class="btn btn-danger btn-lg">
        購入・注文へ</button></div>
        </form>
	</div><!--/.container-->


      <br><br><br>
      <p class="text-center mt-5 mb-3 text-muted">&copy; 2018</p>

            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
      <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    </body>
  </html>
