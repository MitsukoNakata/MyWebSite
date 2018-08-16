<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="jpn">
  <head>
<jsp:include page="/baselayout/head.html" />
    <title>商品カスタマイズ</title>
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
	<div class ="container">
		<div class="py-5 text-center">
        	<img class="d-block mx-auto mb-4" src="img/dummy.png" alt="" width="72" height="auto">
        	<h3>商品カスタマイズ</h3>

        </div>
		<div class="row">
		<div id="img" class="col-md-6">
		<img src="img/custom/main_pc_201801.png" width="300" height="auto">
		<br><br>
		</div>
		<div class="col-md-6">
		<h5>【2018年最新モデルABX】</h5>

		<br>
		<p>PC Robinのオールインワンパソコンが新しく生まれ変わりました。
    	奥行きわずか19cmのコンパクト筐体にインテリアにもなる落ち着きのあるデザイン。
    	第8世代インテル® Core™ i7プロセッサーを搭載可能、優れたパフォーマンスを発揮します。
    	今ならメモリー8GBモデルが大変オトクです。</p>
		</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-md-3"><h5>基本構成</h5></div>
			<div class="col-md-7"><h5> ${customItem.customName}</h5></div>
			<div class="col-md-2">標準構成価格<br><fmt:formatNumber value="${customItem.price}"/>円〜</div>
			<br><br><br>
		</div><!--/基本構成タイトル.row-->

		<form action="Cart" method="POST">
		<c:forEach var="type" items="${typeList}">
		<div class="row">
			<div id="img" class="col-md-2"><img src="img/custom/${type.fileName}" height="84" width="auto"></div>
			<div id="categoty" class="col-md-10">
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th style="width: 85%"><p>${type.name} </p></th>
				      <th style="width: 100%"></th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:set var="itemType" value="${type.itemType}" />
				  <c:set var="itemObj" value="${type.itemType}Item" />
				 <c:forEach var="item" items="${requestScope[itemType]}">
				 <div class="form-check">
				    <tr>
				      <td scope="row">
 					 		<c:choose>
 					 			<c:when test="${item.id == customItem[itemType]}">
	 					 		<input class="form-check-input" type="radio" indexed="true" name="${type.itemType}" id="${item.id}" value="${item.id}" checked>
	 					 			<label class="control-label" for="${item.id}">${item.name}<a href="${item.link}" target="_blank">【詳細】</a></label>
	 					 			</td>
									 <td><label for="${item.id}">【標準】</label></td>
				    </tr>
				      			</c:when>
				      		<c:otherwise>
				      			<input class="form-check-input" type="radio" indexed="true" name="${type.itemType}" id="${item.id}" value="${item.id}">
					      			<label class="control-label" for="${item.id}">${item.name}<a href="${item.link}" target="_blank">【詳細】</a></label>

	 					 			</td>
							      <td><label class="control-label" for="${item.id}">
							      <fmt:formatNumber value="${item.price - customItem[itemObj].price}" type="CURRENCY" pattern="+#,###;-#,###"/>円</label>
							      </td> <%-- 標準構成パーツとの差額 --%>
				    </tr>
				    	</c:otherwise>
					   	</c:choose>
				</div>
				    </c:forEach>
				  	</tbody>
				 </table>
				</div>
			</div><!--/.row-->

		</c:forEach>

			<div class="float-right">
			<input type="hidden" name="customName" value="${customItem.customName}">
			<button class="btn btn-danger btn-lg" type="submit" >カートへ
            <img src="https://png.icons8.com/material/50/000000/shopping-cart.png" width="auto" height="25"></button></div>
        </form>
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