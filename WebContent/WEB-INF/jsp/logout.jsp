<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="jpn">
  <head>
<jsp:include page="/baselayout/head.html" />
    <title>ログアウトページ</title>
  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
    <div class="container">
      <div class="py-5 text-center">
       <img class="d-block mx-auto mb-4" src="img/dummy.png" alt="" width="72" height="auto">
              <h4>ログアウトしました</h4>
				  <hr class="mb-4">
            	<a href="Index" class="btn btn-danger btn-lg">TOPページへ</a>
			</div>

<jsp:include page="/baselayout/footer.jsp" />
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>

  </body>
</html>