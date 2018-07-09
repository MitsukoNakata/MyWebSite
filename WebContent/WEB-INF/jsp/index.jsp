<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang=jpn>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <link rel="shortcut icon" href="img/pcrobinfavicon.ico">


    <title>PC Robin</title>
  </head>
  <body class="bg-light">
    <header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info">
      <a class="navbar-brand" href="Index"><img src="img/logo_w.png" width="113" height=auto></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">

        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="Index">ホーム<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Cart">カート</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Login">会員ログイン</a>
          </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
          <input class="form-control mr-sm-2" type="text" placeholder="例:core i7" aria-label="Search">
          <button class="btn btn-light" type="submit">検索</button>
        </form>
      </div>
    </nav>
  </header>

  <main role="main">
      <br><br>
    <!--div class="container"-->
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
              <div class="carousel-caption text-left">
              <h1 class="text-dark">最新モデルABX</h1>
              <p class="text-dark">core i3モデル5万円台から</p>
              <p><a class="btn btn-lg btn-primary" href="item.html" role="button">詳しく見る</a></p>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img src="img/secondslide.png" alt="Second slide" class="img-fluid">
          <div class="container">
            <div class="carousel-caption text-right">
              <h1>スタイリッシュ</h1>
              <p class="text-dark">オールインワンモデル59,800円から</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">詳しく見る</a></p>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img src="img/firstslide.png" alt="Third slide" class="img-fluid">
          <div class="container">
            <div class="carousel-caption text-left">
              <h1 class="text-dark">One more for good measure.</h1>
              <p class="text-dark">Cras justo odio, dapibus a</p>
              <p><a class="btn btn-lg btn-info" href="#" role="button">詳しく見る</a></p>
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
  <!--/div-->

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <br><br><br>
    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="col-12">
        <p><img src="img/trust.png" class="img-fluid"></p>
      </div>
        <div class="row text-center">
        <div class="col-lg-4">
          <p><img class="mx-auto d-block" src="https://png.icons8.com/material/50/000000/coins.png" alt="Generic placeholder image" width="50" height="auto"></p>
          <h2 class="text-center">価格から選ぶ</h2>
          <br>
          <a href="item.html">5万円台</a>
          <br>
          <a href="item.html">7万円台</a>
          <br>
          <a href="item.html">10万円以上</a>
          <br><br>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <p><img class="mx-auto d-block" src="https://png.icons8.com/ios/50/000000/controller-filled.png" alt="Generic placeholder image" width="50" height="auto"></p>
          <h2>用途で選ぶ</h2>
          <br>
          <a href="item.html">普段使い用</a>
          <br>
          <a href="item.html">ゲーム用</a>
          <br>
          <a href="item.html">デザイン用</a>
          <br><br>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <p><img class="mx-auto d-block" src="https://png.icons8.com/material/50/000000/processor.png" alt="Generic placeholder image"  width="50" height="auto"></p>
          <h2>性能で選ぶ</h2>
          <br>
          <a href="item.html">intel core i3搭載</a>
          <br>
          <a href="item.html">intel core i5搭載</a>
          <br>
          <a href="item.html">intel core i7搭載</a>
          <br><br>
          <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


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

    <!-- FOOTER -->
    <footer class="container">
      <p class="float-right"><a href="#">Back to top</a></p>
      <p>&copy; 2017-2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>


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
