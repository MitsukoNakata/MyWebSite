<!doctype html>
<html lang=jpn>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="dist/css/bootstrap.min.css">
     <link href="css/form-validation.css" rel="stylesheet">

    <link rel="shortcut icon" href="img/pcrobinfavicon.ico">
    <title>カート</title>
  </head>
    <body class="bg-light">
    <header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-info">
      <a class="navbar-brand" href="index.html"><img src="img/logo_w.png" width="113" height=auto></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">

        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">ホーム<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="cart.html">カート</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.html">会員ログイン</a>
          </li>
        </ul>
        <form class="form-inline mt-2 mt-md-0">
          <input class="form-control mr-sm-2" type="text" placeholder="例:core i7" aria-label="Search">
          <button class="btn btn-light" type="submit">検索</button>
        </form>
      </div>
    </nav>
  </header>

  <div class ="container">
		<div class="py-5 text-center">
        	<img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        	<h2>カートの中身</h2>
        </div>
        <div class="container">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">商品名</th>
              <th scope="col">単価</th>
              <th scope="col">数量</th>
              <th scope="col">金額</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td> <!--カスタマイズした商品詳細-->
              <h4>オールインワンモデルABX</h4>
              <p>・インテル Core i3-7100U　(2.40GHz / 2コア・4スレッド / 3MB) </p>
              <p>・4GB (4GBx1) PC4-17000 (2133MHz)</p>
              <p>・インテルHDグラフィックス(プロセッサー内蔵)</p>
              <p>・500GB ハードドライブ (SATA, 7200回転)</p>
              <p>・Windows 10 Home (64bit)</p>
              <p>・Microsoft Office Personal Premium</p>
              </td>
              <td>¥59,800</td>
              <td>1</td>
              <td>¥59,800</td>
            </tr>
            <tr>
              <td>Z3700 ワイヤレスマウス (スウィート ハート)</td>
              <td>¥2,700</td>
              <td>1</td>
              <td>¥2,700</td>
            </tr>
            <tr>
              <td></td>
              <th>配送方法</th>
              <td>通常配送</td>
              <td>¥0</td>
            </tr>
            <tr>
              <td></td>
              <td></td>
              <th>合計金額</td>
              <td>¥62,500</td>
            </tr>

          </tbody>
        </table>
      </div>
      <div class="float-right">
			<a href="buy.html">
			<button type="button" class="btn btn-danger btn-lg">
        購入・注文へ</button></div>
	</div><!--/.container-->


      <br><br><br>
      <p class="text-center mt-5 mb-3 text-muted">&copy; 2018</p>

            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="ttps://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><\/script>')</script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
      <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
    </body>
  </html>
