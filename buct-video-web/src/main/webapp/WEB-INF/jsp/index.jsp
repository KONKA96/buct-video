<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="<%=basePath%>resources/css/style.css" rel='stylesheet'
	type='text/css' />
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
<link rel="stylesheet" href="<%=basePath%>resources/css/clndr.css"
	type="text/css" />
<script src="<%=basePath%>resources/js/underscore-min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/moment-2.2.1.js"
	type="text/javascript"></script>
<script src="<%=basePath%>resources/js/clndr.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/js/site.js" type="text/javascript"></script>
<!--End Calender-->
<!-- Metis Menu -->
<script src="<%=basePath%>resources/js/metisMenu.min.js"></script>
<script src="<%=basePath%>resources/js/custom.js"></script>
<link href="<%=basePath%>resources/css/custom.css" rel="stylesheet">

<script src="<%=basePath%>resources/js/sweetalert.min.js"></script>
<link href="<%=basePath%>resources/css/sweetalert.css" rel="stylesheet">

<link
	href="<%=basePath %>resources/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<script
	src="<%=basePath%>resources/js/bootstrap-datetimepicker.js?v=1.0.1"></script>
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
					<li><a href="/buct-video-web/speaker/toSpeakerIndex"><i
							class="fa fa-th-large nav_icon"></i>用户管理 <span
							class="nav-badge-btm"></span></a></li>
					<li><a href="/buct-video-web/auditor/toAuditorIndex"><i
							class="fa fa-table nav_icon"></i>学生管理 </a></li>
					<li><a href="#"><i class="fa fa-cogs nav_icon"></i>系统配置 <span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="/buct-video-web/login/toSpeakerInfo">个人信息</a></li>
							<li><a href="javascript:void(0)" onclick="resetPwd()">密码设置</a></li>
						</ul> <!-- /nav-second-level --></li>
				</ul>
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
						<h1>NOVUS</h1> <span>AdminPanel</span>
					</a>
				</div>
				<!--//logo-->
				<!--search-box-->
				<div class="search-box">
					<!-- <form class="input">
						<input class="sb-search-input input__field--madoka" placeholder="Search..." type="search" id="input-31" />
						<label class="input__label" for="input-31">
							<svg class="graphic" width="100%" height="100%" viewBox="0 0 404 77" preserveAspectRatio="none">
								<path d="m0,0l404,0l0,77l-404,0l0,-77z"/>
							</svg>
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
								<li><a href="/buct-video-web/login/toSpeakerInfo"><i
										class="fa fa-user"></i> 个人信息</a></li>
								<li><a href="javascript:void(0)" onclick="resetPwd()"><i
										class="fa fa-cog"></i> 密码设置</a></li>
								<li><a href="javascript:void(0)" onclick="userLogout()"><i
										class="fa fa-sign-out"></i> 退出系统</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<div class="row-one">
					<div class="col-md-4 widget">
						<div class="stats-left ">
							<h5>用户使用</h5>
							<h4>时长：</h4>
							<!-- <h5 style="float:right;">较前日：</h5> -->
						</div>
						<div class="stats-right">
							<label id="speakerTime"></label>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 widget states-mdl">
						<div class="stats-left">
							<h5>学生使用</h5>
							<h4>时长：</h4>
						</div>
						<div class="stats-right">
							<label id="auditorTime"></label>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-4 widget states-last">
						<div class="stats-left">
							<h5>总共使用</h5>
							<h4>时长：</h4>
						</div>
						<div class="stats-right">
							<label id="allTime">30</label>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="charts">
				<div class="col-md-12 chrt-page-grids">
					<h4 class="title"></h4>
					<form id="dataForm">
					<div class="form-group" style="float:left;">
						<div class="input-group date form_datetime col-md-5"
							data-date="2018-08-08T05:25:07Z"
							data-date-format="yyyy-mm-dd hh:ii:ss"
							data-link-field="dtp_input1">
							<input id="dateInput" class="form-control" name="time" size="16"
								type="text" value="" onchange="loadEchartsData()" readonly> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span>
						</div>
						<input type="hidden" id="dtp_input1" value="" /><br />
					</div>
					<div class="inbox-page" style="float:left;">
						<div style="float:left;">用户:<input type="checkbox" class="checkbox" name="rolePower" value="1" onclick="loadEchartsData()"> </div>
						<div style="float:left;">学生:<input type="checkbox" class="checkbox" name="rolePower" value="2" onclick="loadEchartsData()"></div>
					</div>

					<div class="form-group" style="float:left;">
						<label for="message-text" class="control-label">时长:</label> <select
							class="form-control m-b" name="interval" onchange="loadEchartsData()">
							<option value="1">1天</option>
							<option value="3">3天</option>
							<option value="7" selected>7天</option>
							<option value="30">30天</option>
						</select>
					</div>
					<canvas id="line" height="400" width="600"
						style="width: 1000px; height: 500px;"></canvas>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<div class="footer">
		<p>Copyright &copy;</p>
	</div>
	<!--//footer-->
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
			loadSpeakerTime();
			loadAuditorTime();
			loadAllTime();

			loadEchartsData();
		}


		function loadSpeakerTime() {
			$.ajax({
				url : "/buct-video-web/echarts/getSpeakerTime",
				data : "rolePower=1",
				type : "post",
				success : function(data) {
					$("#speakerTime").html(data + "/h");
				}
			})
		}

		function loadAuditorTime() {
			$.ajax({
				url : "/buct-video-web/echarts/getSpeakerTime",
				data : "rolePower=2",
				type : "post",
				success : function(data) {
					$("#auditorTime").html(data + "/h");
				}
			})
		}

		function loadAllTime() {
			$.ajax({
				url : "/buct-video-web/echarts/getSpeakerTime",
				type : "post",
				success : function(data) {
					$("#allTime").html(data + "/h");
				}
			})
		}

		function userLogout() {
			swal({
				title : "确认要退出了吗？",
				text : "",
				type : "warning",
				showCancelButton : true,
				showConfirmButton : true,
				closeOnConfirm : false,
				animation : "slide-from-top",
				inputPlaceholder : "密码",
				confirmButtonText : "确定",
				cancelButtonText : "取消",
			}, function() {
				$.ajax({
					url : "/buct-video-web/login/userLogout",
					type : "post",
					success : function(data) {
						if (data == 'success') {
							swal("退出成功!", "", "success");
							window.href = "/buct-video-web/login/toLogin";
						} else {
							swal("退出失败!", "请重试", "error");
						}
					}
				})
			})
		}

		var speakerId = "${speaker.id}";
		function resetPwd() {
			swal({
				title : "请输入旧密码",
				text : "",
				type : "input",
				showCancelButton : true,
				closeOnConfirm : false,
				animation : "slide-from-top",
				inputPlaceholder : "原密码",
				confirmButtonText : "确定",
				cancelButtonText : "取消",
			}, function(inputValue) {
				$.ajax({
					url : "/buct-video-web/speaker/testOldPwd",
					data : "password=" + inputValue,
					type : "post",
					//与原密码进行比对
					success : function(data) {
						//成功匹配，准备输入新密码
						if (data == 'success') {
							inputNewPwdFirst();
						} else {
							//未成功匹配
							swal("与原密码不匹配!", "请重试", "error");
						}
					}
				})
			})
		}

		function inputNewPwdFirst() {
			swal({
				title : "请输入新密码",
				text : "",
				type : "input",
				showCancelButton : true,
				closeOnConfirm : false,
				animation : "slide-from-top",
				inputPlaceholder : "密码",
				confirmButtonText : "确定",
				cancelButtonText : "取消",
			}, function(inputValue) {
				inputNewPwdSecond(inputValue);
			})
		}

		function inputNewPwdSecond(pwd) {
			swal({
				title : "请再次输入新密码",
				text : "",
				type : "input",
				showCancelButton : true,
				closeOnConfirm : false,
				animation : "slide-from-top",
				inputPlaceholder : "密码",
				confirmButtonText : "确定",
				cancelButtonText : "取消",
			}, function(inputValue) {
				if (pwd != inputValue) {
					swal("两次输入密码不一致!", "操作失败", "error");
				} else {
					$.ajax({
						url : "/buct-video-web/speaker/updateSpeaker",
						data : "id=" + speakerId + "&password=" + inputValue,
						type : "post",
						//与原密码进行比对
						success : function(data) {
							//成功匹配，准备输入新密码
							if (data == 'success') {
								swal("添加成功!", "", "success");
							} else {
								//未成功匹配
								swal("添加失败!", "请重试", "error");
							}
						}
					})
				}
			})
		}
		
		
		function loadEchartsData() {
			var lineChartData;
			var names = [];
			var speakerNums = [];
			var auditorNums = [];
			var allUserNums = [];
			
			$.ajax({
				url : "/buct-video-web/echarts/getEchartsData",
				data:$("#dataForm").serialize(),
				type : "post",
				success : function(data) {
					if(data.xAxisData!=null){
						for (var i = 0; i < data.xAxisData.length; i++) {
							names.push(data.xAxisData[i]); //挨个取出类别并填入类别数组
						}
					}
					
					if(data.SpeakerList!=null){
						for (var i = 0; i < data.SpeakerList.length; i++) {
							speakerNums.push(data.SpeakerList[i]); //挨个取出时间并填入数组
						}
					}
					
					if(data.AuditorList!=null){
						for (var i = 0; i < data.AuditorList.length; i++) {
							auditorNums.push(data.AuditorList[i]); 
						}
					}
					
					if(data.AllUserList!=null){
						for (var i = 0; i < data.AllUserList.length; i++) {
							allUserNums.push(data.AllUserList[i]); 
						}
					}
					
					var areaChartCanvas = document.getElementById("line").getContext("2d");
	                var areaChart = new Chart(areaChartCanvas);
	                
	                areaChart.Line({
	                	labels : names,
	        			datasets : [ {
	        				fillColor : "rgba(51, 51, 51, 0)",
	        				strokeColor : "#5153BD",
	        				pointColor : "#5153BD",
	        				pointStrokeColor : "#fff",
	        				data : speakerNums
	        			}, {
	        				fillColor : "rgba(51, 51, 51, 0)",
	        				strokeColor : "#585858",
	        				pointColor : "#585858",
	        				pointStrokeColor : "#fff",
	        				data : auditorNums
	        			}, {
	        				fillColor : "rgba(51, 51, 51, 0)",
	        				strokeColor : "#E04C00",
	        				pointColor : "#E04C00",
	        				pointStrokeColor : "#fff",
	        				data : allUserNums
	        			} ]
	                	
	                })
				}
			})
		}
		
		//日历插件
		$('.form_datetime').datetimepicker({
	        weekStart: 0, //一周从哪一天开始
	        todayBtn:  1, //
	        autoclose: 1,
	        todayHighlight: 1,
	        startView: 0,
	        forceParse: 0,
	        showMeridian: 1
	    });
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