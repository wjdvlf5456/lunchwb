<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>부장님요기요: 블랙리스트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/yogiyo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/group.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/customModal.css">
</head>

<body id="page-top">

<div id="wrapper">
	
	<c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/aside/groupAside.jsp"></c:import>
	
    <div id="content-wrapper" class="d-flex flex-column">
       
        <div id="content">
            
            <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

            <div class="container-fluid">
                <h3 class="text-dark mb-4 group-content-title"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -64 640 640" width="1em" height="1em" fill="currentColor" style="font-size: 30px;">
                        <path d="M224 256c70.7 0 128-57.31 128-128S294.7 0 224 0C153.3 0 96 57.31 96 128S153.3 256 224 256zM274.7 304H173.3c-95.73 0-173.3 77.6-173.3 173.3C0 496.5 15.52 512 34.66 512H413.3C432.5 512 448 496.5 448 477.3C448 381.6 370.4 304 274.7 304zM479.1 320h-73.85C451.2 357.7 480 414.1 480 477.3C480 490.1 476.2 501.9 470 512h138C625.7 512 640 497.6 640 479.1C640 391.6 568.4 320 479.1 320zM432 256C493.9 256 544 205.9 544 144S493.9 32 432 32c-25.11 0-48.04 8.555-66.72 22.51C376.8 76.63 384 101.4 384 128c0 35.52-11.93 68.14-31.59 94.71C372.7 243.2 400.8 256 432 256z"></path>
                    </svg>개발1팀</h3>
                <div id="group-blacklist" class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold">블랙리스트 목록</p>
                    </div>
                    <div class="card-body"><span class="blacklist-search"><input type="text" placeholder="가게 이름을 입력해주세요" /><button class="btn btn-primary btn-store-search" type="button">검색</button></span>
                        <div class="table-responsive table mt-2 store-list-table" role="grid" aria-describedby="dataTable_info">
                            <table id="dataTable" class="table my-0">
                                <thead>
                                    <tr>
                                        <th style="width: 30%;">가게 이름</th>
                                        <th style="width: 60%;">가게 위치</th>
                                        <th style="width: 10%;">삭제</th>
                                    </tr>
                                </thead>
                                <tbody class="text-dark">
                                    <tr>
                                        <td>라밥 서울대2호점</td>
                                        <td>서울 관악구 쑥고개로 139</td>
                                        <td class="text-warning"><i class="fas fa-trash group-black-delete"></i><a class="blacklist-delete" href="#"></a></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td class="text-warning"><i class="fas fa-trash group-black-delete"></i><a class="blacklist-delete" href="#"></a></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td class="text-warning"><i class="fas fa-trash group-black-delete"></i></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td class="text-warning"><i class="fas fa-trash group-black-delete"></i></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td class="text-warning"><i class="fas fa-trash group-black-delete"></i></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr></tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p class="dataTables_info" role="status" aria-live="polite">총 개수 : 14</p>
                            </div>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end visible dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="group-blacklist-add" class="card shadow">
                    <div class="card-header py-3">
                        <p class="text-primary m-0 fw-bold"><strong>블랙리스트 추가하기</strong><br /></p>
                    </div>
                    <div class="card-body">
                        <div><input type="text" placeholder="가게 이름을 입력해주세요" /><button class="btn btn-primary btn-store-search" type="button">검색</button>
                            <div><span id="store-search-limit">현재위치에서 1km 이내의 음식점이 검색됩니다</span></div>
                        </div>
                        <div class="table-responsive table mt-2 store-list-table" role="grid" aria-describedby="dataTable_info">
                            <table id="dataTable" class="table my-0">
                                <thead>
                                    <tr>
                                        <th style="width: 30%;">가게 이름</th>
                                        <th style="width: 60%;">가게 위치</th>
                                        <th style="width: 10%;">추가</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>라밥 서울대2호점</td>
                                        <td>서울 관악구 쑥고개로 139</td>
                                        <td><a href="#"><svg class="text-primary blacklist-add" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
                                                    <path d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                                </svg></a></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td><svg class="text-primary blacklist-add" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
                                                <path d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td><svg class="text-primary blacklist-add" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
                                                <path d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td><svg class="text-primary blacklist-add" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
                                                <path d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
                                    </tr>
                                    <tr>
                                        <td>라밥 서울대2호점<br /></td>
                                        <td>서울 관악구 쑥고개로 139<br /></td>
                                        <td><svg class="text-primary blacklist-add" xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
                                                <path d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z"></path>
                                            </svg></td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr></tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p class="dataTables_info" role="status" aria-live="polite">총 개수 : 14</p>
                            </div>
                            <div class="col-md-6">
                                <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a class="page-link" aria-label="Previous" href="#"><span aria-hidden="true">«</span></a></li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" aria-label="Next" href="#"><span aria-hidden="true">»</span></a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer id="footer" class="bg-white sticky-footer" style="background-color: #ffffff;">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © FEELIS 2022<br />https://github.com/FEELIS <br /></span></div>
                </div>
            </footer>
        </div>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
   
   
   
<!-- 그룹 순서 변경 모달 -->
<div id="modal-group-order-change" class="modal fade" role="dialog" tabindex="-1" data-bs-auto-close="outside" aria-expanded="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <div><span>그룹 순서 변경</span></div><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-body-custom">
                <div class="group-order-area">
                    <p><i class="icon ion-arrow-up-b"></i><i class="icon ion-arrow-down-b"></i>동기모임</p>
                </div>
                <div class="group-order-area">
                    <p>개발1팀<i class="icon ion-arrow-down-b"></i><i class="icon ion-arrow-up-b"></i></p>
                </div>
                <div class="group-order-area">
                    <p>개발2팀<i class="icon ion-arrow-down-b"></i><i class="icon ion-arrow-up-b"></i></p>
                </div>
                <div class="group-order-area">
                    <p><i class="icon ion-arrow-down-b"></i>지히팀<i class="icon ion-arrow-up-b"></i></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">변경</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
   
<!-- 그룹 이름 변경 모달 -->
<div id="modal-group-name-change" class="modal fade" role="dialog" tabindex="-1" data-bs-auto-close="outside" aria-expanded="false">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <div><span>그룹 이름 변경</span></div><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body modal-body-custom">
                <p class="modal-group-p" placeholder>현재 그룹 이름 : <span class="group-color-blue">개발1팀</span></p><input type="text" placeholder="변경할 그룹 이름을 입력해주세요" />
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">변경</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
<!-- 그룹 탈퇴 확인 모달 -->
<div id="modal-group-leave" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div class="modal-group-p">
                    <p class="modal-group-p group-color-blue">개발1팀</p>
                    <p class="modal-group-p">탈퇴하시겠습니까?<br /></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
<!-- 그룹원 내보내기 모달 -->
<div id="modal-groupmem-out" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div>
                    <p class="modal-group-p group-color-blue">남궁옥분1</p>
                    <p class="modal-group-p">내보내시겠습니까?<br /></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
   
<!-- 그룹장 위임 모달 -->
<div id="modal-group-leader-pass" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div>
                    <p class="modal-group-p">그룹장을 위임할 그룹원을</p>
                    <p class="modal-group-p">선택해주세요</p><select id="dropdown-group-leader-pass">
                        <optgroup label="This is a group">
                            <option value="12" selected>This is item 1</option>
                            <option value="13">This is item 2</option>
                            <option value="14">This is item 3</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>
   
   
<!-- 그룹원 초대(회원) 확인 모달 -->
<div id="modal-groupmem-invt" class="modal fade" role="dialog" tabindex="-1" aria-expanded="false">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body-custom">
                <div>
                    <p class="modal-group-p group-color-blue">feelis0720@naver.com</p>
                    <p class="modal-group-p">초대하시겠습니까?<br /></p>
                </div>
            </div>
            <div class="modal-footer-custom"><button class="btn btn-primary" type="button">확인</button><button class="btn btn-light" type="button" data-bs-dismiss="modal">취소</button></div>
        </div>
    </div>
</div>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bs-init.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

</body>
</html>