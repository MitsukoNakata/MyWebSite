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
 .card .card-header a[data-toggle="collapse"] {
  display: block;
  padding: .75rem 1.25rem;
  margin: -.75rem -1.25rem;
}
.card .card-header a[data-toggle="collapse"]:active,
.card .card-header a[data-toggle="collapse"]:hover,
.card .card-header a[data-toggle="collapse"]:focus {
  text-decoration: none; //リンクテキストの下線を消す
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
			<c:forEach var="customMenu" items="${customMenuList}" varStatus="status"> <!-- customMenu →カテゴリー別のカスタマイズの一覧-->
			  <div class="card">
			    <div class="card-header" id="${status.index}head">
			      <h6 class="mb-0">
			      	<input type="checkbox" id="${status.index}" name="select_item_id_list" value="${customMenu.id}" />
			      	 <label for="${status.index}">
			        【カテゴリー】：${customMenu.customType}　　　</label>【カスタム名】：${customMenu.customName}　　　【構成価格】:<fmt:formatNumber>${customMenu.price}</fmt:formatNumber>円　　<a data-toggle="collapse" href="#${customMenu.id}collapse">詳細</a>

			      </h6>
			    </div>
			    <div id="${customMenu.id}collapse" class="collapse" aria-labelledby="${status.index}head" data-parent="#accordion">
			      <div class="card-body">
			<div id="categoty" class="col-md-12">
				<h6>カスタム詳細</h6>
				<table class="table table-bordered">
				  <thead>
				  <tr>
				 	<th>
				 	<select class="form-control" data-style="text-right" name="${customMenu.id}">
				    		<c:forEach var="custom" items="${customList}">　<!-- custom →カスタマイズカテゴリーリスト -->
				    			<c:if test ="${customMenu.customType == custom.customType}">
				    				<option value="${custom.customTypeNum}" class="text-right" selected>カスタムカテゴリ：${custom.customType}</option>
				    			</c:if>
				    			<c:if test ="${customMenu.customType != custom.customType}">
				    				<option value="${custom.customTypeNum}" class="text-right">カスタムカテゴリ：${custom.customType}</option>
				    			</c:if>
				    		</c:forEach>
					</select>
					</th>
					<th><input type="text" class="form-control input-normal" value="${customMenu.customName}" name="${customMenu.id}"></th>
				</tr>
				</thead>
				    <tr>
				      <th>パーツ名</th>
				      <th>商品名</th>
				    </tr>
				  <tbody>
				  	<c:forEach var="type" items="${typeList}" >　　<!-- type 各パーツのリスト 例）base,cpuなど -->
				    <tr>
				    <td>
				    	${type.name}
					</td>
					<%-- 商品追加時　アイテムリストを出す、ページ遷移時選択されてるアイテムを選択された状態でリスト化するよう条件分岐 --%>
				    <td>
				    	<select class="form-control" data-style="text-right" name="${customMenu.id}">
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
			<!-- 折りたたみ終了 -->
			<div id="categoty" class="col-md-12">
				新商品追加
				<table class="table table-bordered table-striped">
				  <thead>
				  <tr>
				  	<th>
				 	 <select class="form-control" data-style="text-right" name="newCustomMenu">
				    		<c:forEach var="custom" items="${customList}">
				    			<c:if test ="${returnItem == custom.customType}">
				    				<option value="${custom.customTypeNum}" class="text-right" selected>カスタムカテゴリ：${custom.customType}</option>
								</c:if>
								<c:if test ="${returnItem != custom.customType}">
				    				<option value="${custom.customTypeNum}" class="text-right">カスタムカテゴリ：${custom.customType}</option>
								</c:if>
				    		</c:forEach>
					</select>
					</th>
					<th colspan="2">
					<input type="text" class="form-control input-normal" placeholder="カスタマイズ名を入力" name="newCustomMenu">
					</th>
				</tr>
				</thead>
				  <tbody>
				  	<c:forEach var="type" items="${typeList}" >
				    	<tr>
				   	 		<td>
				   	 			${type.name}
							</td>
				    		<td>
					    		<select class="form-control" data-style="text-right" name="newCustomMenu">
					    		<c:set var="itemType" value="${type.itemType}" />
					    			<option value="" selected></option>
				    			<c:forEach var="item" items="${requestScope[itemType]}">
					    			<option value="${item.id}" class="text-right">${item.price}円　${item.name}</option>
					    		</c:forEach>
								</select>
				    		</td>
				    	</tr>
				   </c:forEach>
				  </tbody>
				 </table>
				 </div>

				<div class="row">
					<div class="col-md-12">
						<div class="col s4 center-align">
							<button class="btn  waves-effect waves-light offset-s4" type="submit" name="confirmButton" value="delete">選択した項目を削除</button>
						</div>
						<div class="col s4 center-align">
							<button class="btn  waves-effect waves-light offset-s4" type="submit" name="confirmButton" value="update">選択した項目を更新</button>
						</div>
						<div class="col s4 center-align">
							<button class="btn  waves-effect waves-light offset-s4" type="submit" name="confirmButton" value="add">入力した項目を追加</button>
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