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
    <title>商品カスタマイズ</title>
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
          <li class="nav-item">
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
		<p>HPのオールインワンパソコンが新しく生まれ変わりました。
    <br>奥行きわずか19cmのコンパクト筐体にインテリアにもなる落ち着きのあるデザイン。
    <br>第8世代インテル® Core™ i7プロセッサーを搭載可能、優れたパフォーマンスを発揮します。
    <br>今ならメモリー8GBモデルが大変オトクです。</p>
		</div>
		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><h4>基本構成</h><br></div>

		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><img src="img/custom/01_base.png"></div>
			<div id="categoty" class="col-md-9">

				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"><p>ベースモデル</p></th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">
				      	<div class="form-check">
 					 		<input class="form-check-input" type="radio" name="base" id="abx2018" value="option1" checked>
 					 			<label class="form-check-label" for="base">
				      				オールインワンモデルABX-2018年版</th>
				      			</label>
				      	</div>
				      <td>標準</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><img src="img/custom/02_cpu.png"></div>
			<div id="categoty" class="col-md-9">

				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"><p>プロセッサ</p></th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">
				      	<div class="form-check">
 					 		<input class="form-check-input" type="radio" name="cpu" id="corei3" value="option4" checked>
 					 			<label class="form-check-label" for="corei3">
				      				インテル Core i3-8100(3.60GHz/4コア/4スレッド/6MB)</th>
				      			</label>
				      	</div>
				      <td>標準</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="cpu" id="corei5" value="option2">
						  <label class="form-check-label" for="corei5">
				      		インテル Core i5-8400(2.80GHz/TB時最大4.00GHz/6コア/6スレッド9MBキャッシュ)</th>
				      	  </label>
				      	</div>
				      <td>+8,000円</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="cpu" id="corei7" value="option2">
						  <label class="form-check-label" for="corei7">
				      インテル Core i7-8700K(3.70GHz/TB時最大4.70GHz/6コア/12スレッド/12MB) </th>
				        </label>
				      	</div>
				      <td>+16,000円</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><img src="img/custom/03_ram.png"></div>
			<div id="categoty" class="col-md-9">

				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"><p>メモリ</p></th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">
				      	<div class="form-check">
 					 		<input class="form-check-input" type="radio" name="ram" id="ram4gb" value="option1" checked>
 					 			<label class="form-check-label" for="am4gb">
				      				4GB (4GBx1) PC4-17000 (2133MHz)</th>
				      			</label>
				      	</div>
				      <td>標準</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="ram" id="am8gb" value="option2">
						  <label class="form-check-label" for="am8gb">
				      	    8GB (8GBx1) PC4-17000 (2133MHz)</th>
				      	   </label>
				      	</div>
				      <td>+8,000円</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="ram" id="am16gb" value="option2">
						  <label class="form-check-label" for="am16gb">
				      	     16GB (8GBx2) PC4-17000 (2133MHz)</th>
				      	  </label>
				      	</div>
				      <td>+16,000円</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><img src="img/custom/05_graphics.png"></div>
			<div id="categoty" class="col-md-9">

				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"><p>グラフィックス</p></th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">
				      	<div class="form-check">
 					 		<input class="form-check-input" type="radio" name="graphics" id="intelhd" value="option1" checked>
 					 			<label class="form-check-label" for="intelhd">
				      				インテルHDグラフィックス(プロセッサー内蔵)</th>
				      			</label>
				      	</div>
				      <td>標準</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="graphics" id="radeon" value="option2">
						  <label class="form-check-label" for="radeon">
				      		AMD Radeon™ 530</th>
				        </label>
				      	</div>
				      <td>+8000円</td>
				    </tr>

				  </tbody>
				</table>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><img src="img/custom/04_storage.png"></div>
			<div id="categoty" class="col-md-9">

				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"><p>ストレージ</p></th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>

				      <th scope="row">
				      	<div class="form-check">
 					 		<input class="form-check-input" type="radio" name="storage" id="500GB" value="option1" checked>
 					 			<label class="form-check-label" for="500GB">
				      				500GB ハードドライブ (SATA, 7200回転)</th>
				      			</label>
				      	</div>
				      <td>標準</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="storage" id="1TB" value="option2">
						  <label class="form-check-label" for="1TB">
				  	   			 1TB ハードドライブ (SATA, 7200回転)</th>
				  	      </label>
				      	</div>
				      <td>+8000円</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="storage" id="1TBSSD" value="option2">
						  <label class="form-check-label" for="1TBSSD">
				      128GB M.2 SSD (SATA NVMe)　＋<br>
 						1TB ハードドライブ (SATA, 5400回転)</th>
 						  </label>
				      	</div>
				      <td>+16000円</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><img src="img/custom/06_os.png"></div>
			<div id="categoty" class="col-md-9">

				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"><p>OS</p></th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">
				      	<div class="form-check">
 					 		<input class="form-check-input" type="radio" name="os" id="10home" value="option1" checked>
 					 			<label class="form-check-label" for="10home">
				                  Windows 10 Home (64bit)</th>
				               </label>
				      	</div>
				      <td>標準</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="os" id="10busi" value="option2">
						  <label class="form-check-label" for="10busi">
				      		Windows 10 Business (64bit)</th>
				          </label>
				      	</div>
				      <td>+8000円</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="os" id="10ulti" value="option2">
						  <label class="form-check-label" for="10ulti">
				      Windows 10 Ultimate (64bit)</th>
				      	  </label>
				      	</div>
				      <td>+16000円</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div id="img" class="col-md-3"><img src="img/custom/07_office.png"></div>
			<div id="categoty" class="col-md-9">

				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"><p>オフィス</p></th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">
				      	<div class="form-check">
 					 		<input class="form-check-input" type="radio" name="office" id="nooffice" value="option1" checked>
 					 			<label class="form-check-label" for="nooffice">
				      		なし</th>
				      	  </label>
				      	</div>
				      <td>標準</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="office" id="officepersonal" value="option2">
						  <label class="form-check-label" for="officepersonal">
				      		Microsoft Office Personal Premium</th>
				        </label>
				      	</div>
				      <td>+16800円</td>
				    </tr>
				    <tr>
				      <th scope="row">
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="office" id="officehb" value="option2">
						  <label class="form-check-label" for="officehb">
				      			Microsoft Office Home & Business Premium</th>
				      	  </label>
				      	</div>
				      <td>+22400円</td>
				    </tr>
				  </tbody>
				</table>
			</div>
			</div><!--/.row-->
			<div class="float-right">
			<a href="cart.html">
			<button type="button" class="btn btn-danger btn-lg">
        カートへ<img src="https://png.icons8.com/material/50/000000/shopping-cart.png"　width="20" height="30"></button></div>



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
