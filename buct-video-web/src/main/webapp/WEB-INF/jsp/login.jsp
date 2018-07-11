<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath %>resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=basePath %>resources/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="<%=basePath %>resources/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="<%=basePath %>resources/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath %>resources/js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="<%=basePath %>resources/css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="<%=basePath %>resources/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="<%=basePath %>resources/js/metisMenu.min.js"></script>
<script src="<%=basePath %>resources/js/custom.js"></script>
<link href="<%=basePath %>resources/css/custom.css" rel="stylesheet">
</head>
<body class="cbp-spmenu-push">

	<div id="page-wrapper">
		<div class="main-page login-page ">
			<h3 class="title1">SignIn Page</h3>
			<div class="widget-shadow">
				<div class="login-top">
					<h4>
						Welcome back to Novus AdminPanel ! <br> Not a Member? <a
							href="signup.html"> Sign Up »</a>
					</h4>
				</div>
				<div class="login-body">
					<form id="editForm">
						<input type="text" class="user" name="username"
							placeholder="Enter your email" required="">
					    <input type="password" name="password" class="lock"
							placeholder="password"> 
						<h3>
							<button class="label label-primary" onclick="userLogin()">Sign In</button>
						</h3>
						<div class="forgot-grid">
							<label class="checkbox"><input type="checkbox"
								 checked=""><i></i>Remember me</label>
							<div class="forgot">
								<a href="#">forgot password?</a>
							</div>
							<div class="clearfix"></div>
						</div>
					</form>
				</div>
			</div>

			<div class="login-page-bottom">
				<h5>- OR -</h5>
				<div class="social-btn">
					<a href="#"><i class="fa fa-facebook"></i><i>Sign In with
							Facebook</i></a>
				</div>
				<div class="social-btn sb-two">
					<a href="#"><i class="fa fa-twitter"></i><i>Sign In with
							Twitter</i></a>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<%=basePath %>resources/js/classie.js"></script>
		<script>
			/* var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			
			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			} */
			
			
			function userLogin(){
				$.ajax({
					url:"/buct-video-web/login/userLogin",
					data:$("#editForm").serialize(),
					type:"post",
					success:function(data){
						if(data=='success'){
							alert("登录成功！");
							window.href="/buct-video-web/login/toIndex";
						}else{
							alert("登录失败");
						}
					}
				})
			}
		</script>
	<!--scrolling js-->
	<script src="<%=basePath %>resources/js/jquery.nicescroll.js"></script>
	<script src="<%=basePath %>resources/js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="<%=basePath %>resources/js/bootstrap.js"> </script>
</html>