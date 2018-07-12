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
				<%-- <input type="hidden" value="${ }"> --%>
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
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="tables">
				<h3 class="title1">用户角色列表</h3>
				<div class="main-page">
					<div class="form-two widget-shadow">
						<div class="form-body" data-example-id="simple-form-inline">
							<form class="form-inline">
								<button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal" data-target="#exampleModal"
									>新增用户</button>

								<button type="button" class="btn btn-primary btn-lg"
									data-toggle="modal" data-target="#" >批量导入</button>
									
								<button type="button" class="btn btn-success" onclick="addGroup()">Add New Group</button>

								<h2 style="display: inline; float: right;">
									<a href="javascript:void(0)" onclick="loadSpeaker(1)"><span class="label label-primary"
										style="font-size: 18px;">搜索</span></a>
								</h2>
								<div class="form-group" style="float: right;">
									<input type="text" class="form-control" id="keywordInput"
										placeholder="keyword">
								</div>

							</form>
						</div>
					</div>

					<!-- 隐藏弹框 新增用户 -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="exampleModalLabel">New Speaker</h4>
								</div>
								<div class="modal-body">
									<form id="addSpeakerForm">
										<div class="form-group">
											<label for="recipient-name" class="control-label">Username:</label>
											<input type="text" name="username" class="form-control">
										</div>
										<div class="form-group">
											<label for="message-text" class="control-label">Password:</label>
											<input type="password" name="password" class="form-control">
										</div>
										<div class="form-group">
											<label for="message-text" class="control-label">Truename:</label>
											<input type="text" name="truename" class="form-control">
										</div>
										
										<div class="form-group">
											<label for="message-text" class="control-label">Sex:</label>
											<select class="form-control m-b" name="sex">
		                                    		<option value="0" ${speaker.sex==0 ? 'selected' :'' }>男</option>
		                                    		<option value="1" ${speaker.sex==1 ? 'selected' :'' }>女</option>
		                                    </select>
										</div>
										<div class="form-group">
											<label for="message-text" class="control-label">Group:</label>
											<select class="form-control m-b" name="groupId" id="groupSelected">
		                                    </select>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success" onclick="addGroup()">Add New Group</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" onclick="addSpeaker()">Send
										message</button>
								</div>
							</div>
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

						<ul class="pagination" id="pageHelper">
							<!-- <li class="disabled"><a href="#" aria-label="Previous"><span
									aria-hidden="true">«</span></a></li>
							<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"><span
									aria-hidden="true">»</span></a></li> -->
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
			loadGroup();
			loadSpeaker(1);
		}
		
		function loadSpeaker(page){
			var keyword=$("#keywordInput").val();
			
			var sendData="";
			if(keyword!=null && keyword!=''){
				sendData+="truename="+keyword+"&index="+page;
			}else{
				sendData+="index="+page;
			}
			
			$
			.ajax({
				url : "/buct-video-web/speaker/showAllSpeaker",
				data: sendData,
				type : "post",
				success : function(data) {
					$("#tbody1").empty();
					for (var i = 1; i <= data.speakerList.length; i++) {
						var sex;
						var group = "";
						var id=data.speakerList[i - 1].id;
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
												+ "</td><td><h3><a href='javascript:void(0)'><span class='label label-warning'>编辑</span></a><a href='javascript:void(0)' onclick='deleteSpeaker(\""+data.speakerList[i - 1].id+"\")'><span class='label label-danger'>删除</span></a></h3></td></tr>");
					}
					
					/* 加载分页按钮 */
					$("#pageHelper").empty();
					if(data.index<=3){
						$("#pageHelper").append("<li class='disabled'><a href='javascript:void(0)' aria-label='Previous'><span aria-hidden='true'>«</span></a></li>");
						for (var i = 1; i <= 5; i++) {
							if(i==data.index){
								$("#pageHelper").append("<li class='active'><a href='javascript:void(0)' onclick='loadSpeaker("+i+")'>"+i+"<span class='sr-only'>(current)</span></a></li>");
							}else{
								$("#pageHelper").append("<li><a href='javascript:void(0)' onclick='loadSpeaker("+i+")'>"+i+"</a></li>");
							}
						}
					}else{
						$("#pageHelper").append("<li><a href='javascript:void(0)' aria-label='Previous' onclick='loadSpeaker("+(data.index-2)+")'><span aria-hidden='true'>«</span></a></li>");
						for (var i = data.index-2; i <= data.index+2; i++) {
							if(i==data.index){
								$("#pageHelper").append("<li class='active'><a href='javascript:void(0)' onclick='loadSpeaker("+i+")'>"+i+"<span class='sr-only'>(current)</span></a></li>");
							}else{
								$("#pageHelper").append("<li><a href='javascript:void(0)' onclick='loadSpeaker("+i+")'>"+i+"</a></li>");
							}
						}
					}
					$("#pageHelper").append("<li><a href='javascript:void(0)' aria-label='Next' onclick='loadSpeaker("+(data.index+2)+")'><span aria-hidden='true'>»</span></a></li>");
					
					
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
		
		function addGroup(){
			swal({
				title : "请输入新组名",
				text : "",
				type : "input",
				showCancelButton : true,
				closeOnConfirm : false,
				animation : "slide-from-top",
				inputPlaceholder : "组别",
				confirmButtonText : "确定",
				cancelButtonText : "取消",
			}, function(inputValue) {
				$.ajax({
					url : "/buct-video-web/group/updateGroup",
					data : "name="+inputValue,
					type : "post",
					success : function(data) {
						if (data == 'success') {
							swal("添加成功!", "", "success");
						} else if (data == 'exist'){
							swal("添加失败!", "该组别已经存在", "error");
						}else {
							swal("添加失败!", "请重试", "error");
						}
					}
				})
			})
		}
		
		function loadGroup(){
			$.ajax({
				url : "/buct-video-web/group/showAllGroup",
				type : "post",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						$("#groupSelected").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
					}
				}
			})
		}
		
		function addSpeaker(){
			$.ajax({
				url : "/buct-video-web/speaker/updateSpeaker",
				data : $("#addSpeakerForm").serialize(),
				type : "post",
				success : function(data) {
					if (data == 'success') {
						swal({
							title : "删除成功!", 
							text : "", 
							type : "success"
							},function(){
								window.location.reload();
							});
					} else if (data == 'exist'){
						swal("添加失败!", "该用户已经存在", "error");
					}else {
						swal("添加失败!", "请重试", "error");
					}
				}
			})
		}
		
		function deleteSpeaker(id){
			swal({
				title : "你确定要删除这一项吗？",
				text : "",
				type : "warning",
				showCancelButton : true,
				closeOnConfirm : false,
				animation : "slide-from-top",
				inputPlaceholder : "组别",
				confirmButtonText : "确定",
				cancelButtonText : "取消",
			},function(){
				$.ajax({
					url : "/buct-video-web/speaker/deleteSpeaker",
					data : "id="+id,
					type : "post",
					success : function(data) {
						if (data == 'success') {
							swal({
								title : "删除成功!", 
								text : "", 
								type : "success"
								},function(){
									window.location.reload();
								});
						} else {
							swal("删除失败!", "请重试", "error");
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