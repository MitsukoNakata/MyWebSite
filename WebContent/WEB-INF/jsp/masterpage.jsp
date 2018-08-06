<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="jpn">
  <head>
<jsp:include page="/baselayout/head.html" />
    <title>管理者専用ページ</title>
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
	<br><br><br><br><br>
       	<div class="container">
			<div class="row center">
				<h5 class=" col s12 light">管理者用ページ</h5>
			</div>
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
							<c:if test="${validationMessage != null}">
								<p class="red-text center-align">${validationMessage}</p>
							</c:if>
							<br><h5>パーツの追加・編集・削除</h5><br>

							<div class="row">
									<a href="MasterItemEdit?itemType=all" class="btn btn-raised btn-info">全て</a>　
									<c:forEach var="type" items="${typeList}" varStatus="status">
									<a href="MasterItemEdit?itemType=${type.itemType}" class="btn btn-raised btn-info">${type.name}</a>　
									<c:if test="${status.count == 3}">
									<br><br>
									</c:if>
									</c:forEach>

							</div>

							</div>
					</div>
				</div>
			</div>

		<!--  購入履歴 -->
        <jsp:include page="/baselayout/footer.jsp" />
	</div><!--/.container-->


      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
      <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    </body>
  </html>