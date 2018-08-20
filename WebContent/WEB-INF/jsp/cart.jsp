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
<style type="text/css">
 #cartActionMessage {
   	 font-size: 80%;
	  }
</style>

    <title>カート</title>



  </head>

  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />

  <div class ="container">
		<div class="py-5 text-center">

        	<img class="d-block mx-auto mb-4" src="img/dummy.png" alt="" width="72" height="auto">
        	<h4>カートの中</h4>

        	<c:if test="${cartActionMessage != null}">
					<p class="text-danger"><br>${cartActionMessage}</p>
			</c:if>
        </div>
	<form method="POST">
		<div class="float-right">
			<button class="btn waves-effect waves-light col s6 offset-s3 " type="submit" onclick="submitAction('/PCrobin/ItemDelete')">
				削除<i class="material-icons right">delete</i>
			</button>
		</div>
	 <br><br><br>
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
          <c:set var="cartTotalPrice" value="${0}" />
          <c:forEach var="cart" items="${cart}" varStatus="status">
            <tr>
              <td> <!--カスタマイズした商品詳細-->
              	<input type="checkbox" id="${status.index}" name="delete_item_id_list" value="${cart.id}" />
              	<label for="${status.index}">${cart.customName}</label>

				<c:forEach var="type" items="${typeList}">
				  <c:set var="itemType" value="${type.itemType}Name" /> <!-- パーツ名取得用 -->
				  <p>・${cart[itemType]}</p>
				</c:forEach>
              </td>
              	<c:set var="cartTotalPrice" value="${cartTotalPrice + cart.totalPrice}" /><!-- カスマイズ金額取得用 -->
				<td><fmt:formatNumber>${cart.totalPrice}</fmt:formatNumber></td>
				<td>1</td>
				<td><fmt:formatNumber>${cart.totalPrice}</fmt:formatNumber></td>
            </tr>
            </c:forEach>
             <tr>

              <td>
              </td>

              <td></td>
              <th>合計金額</th>
              <td><fmt:formatNumber>${cartTotalPrice}</fmt:formatNumber>円</td>
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
     <input type="hidden" name="cart_total_price" value="${cartTotalPrice}">
			<button type="submit" name="action" class="btn btn-danger btn-lg" onclick="submitAction('/PCrobin/Buy')">
        購入・注文へ</button></div>
        </form>
        <jsp:include page="/baselayout/footer.jsp" />
	</div><!--/.container-->


      <br><br><br>


      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
      <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
      <script>
      function submitAction(url) {
    	  $('form').attr('action', url);
    	  $('form').submit();
    	}
      </script>

    </body>
  </html>
