<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<title>システムエラー</title>

</head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />

	<div class="container">
        <img class="d-block mx-auto mb-4" src="img/dummy.png" alt="" width="72" height="auto">
		<div class="row">
			<div class="col s8 offset-s2">
				<div class="card grey lighten-5">
					<div class="card-content">
						<div class="row center">
							<h4 class="red-text">システムエラーが発生しました</h4>
							<p></p>
							<h5 class="red-text">${errorMessage}</h5>
						</div>
						<div class="row">
							<div class="col s12">
								<p class="center-align">
									<a href="Index" class="btn btn-large waves-effect waves-light  col s8 offset-s2">TOPページへ</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/baselayout/footer.jsp" />
	</div>


</body>
</html>