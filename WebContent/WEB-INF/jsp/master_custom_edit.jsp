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
</style>
    <title>商品カスタマイズ</title>
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
		<div class="py-5 text-center">

        	<img class="d-block mx-auto mb-4" src="img/dummy.png" alt="" width="72" height="auto">
        	<h4>カスタムメニューの追加・削除・編集</h4>
        	<div id="categoty" class="col-md-12">
								<a href="MasterCustomEdit?customType=all" class="btn btn-raised btn-info">全て</a>　
								<c:forEach var="custom" items="${customList}" varStatus="status">
								<a href="MasterCustomEdit?customType=${custom.customType}" class="btn btn-raised btn-info">${custom.customType}</a>　
									<c:if test="${status.count == 3}">
									<br><br>
									</c:if>
								</c:forEach>

				<c:if test="${actionMessage != null}">
					<p class="text-danger"><br>${actionMessage}</p>
				</c:if>
			</div>

        </div>
        <form action="MasterCustomEditResult" method="POST">
		<div class="container">
			<div id="accordion">
			<c:forEach var="customMenu" items="${customMenuList}"> <!-- customMenu →カテゴリー別のカスタマイズの一覧-->
			  <div class="card">
			    <div class="card-header" id="headingOne">
			      <h6 class="mb-0">
			        【カテゴリー】：${customMenu.customType}　　　【カスタム名】：${customMenu.customName}　　　【構成価格】:<fmt:formatNumber>${customMenu.price}</fmt:formatNumber>円　　<a data-toggle="collapse" href="#${customMenu.id}">詳細</a>
			      </h6>
			    </div>
			    <div id="${customMenu.id}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
			      <div class="card-body">
			<div id="categoty" class="col-md-12">
				<table class="table table-bordered">
				  <thead>
				  <tr>
				  	<th>カスタム詳細</th>
				 	<th><select class="form-control" data-style="text-right" name="type_category_id">
				    		<c:forEach var="custom" items="${customList}">　<!-- custom →カスタマイズカテゴリーリスト -->
				    			<c:if test ="${customMenu.customType == custom.customType}">
				    				<option value="${custom.customType}" class="text-right" selected>カスタムカテゴリ：${custom.customType}</option>
				    			</c:if>
				    			<c:if test ="${customMenu.customType != custom.customType}">
				    				<option value="${custom.customType}" class="text-right">カスタムカテゴリ：${custom.customType}</option>
				    			</c:if>
				    		</c:forEach>
					</select>
					</th>
				</tr>
				</thead>
				    <tr>
				      <th>パーツ名</th>
				      <th>商品名</th>
				    </tr>

				  <tbody>
				  	<c:forEach var="type" items="${typeList}" >　　<!-- type 各パーツのリスト　base,cpuなど -->
				    <tr>
				    <td>
				    	${type.name}
						<%-- 商品追加時　アイテムリストを出す、ページ遷移時選択されてるアイテムを選択された状態でリスト化するよう条件分岐 --%>
					</td>
				    <td>
				    	<select class="form-control" data-style="text-right" name="type_category_id">
				    		<c:set var="itemType" value="${type.itemType}" />
				    		<c:forEach var="item" items="${requestScope[itemType]}" >
				    			<c:if test="${customMenu[itemType] == item.id }">
				    				<option value="${item.id}" class="text-right" selected>${item.price}円　${item.name}</option>
				    			</c:if>
				    			<c:if test="${customMenu[itemType] != item.id }">
				    				<option value="${item.id}" class="text-right">${item.price}円　${item.name}</option>
				    			</c:if>
				    		</c:forEach>
						</select>
				    </td>
				    </tr>
				  </c:forEach>
				  </tbody>
				 </table>
				 </div>
			      </div>
			    </div>
			  </div>
			</c:forEach>
			</div>

			<div id="categoty" class="col-md-12">
				<table class="table table-bordered">
				  <thead>
				  <tr>
				  	<th>新商品追加</th>
				 	<th><select class="form-control" data-style="text-right" name="type_category_id">
				    		<c:forEach var="custom" items="${customList}">
				    			<option value="${custom.customType}" class="text-right">カスタムカテゴリ：${custom.customType}</option>
				    		</c:forEach>
					</select>
					</th>
				</tr>
				</thead>

				    <tr>
				      <th>パーツ名</th>
				      <th>商品名</th>
				    </tr>

				  <tbody>
				    <tr>
				    <td>
				    	<select class="form-control" data-style="text-right" name="type_category_id">
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
				    <td>
				    	<select class="form-control" data-style="text-right" name="type_category_id">
				    		<c:forEach var="cpuList" items="${cpu}" >
				    			<option value="${cpuList.id}" class="text-right">${cpuList.price}円　${cpuList.name}</option>
				    		</c:forEach>
						</select>
				    </td>
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