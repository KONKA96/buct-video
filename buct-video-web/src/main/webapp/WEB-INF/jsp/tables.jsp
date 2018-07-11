<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>resources/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<!-- Custom CSS -->
<link href="<%=basePath%>resources/css/style.css?v=0.0.2"
	rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="<%=basePath%>resources/css/font-awesome.css"
	rel="stylesheet">
<!-- //font-awesome icons -->
<!-- js-->
<script src="<%=basePath%>resources/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>resources/js/modernizr.custom.js"></script>
<!--webfonts-->
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<!--//webfonts-->
<!--animate-->
<link href="<%=basePath%>resources/css/animate.css" rel="stylesheet"
	type="text/css" media="all">
<script src="<%=basePath%>resources/js/wow.min.js"></script>
<script>
	new WOW().init();
</script>
<!--//end-animate-->
<!-- chart -->
<script src="<%=basePath%>resources/js/Chart.js"></script>
<!-- //chart -->
<!--Calender-->
<%-- <link rel="stylesheet" href="<%=basePath %>resources/css/clndr.css" type="text/css" /> --%>
<script src="<%=basePath%>resources/js/underscore-min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/moment-2.2.1.js"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/clndr.js?v=0.0.2"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/site.js" type="text/javascript"></script>
<!--End Calender-->
<!-- Metis Menu -->
<script src="<%=basePath%>resources/js/metisMenu.min.js"></script>
<script src="<%=basePath%>resources/js/custom.js"></script>
<link href="<%=basePath%>resources/css/custom.css" rel="stylesheet">


<script src="<%=basePath%>resources/js/sweetalert.min.js"></script>
<link href="<%=basePath%>resources/css/sweetalert.css" rel="stylesheet">
</head>
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class=" sidebar" role="navigation">
			<div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left"
					id="cbp-spmenu-s1">
				<ul class="nav" id="side-menu">
					<li><a href="/buct-video-web/login/toIndex"><i
							class="fa fa-home nav_icon"></i>使用数据</a></li>
					<li><a href="widgets.html"><i
							class="fa fa-th-large nav_icon"></i>用户管理 <span
							class="nav-badge-btm"></span></a></li>
					<li><a href="tables.html"><i class="fa fa-table nav_icon"></i>学生管理
					</a></li>
					<li><a href="#"><i class="fa fa-cogs nav_icon"></i>系统配置 <span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="/buct-video-web/login/toSpeakerInfo">个人信息</a></li>
							<li><a href="media.html">密码设置</a></li>
						</ul> <!-- /nav-second-level --></li>
				</ul>
				<div class="clearfix"></div>
				<!-- //sidebar-collapse --> </nav>
			</div>
		</div>
		<!--left-fixed -navigation-->
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--toggle button start-->
				<button id="showLeftPush">
					<i class="fa fa-bars"></i>
				</button>
				<!--toggle button end-->
				<!--logo -->
				<div class="logo">
					<a href="index.html">
						<h1>NOVUS</h1> <span>AdminPanel</span> <%-- <h1><img src="<%=basePath%>resources/images/logo.jpg" alt=""></h1><span>AdminPanel</span> --%>
					</a>
				</div>
				<!--//logo-->
				<!--search-box-->
				<div class="search-box">
					<!-- <form class="input">
						<input class="sb-search-input input__field--madoka"
							placeholder="Search..." type="search" id="input-31" /> <label
							class="input__label" for="input-31"> <svg class="graphic"
								width="100%" height="100%" viewBox="0 0 404 77"
								preserveAspectRatio="none"> <path
								d="m0,0l404,0l0,77l-404,0l0,-77z" /> </svg>
						</label>
					</form> -->
				</div>
				<!--//end-search-box-->
				<div class="clearfix"></div>
			</div>
			<div class="header-right">
				<div class="profile_details_left">
					<!--notifications of menu start -->
					<ul class="nofitications-dropdown">
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"><i class="fa fa-bell"></i><span
								class="badge blue">3</span></a>
							<ul class="dropdown-menu">
								<li>
									<div class="notification_header">
										<h3>You have new notification</h3>
									</div>
								</li>
								<li><a href="#">
										<div class="user_img">
											<img src="<%=basePath%>resources/images/2.png" alt="">
										</div>
										<div class="notification_desc">
											<p>Lorem ipsum dolor amet</p>
											<p>
												<span>1 hour ago</span>
											</p>
										</div>
										<div class="clearfix"></div>
								</a></li>
								<li>
									<div class="notification_bottom">
										<a href="#">See all notifications</a>
									</div>
								</li>
							</ul></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<!--notification menu end -->
				<div class="profile_details">
					<ul>
						<li class="dropdown profile_details_drop"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false">
								<div class="profile_img">
									<span class="prfil-img"><img
										src="<%=basePath%>upload/${speaker.iconImg }" alt=""> </span>
									<div class="user-name">
										<shiro:user>
											<p>
												<shiro:principal />
											</p>
										</shiro:user>
										<span> <c:if test="${speaker.rolePower==0 }">管理员</c:if>
											<c:if test="${speaker.rolePower==1 }">演讲者</c:if>
										</span>
									</div>
									<i class="fa fa-angle-down lnr"></i> <i
										class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>
								</div>
						</a>
							<ul class="dropdown-menu drp-mnu">
								<li><a href="/buct-video-web/login/toSpeakerInfo"><i class="fa fa-user"></i> 个人信息</a></li>
								<li><a href="#"><i class="fa fa-cog"></i> 密码设置</a></li>
								<li><a href="javascript:void(0)" onclick="userLogout()"><i class="fa fa-sign-out"></i> 退出系统</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="tables">
				<h3 class="title1">用户角色列表</h3>
				<div class="main-page">
					<div class="form-two widget-shadow">
						<div class="form-body" data-example-id="simple-form-inline">
							<form class="form-inline">
								<h2 style="display: inline;">
									<a href="#"><span class="label label-success"
										style="font-size: 18px;">新增用户</span></a>
								</h2>

								<h2 style="display: inline">
									<a href="#"><span class="label label-success"
										style="font-size: 18px;">批量导入</span></a>
								</h2>

								<h2 style="display: inline; float: right;">
									<a href="#"><span class="label label-primary"
										style="font-size: 18px;">搜索</span></a>
								</h2>
								<div class="form-group" style="float: right;">
									<input type="text" class="form-control" id="exampleInputName2"
										placeholder="keyword">
								</div>

							</form>
						</div>
					</div>

					<div class="bs-example widget-shadow"
						data-example-id="hoverable-table">
						<h4>Hover Rows Table:</h4>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>性别</th>
									<th>联系方式</th>
									<th>组别</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody1">
							
							</tbody>
						</table>

						<ul class="pagination">
							<li class="disabled"><a href="#" aria-label="Previous"><span
									aria-hidden="true">«</span></a></li>
							<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"><span
									aria-hidden="true">»</span></a></li>
						</ul>
					</div>
				</div>
			</div>


		</div>
		<!--footer-->
		<div class="footer">
			<p>Copyright &copy;</p>
		</div>
		<!--//footer-->
	</div>
	<!-- Classie -->
	<script src="<%=basePath%>resources/js/classie.js"></script>
	<script>
		var menuLeft = document.getElementById('cbp-spmenu-s1'), showLeftPush = document
				.getElementById('showLeftPush'), body = document.body;

		showLeftPush.onclick = function() {
			classie.toggle(this, 'active');
			classie.toggle(body, 'cbp-spmenu-push-toright');
			classie.toggle(menuLeft, 'cbp-spmenu-open');
			disableOther('showLeftPush');
		};

		function disableOther(button) {
			if (button !== 'showLeftPush') {
				classie.toggle(showLeftPush, 'disabled');
			}
		}

		window.onload = function() {
			$
					.ajax({
						url : "/buct-video-web/speaker/showAllSpeaker",
						/* data:, */
						type : "post",
						success : function(data) {
							for (var i = 1; i <= data.speakerList.length; i++) {
								var sex;
								var group = "";
								if (data.speakerList[i - 1].sex == 0) {
									sex = "男";
								} else {
									sex = "女";
								}

								if (data.speakerList[i - 1].group != null) {
									group = data.speakerList[i - 1].group.name
								}
								$("#tbody1")
										.append(
												"<tr><th scope='row'>"
														+ i
														+ "</th><td>"
														+ data.speakerList[i - 1].username
														+ "</td><td>"
														+ data.speakerList[i - 1].truename
														+ "</td><td>"
														+ sex
														+ "</td><td>"
														+ data.speakerList[i - 1].phone
														+ "</td><td>"
														+ group
														+ "</td><td><h3><a href='javascript:void(0)'><span class='label label-warning'>编辑</span></a><a href='javascript:void(0)'><span class='label label-danger'>删除</span></a></h3></td></tr>");
							}
						}
					})
		}
		
		function userLogout(){
			swal({   
				title: "确认要退出了吗？",
				text: "",   
				type: "warning",   
				showCancelButton: true, 
				showConfirmButton: true,
				closeOnConfirm: false,   
				animation: "slide-from-top",   
				inputPlaceholder: "密码",
				confirmButtonText: "确定",
		        cancelButtonText: "取消",
			}, function (){
				$.ajax({
					url:"/buct-video-web/login/userLogout",
					type:"post",
					success:function(data){
						if(data=='success'){
							swal("退出成功!","","success");
							window.href="/buct-video-web/login/toLogin";
						}else{
							swal("退出失败!","请重试","error");
						}
					}
				})
			})
		}
	</script>
	<!--scrolling js-->
	<script src="<%=basePath%>resources/js/jquery.nicescroll.js"></script>
	<script src="<%=basePath%>resources/js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>resources/js/bootstrap.js">
		
	</script>
</body>
</html>