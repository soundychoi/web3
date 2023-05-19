<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authentication property="principal" var="pinfo" />
<html>
<jsp:include page="../include/manager.jsp" />
<script src="../resources/js/manager/memberInfo.js"></script>
<link rel="stylesheet" href="../resources/css/memberInfo.css" type="text/css">
<script>
	$(function(){
		const resultMsg = "${result}";
		
		if(resultMsg == 'memberUpdate'){
			$("#resultMessage").text('회원 정보가 변경되었습니다.');
			$("#resultWrap").fadeIn(0).fadeOut(1500);
		}else if(resultMsg == 'authorized'){
			$("#resultMessage").text('가입 승인되었습니다.');
			$("#resultWrap").fadeIn(0).fadeOut(1500);
		}
	})
</script>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="sidebar.jsp" />
		<div id="content-wrapper">
			<div id="content">
				<div></div>
				<!-- 개인정보 모달 -->
				<div class="modal" tabindex="-1" id="memberInfo">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<form action="infoUpdate" method="post">
								<div class="modal-header b-none">
									<h4 class="modal-title">구성원 정보수정</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">

									<input type="hidden" name="updateType" value="manager">
									<table>
										<tr>
											<th class="b-none subtitle">개인 정보</th>
										</tr>
										<tr>
											<th class="b-none">이름</th>
											<td class="b-none"><input name="username" class="info-input" type="text" readOnly></td>
										</tr>
										<tr>
											<th class="b-none">이메일</th>
											<td class="b-none"><input name="id" class="info-input" type="text" readOnly></td>
										</tr>
										<tr>
											<th class="b-none">휴대폰 번호</th>
											<td class="b-none"><input name="phone" class="info-input" type="text"></td>
										</tr>
										<tr>
											<td class="b-none blank"></td>
										</tr>
										<tr>
											<th class="b-none subtitle">회사 정보</th>
										</tr>
										<tr>
											<th class="b-none">부서명</th>
											<td class="b-none"><input name="dept" class="info-input" type="text"></td>
										</tr>
										<tr>
											<th class="b-none">직책</th>
											<td class="b-none"><input name="position" class="info-input" type="text"></td>
										</tr>
									</table>

								</div>
								<div class="modal-footer b-none justify-content-center">
									<input type="submit" class="btn btn-primary" value="저장">
									<button type="button" class="btn btn-light" data-bs-dismiss="modal" aria-label="Close">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="container-fluid">
					<c:set var="m" value="${member}" />
					<c:if test="${m.belong == 1}">
						<c:set var="count1" value="${m.listcount}" />
					</c:if>
					<c:if test="${m.belong == 0}">
						<c:set var="count2" value="${m.listcount}" />
					</c:if>
					<div id="member-info">
						<input type="hidden" name="company_id" value="${pinfo.companyId}">
						<div class="title mt-4 mb-4">구성원</div>
						<hr>
						<ul class="menu_tabs">
							<li class="tab">
								<a class="link join-member" href="memberInfo?belong=1">
									정상
									<c:if test="${!empty count1}">(${count1})</c:if>
								</a>
							</li>
							<li class="tab">
								<a class="link pending-member" href="memberInfo?belong=0">
									가입대기
									<c:if test="${!empty count2}">(${count2})</c:if>
								</a>
							</li>
						</ul>
						<div class="card shadow mb-4">
							<div class="card-body">
								<div class="header">
									<form action="memberInfo" class="search-wrap">
										<input type="hidden" name="belong" value="${m.belong}">
										<input id="searchOptions" type="hidden" value="${m.searchOptions}">
										<select name="searchOptions" class="search-options search-group">
											<option value="username">이름</option>
											<option value="dept">부서</option>
											<option value="position">직책</option>
										</select>
										<input type="text" name="searchWord" class="search search-group" placeholder="검색어를 입력해주세요" value="${m.searchWord}">
										<input type="submit" class="search-btn search-group" value="검색">
									</form>
									<!-- <div class="limit">
										목록 수: 
										<select name="limit">
											<option value="10">10개</option>
											<option value="20">20개</option>
										</select>
									</div> -->
								</div>
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable">
										<thead>
											<tr>
												<c:if test="${m.belong == 1}">
													<th>이름</th>
													<th>부서</th>
													<th>직책</th>
													<th>이메일</th>
													<th>연락처</th>
													<th>가입일</th>												
													<th>상태</th>												
													<th>관리자</th>
												</c:if>
												<c:if test="${m.belong == 0}">
													<th>이름</th>
													<th>이메일</th>
													<th>가입일</th>
													<th class="w-200">가입 승인</th>
												</c:if>
											</tr>
										</thead>
										<c:if test="${m.listcount > 0}">
											<tbody>
												<c:forEach var="list" items="${memberList}">
													<c:if test="${m.belong == 1}">
														<tr class="member" data-bs-toggle="modal" data-id="${list.id}" data-bs-target="#memberInfo">
															<td>${list.username}</td>
															<td>${list.dept}</td>
															<td>${list.position}</td>
															<td>${list.id}</td>
															<td>${list.phone}</td>
															<td>${list.join_date}</td>
															<td>정상</td>
															<td>
																<c:set var="auth" value="N" /> 
																<c:if test="${list.auth == 'ROLE_MANAGER'}">
																	<c:set var="auth" value="Y" />
																</c:if> 
																<c:out value="${auth}" />
															</td>
														</tr>
													</c:if>
													<c:if test="${m.belong == 0}">
														<tr class="pending">
															<td>${list.username}</td>
															<td>${list.id}</td>
															<td>${list.join_date}</td>
															<td  class="w-200">
																<form class="authorize-form" action="authorize" method="post">
																	<input type="hidden" name="id" value="${list.id}">
																	<input type="submit" class="d-none btn btn-primary d-fluid" value="승인">
																	<button type="button" class="authorize-btn btn btn-light">가입승인</button>
																	<button type="button" class="cancel-btn btn btn-danger d-none d-fluid">취소</button>
																</form>
															</td>
														</tr>
													</c:if>													
												</c:forEach>
											</tbody>
										</c:if>
									</table>
								</div>

								<c:if test="${m.listcount > 0}">
									<div class="center-block">
										<ul class="pagination">
											<c:if test="${m.page <= 1}">
												<li class="prev page">
													<a>&lt;</a>
												</li>
											</c:if>
											<c:if test="${m.page > 1}">
												<c:url var="url" value="memberInfo">
													<c:if test="${!empty m.searchOptions}">
														<c:param name="searchOptions" value="${m.searchOptions}" />
													</c:if>
													<c:if test="${!empty m.searchWord}">
														<c:param name="searchWord" value="${m.searchWord}" />
													</c:if>
													<c:param name="belong" value="${m.belong}" />
													<c:param name="page" value="${m.page}" />
												</c:url>
												<li class="prev page">
													<a href="${url}">&lt;</a>
												</li>
											</c:if>
											<c:forEach var="p" begin="${m.startpage}" end="${m.endpage}">
												<c:if test="${p == m.page}">
													<li class="page pageActive">
														<a>${p}</a>
													</li>
												</c:if>
												<c:if test="${p != m.page}">
													<c:url var="url" value="memberInfo">
														<c:if test="${!empty m.searchOptions}">
															<c:param name="searchOptions" value="${m.searchOptions}" />
														</c:if>
														<c:if test="${!empty m.searchWord}">
															<c:param name="searchWord" value="${m.searchWord}" />
														</c:if>
														<c:param name="belong" value="${m.belong}" />
														<c:param name="page" value="${p}" />
													</c:url>
													<li class="page">
														<a href="${url}">${p}</a>
													</li>
												</c:if>
											</c:forEach>

											<c:if test="${m.page >= m.maxpage}">
												<li class="next page">
													<a>&gt;</a>
												</li>
											</c:if>
											<c:if test="${m.page < m.maxpage}">
												<c:url var="url" value="memberInfo">
													<c:if test="${!empty m.searchOptions}">
														<c:param name="searchOptions" value="${m.searchOptions}" />
													</c:if>
													<c:if test="${!empty m.searchWord}">
														<c:param name="searchWord" value="${m.searchWord}" />
													</c:if>
													<c:param name="belong" value="${m.belong}" />
													<c:param name="page" value="${m.page+1}" />
												</c:url>
												<li class="next page">
													<a href="${url}">&gt;</a>
												</li>
											</c:if>

										</ul>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>