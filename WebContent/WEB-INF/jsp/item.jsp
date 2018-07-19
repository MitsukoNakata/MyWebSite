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


    <title>商品カスタマイズ</title>

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">

  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
	<div class ="container">
		<div class="py-5 text-center">
        	<img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        	<h2>商品カスタマイズ</h2>


        </div>


		<div class="row">
		<div id="img" class="col-md-5">
		<img src="img/custom/main_pc_201801.png" width="300" height="auto">
		<br><br>

		</div>
		<div id="img" class="col-md-7">
		<h3>2018年最新モデルABX</h3>
		<br>
		<p>PC Robinのオールインワンパソコンが新しく生まれ変わりました。
    <br>奥行きわずか19cmのコンパクト筐体にインテリアにもなる落ち着きのあるデザイン。
    <br>第8世代インテル® Core™ i7プロセッサーを搭載可能、優れたパフォーマンスを発揮します。
    <br>今ならメモリー8GBモデルが大変オトクです。</p>
		</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-md-3"><h5>基本構成</h></div>
			<div class="col-md-7"><h4> ${customitem.customName}</h4></div>
			<div class="col-md-2">標準構成価格<br><fmt:formatNumber value="${customitem.basicPrice}" type="CURRENCY" pattern="#,###;-#,###" />円〜</div>
			<br><br><br>
		</div><!--/基本構成タイトル.row-->

		<form action="Cart" method="POST">
		<c:forEach var="type" items="${typeList}">
		<div class="row">
			<div id="img" class="col-md-2"><img src="img/custom/${type.fileName}"></div>
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
				    <tr>
				      <td scope="row">
				      	<div class="form-check">
 					 		<c:choose>
 					 		<c:when test="${item.id == customitem[itemType]}">
	 					 		<input class="form-check-input" type="radio" indexed="true" name="${type.itemType}" id="${item.id}" value="${item.id}" checked>
	 					 			<label class="form-check-label" for="${item.id}">
					      				 ${item.name}</td>
				      			</label>
						 <td>【標準】</td>
				    </tr>
				      		</c:when>
				      		<c:otherwise>
				      			<input class="form-check-input" type="radio" indexed="true" name="${type.itemType}" id="${item.id}" value="${item.id}">
	 					 			<label class="form-check-label" for="${item.id}">
					      				${item.name} </td>
					      			</label>

					      <td>
					      <fmt:formatNumber value="${item.price - customitem[itemObj].price}" type="CURRENCY" pattern="+#,###;-#,###" />円
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
			<input type="hidden" name="customName" value="${customitem.customName}">
			<button class="btn btn-danger btn-lg" type="sumbit" >カートへ
            <img src="https://png.icons8.com/material/50/000000/shopping-cart.png"　width="auto" height="25"></button>
        </form>
        </div>



	</div><!--/.container-->
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>

            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
      <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    </body>
  </html>
