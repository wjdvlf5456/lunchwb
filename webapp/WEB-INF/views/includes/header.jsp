<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav id="header"
	class="navbar navbar-light navbar-expand bg-white shadow d-xxl-flex justify-content-xxl-end mb-4 topbar static-top">
	<div class="container">
		<div></div>
		<ul class="navbar-nav d-xxl-flex align-items-xxl-center">
			<c:choose>
				<c:when test="${authUser!=null }">

					<li class="nav-item dropdown show d-xxl-flex" id="user-alert">
						<a class="dropdown-toggle nav-link d-flex d-xl-flex justify-content-xl-start nav-link" 
						aria-expanded="false" data-bs-toggle="dropdown" href="#" data-bs-auto-close="outside">
						<i class="fas fa-bell fa-fw"></i>
							<span class="badge bg-danger badge-counter">3+</span>
						</a>
						<div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in"
							data-bs-popper="none" id="user-alert-list">
							<h6 class="dropdown-header">alerts center</h6>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-success icon-circle"></div>
								<div>
									<p class="alert-basic">기주임님이 개발1팀을 탈퇴하였습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-check" type="button">확인</button>
								</div>
							</a><a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-warning icon-circle"></div>
								<div>
									<p class="alert-basic">feelis님이 초대를 거절하였습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-check" type="button">확인</button>
								</div>
							</a><a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-warning icon-circle"></div>
								<div>
									<p class="alert-basic">feelis님이 초대를 수락하였습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-check" type="button">확인</button>
								</div>
							</a><a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-primary icon-circle"></div>
								<div>
									<p class="alert-basic">개발1팀에서 퇴장당하였습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-check" type="button">확인</button>
								</div>
							</a><a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-danger icon-circle"></div>
								<div>
									<p class="alert-basic">개발1팀의 그룹장을 위임받았습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-check" type="button">확인</button>
								</div>
							</a><a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-dark icon-circle"></div>
								<div>
									<p class="alert-basic">7월 23일에 남겨주신 리뷰가 광고/도배의 이유로 삭제되었습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-check" type="button">확인</button>
								</div>
							</a><a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-warning icon-circle"></div>
								<div>
									<p class="alert-choice">개발1팀에 초대되었습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-ok" type="button">수락</button>
									<button class="btn btn-primary btn-alert-opposite" type="button">거절</button>
								</div>
							</a><a class="dropdown-item d-flex align-items-center" href="#">
								<div class="bg-info icon-circle"></div>
								<div>
									<p class="alert-choice">남겨주신 문의에 대한 답변이 등록되었습니다</p>
								</div>
								<div class="btn-group" role="group">
									<button class="btn btn-primary btn-alert-ok" type="button">보기</button>
									<button class="btn btn-primary btn-alert-opposite" type="button">확인</button>
								</div>
							</a>
						</div>
					</li>

					<li class="nav-item d-inline-flex">
						<button class="btn btn-primary" id="logout-btn" type="button"
							onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>
					</li>

					<li id="menu-dropdown" class="nav-item dropdown d-xxl-flex">
						<a class="nav-link" aria-expanded="false" data-bs-toggle="dropdown" data-bs-auto-close="outside"> 
							<i class="fas fa-bars"></i>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/user/userInfo">나의정보</a> <a
									class="dropdown-item" href="${pageContext.request.contextPath}/group/groupList">나의그룹</a> <a
									class="dropdown-item" href="${pageContext.request.contextPath}/stat/statCalender">방문내역</a> 
								<a class="dropdown-item" href="${pageContext.request.contextPath}/customer/FAQ">고객센터</a>
							</div>
					</li>
				</c:when>

				<c:otherwise>
					<li class="nav-item d-inline-flex">
						<button id="logout-btn" class="btn btn-primary" type="button"
							onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
					</li>
					<li class="nav-item d-inline-flex">
						<button id="logout-btn" class="btn btn-primary" type="button"
							onclick="location.href='${pageContext.request.contextPath}/join'">회원가입</button>
					</li>
				</c:otherwise>

			</c:choose>
		</ul>
	</div>
</nav>
