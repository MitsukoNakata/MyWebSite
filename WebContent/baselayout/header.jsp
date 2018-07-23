<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

   <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
   	<div class="container">
      <a class="navbar-brand" href="Index"><img src="img/logo_w.png" width="70" height=auto></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
        <ul class="navbar-nav">
			<% boolean isLogin = session.getAttribute("isLogin")!=null?(boolean) session.getAttribute("isLogin"):false; %>

			<%--li class="nav-item"><a class="nav-link" href="Cart"><img src="img/cart.png"> Cart</a></li--%>
			<%if(isLogin){ %>
			<li class="nav-item"><a class="nav-link" href="UserData"><img src="img/mypage.png"> My Account</a></li>
			<%}else{ %>
			<li class="nav-item"><a class="nav-link" href="Regist"><img src="img/regist.png"> New</a></li>
			<%} %>
			<%if(isLogin){ %>
			<li class="nav-item"><a class="nav-link" href="Logout"><img src="img/logout.png"> Logout</a></li>
			<%}else{ %>
			<li class="nav-item"><a class="nav-link" href="Login"><img src="img/login.png"> Login</a></li>
			<%} %>
		</ul>
<!--         <form class="form-inline mt-2 mt-md-0">
          <input class="form-control form-control-sm mr-sm-2" type="text" placeholder="例:core i7" aria-label="Search">
        </form> -->
      </div>
     </div>
    </nav>