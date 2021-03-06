<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


<form action="" method="get" id="operForm">
	<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
	<input type="hidden" name="amount" value="${page.cri.amount }">
</form>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<c:choose>
				<c:when test="${page.total == 0}">
					<div class="img-fluid col-xl-12 mt-4">
						<img class="card-img-top"
							src="/resources/assets/img/pexels-photo-1546901.jpeg"
							alt="Card image"
							style="width: 100%; filter: blur(6px); height: 750px;">
						<div class="row align-items-center card-img-overlay">
							<div class="col h1 text-white text-center">
								<h4 class="card-title">비밀</h4>
								<div id="time"></div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<h1 class="mt-4">Product</h1>
					<!-- 					<ol class="breadcrumb mb-4"> -->
					<!-- 					</ol> -->
					<form action="/product" method="get" id="searchForm">
						<div class="bg-light border mb-3 p-3 rounded-lg">
							<div class="input-group col-xl-12">
								<select class="form-control col-xl-4 col-md-4" name="type">
									<option value="ND"
										<c:out value="${page.cri.type == 'ND' ? 'selected' : '' }"/>>모든
										조건</option>
									<option value="N"
										<c:out value="${page.cri.type == 'N' ? 'selected' : '' }"/>>이름</option>
									<option value="D"
										<c:out value="${page.cri.type == 'D' ? 'selected' : '' }"/>>내용</option>
								</select> <input class="form-control col-xl-8 col-md-8" name="keyword"
									value='<c:out value="${page.cri.keyword }"/>' type="text"
									placeholder="Search for..." aria-label="Search" />
								<div class="input-group-append">
									<button class="btn btn-primary" id="searchBtn">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>

						</div>
						<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
						<input type="hidden" name="amount" value="${page.cri.amount }">
					</form>
					

					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col" class="" style="width: 10%">번호</th>
								<th scope="col" class="" style="width: 70%">제목</th>
								<th scope="col" class="" style="width: 20%">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${diary }" var="diary" varStatus="status">
								<tr>
									<td>${diary.dno }</td>
									<td><a class="btn btn-primary get-btn text-white"
										data-oper="get" data-pno="${diary.dno }">${diary.title }</a></td>
									<td><fmt:formatDate value="${diary.upToDate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

<!-- 					<div class="d-flex justify-content-center col-xl-12"> -->
<!-- 									<a href="#"><i class="fas fa-angle-down fa-5x"></i></a> -->
<!-- 						<ul class="pagination pagination-lg"> -->
<%-- 							<c:if test="${page.prev }"> --%>
<!-- 								<li class="page-item previous"><a class="page-link" -->
<%-- 									href="${page.startPage -1 }">Previous</a></li> --%>
<%-- 							</c:if> --%>
<%-- 							<c:forEach var="num" begin="${page.startPage }" --%>
<%-- 								end="${page.endPage }"> --%>
<!-- 								<li -->
<%-- 									class="page-item page-num ${page.cri.pageNum == (num -1) *10 ? 'active' : '' }"><a --%>
<%-- 									class="page-link" href="${(num -1) *10}">${num }</a></li> --%>
<%-- 							</c:forEach> --%>
<%-- 							<c:if test="${page.next }"> --%>
<!-- 								<li class="page-item next"><a class="page-link" -->
<%-- 									href="${page.endPage }">Next</a></li> --%>
<%-- 							</c:if> --%>
<!-- 						</ul> -->
<!-- 					</div> -->
				</c:otherwise>
			</c:choose>
		</div>
	</main>

	<div class="modal fade" id="alertModal" tabindex="-1" role="dialog"
		aria-labelledby="alertModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="alertModalLabel">Alert</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					장바구니에 보관되어있는 상품이 있습니다.<br> 현재 상품만 구매하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="modalSecFunc">장바구니에
						추가 & 구매</button>
					<button type="button" class="btn btn-primary" id="modalAccept">예</button>
					<!-- 					<button type="button" class="btn btn-secondary" -->
					<!-- 						data-dismiss="modal">Close</button> -->
				</div>
			</div>
		</div>
	</div>

	<form id="pageForm" action="/product/list2" method="get">
		<input type='hidden' name="pageNum" value="${page.cri.pageNum }">
		<input type='hidden' name="amount" value="${page.cri.amount }">
	</form>
	<script type="text/javascript" src="/resources/js/productJs.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var x = setInterval(function() {

				var now = new Date();
				$("#time").html(now);
			}, 1000);
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("button[data-toggle='collapse']").on("click", function(e) {
				e.preventDefault();
				var index = $(this).data('index');
				console.log(index);
				$(".collapse[data-index='" + index + "']").collapse('toggle');
			});
		});
	</script>
	<%@ include file="../includes/footer.jsp"%>