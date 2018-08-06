<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="Materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
	<link href="Materialize/css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
		<title>購入履歴詳細</title>
	</head>
 <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
	<br><br><br><br><br>
		<div class="container">
			<div class="row center">
				<h5 class=" col s12 light">購入詳細</h5>
		</div>
		<!--  購入 -->
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table>
							<thead>
								<tr>
									<th class="center">購入日時</th>
									<th class="center">配送方法</th>
									<th class="center">合計金額</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center">${resultBDB.formatDate}</td>
									<td class="center">${resultBDB.deliveryMethodName}</td>
									<td class="center"><fmt:formatNumber value="${resultBDB.totalPrice}"/>円</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 詳細 -->
		<div class="row">
			<div class="col s12">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table class="bordered">
							<thead>
								<tr>
									<th class="center">商品名</th>
									<th class="center">単価</th>
								</tr>
							</thead>
							<tbody>

									<tr>
										<td>
											<c:forEach var="type" items="${typeList}">
											<c:set var="itemType" value="${type.itemType}Name" />
												<p>・${resultBDB[itemType]}</p>
												</c:forEach>
										</td>
										<td class="center">
										<fmt:formatNumber value="${resultBDB.totalPrice - resultBDB.deliveryMethodPrice}"/>円</td>
									</tr>

								<tr>
									<td class="center">${resultBDB.deliveryMethodName}</td>
									<td class="center"><fmt:formatNumber value="${resultBDB.deliveryMethodPrice}"/>円</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>