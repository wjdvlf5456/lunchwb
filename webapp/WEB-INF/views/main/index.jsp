<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>장바구니-로그인 전</title>
<meta name="og:type" content="article">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&amp;display=swap">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/css/alert.css">
<link rel="stylesheet" href="assets/css/basket-aside.css">
<link rel="stylesheet" href="assets/css/Bootstrap-4---Product-List.css">
<link rel="stylesheet" href="assets/css/Bootstrap-4-Calendar-No-Custom-Code.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/Contact-Form-v2-Modal--Full-with-Google-Map.css">
<link rel="stylesheet" href="assets/css/custom-buttons.css">
<link rel="stylesheet" href="assets/css/dh-row-text-image-right-responsive.css">
<link rel="stylesheet" href="assets/css/dh-row-titile-text-image-right-1.css">
<link rel="stylesheet" href="assets/css/genie-modal.css">
<link rel="stylesheet" href="assets/css/group.css">
<link rel="stylesheet" href="assets/css/HTML-layout-with-an-unordered-list.css">
<link rel="stylesheet" href="assets/css/ListeBien-listebien.css">
<link rel="stylesheet" href="assets/css/ListeBien.css">
<link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css">
<link rel="stylesheet" href="assets/css/random.css">
<link rel="stylesheet" href="assets/css/storeinfo.css">
<link rel="stylesheet" href="assets/css/storeList.css">
<link rel="stylesheet" href="assets/css/style-jw.css">
<link rel="stylesheet" href="assets/css/user.css">
<link rel="stylesheet" href="assets/css/visited.css">
<link rel="stylesheet" href="assets/css/vote.css">
<link rel="stylesheet" href="assets/css/yogiyo.css">
</head>

<body>
	<div id="wrapper">
		<nav
			class="navbar navbar-light bg-white text-center d-xxl-flex align-items-start justify-content-xxl-center sidebar accordion p-0"
			id="basket-aside" style="position: static; display: grid; min-width: 300px;">
			<div class="container-fluid d-flex flex-column p-0">
				<img data-bss-hover-animate="pulse" id="bujang-logo" class="no-drag" width="159" height="38"
					src="assets/img/assets/img/bujang-logo%20blue.png" href="header+aside+footer.html"
					style="margin-bottom: 11px;">
				<div style="background: var(- -bs-gray-200); padding: 20px 0; margin: 0 0 20px 0;">
					<span class="d-inline-block" style="color: #000000; font-weight: bold; font-size: 19px;">오늘
						점심 뭐 먹지?</span><span class="d-inline-block"><span class="d-inline-block"
						style="font-size: 13px; color: var(- -bs-blue); font-weight: bold;">월요일</span><span
						class="d-inline-block" style="font-size: 13px; color: var(- -bs-gray-900);">에는 중국집에 가는
							회원들이 많아요</span></span>
				</div>
				<div id="aside-login-area">
					<span class="d-inline-block"
						style="color: var(- -bs-gray-900); font-size: 13px; margin: 0 0 10px 0;">로그인을 하면 취향에 맞는
						식당을 추천해드려요</span><span class="d-inline-block"
						style="background: var(- -bs-blue); color: rgb(255, 255, 255); font-weight: bold; border-radius: 3px; padding: 10px 80px;">로그인하기</span>
					<div style="margin: 5px 0 5px 0;">
						<span class="d-inline-block"
							style="color: var(- -bs-gray-900); font-size: 12px; width: auto; margin: 0 20px 0 0;">회원가입</span><span
							class="d-inline-block"
							style="color: var(- -bs-gray-900); font-size: 12px; width: auto; margin: 0 0 0 10px;">비밀번호
							찾기</span>
					</div>
				</div>
				<div style="width: 100%;">
					<div class="text-start d-flex"
						style="font-weight: bold; color: rgb(0, 0, 0); background: var(- -bs-gray-200); margin-top: 10px; padding-top: 10px; padding-bottom: 10px; padding-left: 20px;">
						<span class="d-inline-block">오늘의 점심 후보</span>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr></tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 100%; padding: 10px;" colspan="2"><i class="fas fa-filter"
										style="background: #eaecf4; color: var(- -bs-dark); padding: 9.5px; border-radius: 5px; font-size: 13px; margin-left: 13px;"></i>
										<button class="btn btn-primary d-inline-block" type="button"
											style="border-radius: 5px; font-size: 12px; padding: 6px 40px; margin-top: -1px; margin-left: 6px; margin-right: 13px; color: var(- -bs-gray-900); background: #eaecf4; font-weight: bold; border-color: #eaecf4;">다른
											가게 추천 받기</button></td>
								</tr>
								<tr>
									<td class="d-xxl-flex justify-content-xxl-start" style="display: table-cell !important;">
										<div style="margin-left: 13px; margin-top: 5px; margin-right: 0; margin-bottom: 5px;">
											<span class="text-start"
												style="color: rgb(14, 14, 14); font-weight: bold; font-size: 14px; display: block;">써브웨이
												서울대점</span><span class="text-start"
												style="font-size: 14px; color: rgb(62, 62, 65); display: block;">샌드위치 / 251m</span>
										</div>
									</td>
									<td style="width: 5%; min-width: 5%; max-width: 5%; display: table-cell;"><i
										class="fas fa-minus-circle d-xxl-flex"
										style="color: var(- -bs-gray-500); display: flex; margin-right: 15px; margin-top: 19px;"></i></td>
								</tr>
								<tr>
									<td class="d-xxl-flex justify-content-xxl-start" style="display: table-cell !important;">
										<div style="margin-left: 13px; margin-top: 5px; margin-right: 0; margin-bottom: 5px;">
											<span class="text-start"
												style="color: rgb(14, 14, 14); font-weight: bold; font-size: 14px; display: block;">맥도날드
												신림점</span><span class="text-start"
												style="font-size: 14px; color: rgb(62, 62, 65); display: block;">햄버거 / 320m</span>
										</div>
									</td>
									<td style="width: 5%; min-width: 5%; max-width: 5%; display: table-cell;"><i
										class="fas fa-minus-circle d-xxl-flex"
										style="color: var(- -bs-gray-500); display: flex; margin-right: 15px; margin-top: 19px;"></i></td>
								</tr>
								<tr>
									<td class="d-xxl-flex justify-content-xxl-start" style="display: table-cell !important;">
										<div style="margin-left: 13px; margin-top: 5px; margin-right: 0; margin-bottom: 5px;">
											<span class="text-start"
												style="color: rgb(14, 14, 14); font-weight: bold; font-size: 14px; display: block;">양자강</span><span
												class="text-start" style="font-size: 14px; color: rgb(62, 62, 65); display: block;">중국요리
												/ 520m</span>
										</div>
									</td>
									<td style="width: 5%; min-width: 5%; max-width: 5%; display: table-cell;"><i
										class="fas fa-minus-circle d-xxl-flex"
										style="color: var(- -bs-gray-500); display: flex; margin-right: 15px; margin-top: 19px;"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<button class="btn btn-primary" type="button"
					style="padding: 6px 20px; font-size: 12px; background: var(- -bs-blue); border-color: var(- -bs-blue);">랜덤선택</button>
			</div>
		</nav>
		<div class="d-flex flex-column" id="content-wrapper" style="position: relative;">
			<div id="header-1">
				<nav
					class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top"
					id="header" style="margin: 0;">
					<div class="container">
						<div></div>
						<ul class="navbar-nav d-xxl-flex align-items-xxl-center">
							<li class="nav-item dropdown no-arrow" id="user-alert"><a
								class="dropdown-toggle nav-link nav-link" aria-expanded="false" data-bs-toggle="dropdown"><span
									class="badge bg-danger badge-counter">3</span><i class="fas fa-bell fa-fw"></i></a>
								<div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
									<h6 class="dropdown-header">alerts center</h6>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="me-3">
											<div class="bg-primary icon-circle">
												<i class="fas fa-file-alt text-white"></i>
											</div>
										</div>
										<div>
											<span class="small text-gray-500">December 12, 2019</span>
											<p>A new monthly report is ready to download!</p>
										</div>
									</a><a class="dropdown-item d-flex align-items-center" href="#">
										<div class="me-3">
											<div class="bg-success icon-circle">
												<i class="fas fa-donate text-white"></i>
											</div>
										</div>
										<div>
											<span class="small text-gray-500">December 7, 2019</span>
											<p>$290.29 has been deposited into your account!</p>
										</div>
									</a><a class="dropdown-item d-flex align-items-center" href="#">
										<div class="me-3">
											<div class="bg-warning icon-circle">
												<i class="fas fa-exclamation-triangle text-white"></i>
											</div>
										</div>
										<div>
											<span class="small text-gray-500">December 2, 2019</span>
											<p>Spending Alert: We've noticed unusually high spending for your account.</p>
										</div>
									</a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
								</div></li>
							<li class="nav-item d-inline-flex"><button class="btn btn-primary" id="logout-btn"
									type="button">로그아웃</button></li>
							<li class="nav-item dropdown d-xxl-flex" id="menu-dropdown"><a class="nav-link"
								aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside"><i
									class="fas fa-bars"></i></a>
								<div class="dropdown-menu dropdown-menu-end">
									<a class="dropdown-item" href="views/user/userInfo.html">나의정보</a><a class="dropdown-item"
										href="views/group/groupList.html">나의그룹</a><a class="dropdown-item"
										href="views/stat/statCalender.html">방문내역</a><a class="dropdown-item"
										href="views/customer/FAQ.html">고객센터</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
			<div class="container" id="container"
				style="max-width: 1920px; height: auto; margin: 0; padding: 0;">
				<img src="assets/img/assets/img/clipboard-image.png" width="1787" height="980">
			</div>
		</div>
		<a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
	</div>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/bs-init.js"></script>
	<script src="assets/js/theme.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/bs-init.js"></script>
	<script src="assets/js/chart.min.js"></script>
	<script src="assets/js/Contact-Form-v2-Modal--Full-with-Google-Map.js"></script>
	<script src="assets/js/ListeBien.js"></script>
	<script src="assets/js/liveReload.js"></script>
	<script src="assets/js/Review-rating-Star-Review-Button.js"></script>
	<script src="assets/js/theme.js"></script>
	<script src="assets/js/WOWSlider-about-us.js"></script>
</body>

</html>