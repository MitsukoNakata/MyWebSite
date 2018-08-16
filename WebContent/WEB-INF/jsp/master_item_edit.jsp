<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="jpn">
  <head>
<jsp:include page="/baselayout/head.html" />
<style>
  	#actionMessage {
   	 font-size: 80%;
	  }
	#input-normal {
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #9e9e9e;
  border-radius: 0;
  outline: none;
  width: 100%;
  font-size: 1rem;
  padding: 0;
  box-shadow: none;
  box-sizing: content-box;
  transition: all 0.3s;
}
</style>
    <title>商品カスタマイズ</title>
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
		<div class="py-5 text-center">

        	<img class="d-block mx-auto mb-4" src="img/dummy.png" alt="" width="72" height="auto">
        	<h4>パーツ追加・削除・編集</h4>
        	<div id="categoty" class="col-md-12">
					<a href="MasterItemEdit?itemType=all" class="btn btn-raised btn-info">全て</a>　
					<c:forEach var="type" items="${typeList}" varStatus="status">
					<a href="MasterItemEdit?itemType=${type.itemType}" class="btn btn-raised btn-info">${type.name}</a>　
					<c:if test="${status.count == 3}">
					<br><br>
					</c:if>
					</c:forEach>

				<c:if test="${actionMessage != null}">
					<p class="text-danger"><br>${actionMessage}</p>
				</c:if>
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
				    	<td><input type="checkbox" id="${status.index}" name="select_item_id_list" value="${itemList.id}" /> <label for="${status.index}">${itemList.itemType}</label>
						</td>
					    <td><input type="text" class="form-control input-normal" name="${itemList.id}" value="${itemList.name}"></td>
					    <td><input type="text" class="form-control input-normal" name="${itemList.id}" value="${itemList.price}"></td>
					    <td><input type="text" class="form-control input-normal" name="${itemList.id}" value="${itemList.fileName}"></td>
					    <td><input type="text" class="form-control input-normal" name="${itemList.id}" value="${itemList.soket}"></td>
						<td><input type="text" class="form-control input-normal" name="${itemList.id}" value="${itemList.ramType}"></td>
						<td><input type="text" class="form-control input-normal" name="${itemList.id}" value="${itemList.link}"></td>
				    </tr>
				    </div>
				    </c:forEach>
				    <tr><th colspan="2">新商品追加</tr>
				    <tr>
				    <td><select class="form-control" data-style="text-right" name="type_category_id">
						<%-- 商品追加時　アイテムリストを出す、ページ遷移時選択されてるアイテムを選択された状態でリスト化するよう条件分岐 --%>
						<c:forEach var="typeList" items="${typeList}" >
							<c:if test ="${returnItem == typeList.itemType}">
								<option value="${typeList.id}" class="text-right" selected> ${typeList.name}</option>
							</c:if>
							<c:if test ="${returnItem != typeList.itemType}">
								<option value="${typeList.id}" class="text-right"> ${typeList.name}</option>
							</c:if>

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
				<div class="row">
					<div class="col s12">
						<div class="col s4 center-align">
							<button class="btn  waves-effect waves-light  col s6 offset-s3" type="submit" name="confirmButton" value="delete">選択した項目を削除</button>
						</div>
						<div class="col s4 center-align">
							<button class="btn  waves-effect waves-light  col s6 offset-s3" type="submit" name="confirmButton" value="update">選択した項目を更新</button>
						</div>
						<div class="col s4 center-align">
							<button class="btn  waves-effect waves-light  col s6 offset-s3" type="submit" name="confirmButton" value="add">入力した項目を追加</button>
            			</div>
            		</div>
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