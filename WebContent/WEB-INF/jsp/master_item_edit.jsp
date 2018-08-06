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

		<div class="py-5 text-center">
        	<img class="d-block mx-auto mb-4" src="img/dummy.png" alt="" width="72" height="auto">
        	<h4>パーツ追加・削除・編集</h4>
        	<div id="categoty" class="col-md-12">
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
		<form action="MasterItemEditResult" method="POST">

			<div id="categoty" class="col-md-12">
				<table class="table table-bordered">
				  <thead>
				    <tr>
				      <th>カテゴリ</th>
				      <th>パーツ名</th>
				      <th>金額</th>
				      <th>画像</th>
				      <th>ソケット</th>
				      <th>メモリタイプ</th>
				      <th>商品詳細ページ</th>
				    </tr>
				  </thead>
				  <tbody>
				   <c:forEach var="itemList" items="${itemList}" varStatus="status">
				   <div class="form-check">
				    <tr>
				    	<td><input type="checkbox" id="${status.index}" name="delete_item_id_list" value="${itemList.id}" /> <label for="${status.index}">${itemList.itemType}</label>
						</td>
					    <td>${itemList.name}</td>
					    <td>${itemList.price}</td>
					    <td>${itemList.fileName}</td>
					    <td>${itemList.soket}</td>
						<td>${itemList.ramType}</td>
						<td>${itemList.link}</td>
				    </tr>
				    </div>
				    </c:forEach>
				    <tr><th colspan="2">新商品追加</tr>
				    <tr>
				    <td><select class="form-control" data-style="text-right" name="type_category_id">
						<c:forEach var="typeList" items="${typeList}" >
						<option value="${typeList.id}" class="text-right"> ${typeList.name}</option>
						</c:forEach>
						</select>
					</td>
				    <td><input type="text" class="form-control input-normal" placeholder="パーツ名を入力" name="name_of_part"></td>
				    <td><input type="text" class="form-control input-normal" placeholder="半角数字のみ" name="price"></td>
				    <td><input type="text" class="form-control input-normal" placeholder="画像を選択" name="picture"></td>
				    <td><input type="text" class="form-control input-normal" placeholder="CPUのみ" name="soket"></td>
					<td><input type="text" class="form-control input-normal" placeholder="RAMのみ" name="ramType"></td>
					<td><input type="text" class="form-control input-normal" placeholder="URLを入力" name="link"></td>
				    </tr>
				  </tbody>
				 </table>
				</div>

			<div class="float-right">

			<input class="btn btn-danger btn-lg" type="submit" name="Delete" value="選択した項目を削除">
			<input class="btn btn-danger btn-lg" type="submit" name="Edit" value="新商品追加">
            </div>
        </form>
        <jsp:include page="/baselayout/footer.jsp" />



      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
      <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    </body>
  </html>