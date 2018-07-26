<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang=jpn>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/favicon.ico">
    <title>PC Robin</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="dist/css/custom.css">

  </head>
  <body class="bg-light">
	<jsp:include page="/baselayout/header.jsp" />
  <main role="main">
      <br><br><br>
    <div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="img/firstslide.png" alt="First slide" class="img-fluid">
            <div class="container">
              <div class="carousel-caption text-right">
              <h1 class="text-dark">Be Stylish!</h1>
              <h5 class="text-light">最新モデルABX　　
              <br/>洗練されたデザインで
              <br/>core i3モデル5万円台から</h5>

              <p><a class="btn btn-lg btn-primary" href="Item?item_id=1" role="button">詳しく見る</a></p>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img src="img/secondslide.png" alt="Third slide" class="img-fluid">
          <div class="container">
            <div class="carousel-caption text-left">
            <h1>Outlet Store</h1>
              <h5 class="text-light">数量限定
              <br>オールインワンモデル
              <br>49,800円から</h5>
              <p><a class="btn btn-lg btn-primary disabled" href="Item?item_id=1" role="button">Comming Soon</a></p>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img src="img/thirdslide.png" alt="Second slide" class="img-fluid">
          <div class="container">
            <div class="carousel-caption text-left">
              <h1 class="text-light">Let's Play!</h1>
              <h5 class="text-dark">ハイスペックXBXモデル<br/>
              発売記念イベント開催！<br/>8/1から</h5>
              <p><a class="btn btn-lg btn-info disabled" href="Item?item_id=1" role="button">Comming Soon</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!--/.carousel -->
  </div>
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <br><br><br>
    <div class="container marketing">
        <div class="row text-center">
        <div class="col-lg-4">
          <p><img class="mx-auto d-block" src="https://png.icons8.com/material/50/000000/coins.png" alt="Generic placeholder image" width="50" height="auto"></p>
          <h2 class="text-center">価格から選ぶ</h2>
          <br>
          <a href="Item?item_id=1">5万円台</a>
          <br>
          <a href="Item?item_id=2">7万円台</a>
          <br>
          <a href="Item?item_id=3">10万円以上</a>
          <br><br>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <p><img class="mx-auto d-block" src="https://png.icons8.com/ios/50/000000/controller-filled.png" alt="Generic placeholder image" width="50" height="auto"></p>
          <h2>用途で選ぶ</h2>
          <br>
          <a href="Item?item_id=4">普段使い用</a>
          <br>
          <a href="Item?item_id=5">ゲーム用</a>
          <br>
          <a href="Item?item_id=6">デザイン用</a>
          <br><br>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <p><img class="mx-auto d-block" src="https://png.icons8.com/material/50/000000/processor.png" alt="Generic placeholder image"  width="50" height="auto"></p>
          <h2>性能で選ぶ</h2>
          <br>
          <a href="Item?item_id=7">intel core i3搭載</a>
          <br>
          <a href="Item?item_id=8">intel core i5搭載</a>
          <br>
          <a href="Item?item_id=9">intel core i7搭載</a>
          <br><br>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
	  <div class="col-12">
        <p><img src="img/trust.png" class="img-fluid"></p>
      </div>

      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">Core™ プロセッサー・ファミリー<span class="text-muted"></span></h2>
          <p class="lead"><br>新しい第 8 世代インテル® Core™ プロセッサー・ファミリー搭載の新しいコンピューターで、デジタル世界を一歩リード。前世代に比べて、性能が劇的に飛躍1,2。鮮やかなゲーミングやコンテンツ制作の体験で、最先端の 4K UHD エンターテインメントに浸りましょう。</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-fluid mx-auto" src="img/intel.png" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading">安心の国内生産<span class="text-muted"></span></h2>
          <p class="lead">
            <br>国内で開発から製造まで一貫して行い、
            <br>高品質な製品をリーズナブルにご提供。
            <br>* 一部モデルは海外製造も行っています。</p>
        </div>
        <div class="col-md-5 order-md-1">
          <img class="featurette-image img-fluid mx-auto" src="img/tokyotrust.png" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">24時間365日の電話サポート<span class="text-muted"></span></h2>
          <p class="lead">
          <br>年中無休のコールセンターが、深夜や土日など、
          <br>パソコントラブルの多い時にもしっかり対応。</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-fluid mx-auto" src="img/operator.jpg" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->

    </div><!-- /.container -->
    </main>

<jsp:include page="/baselayout/footer.jsp" />


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
