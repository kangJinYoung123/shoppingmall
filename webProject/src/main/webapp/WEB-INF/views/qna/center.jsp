<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="row">

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

			<div class="row mb-2">
				<h3>Q&A</h3>
				<br>
				<div class="col-10">
					<div class="table-responsive">
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="qna" items="${qnaList}">
								<tr>
									<td><c:out value="${qna.qna_code}"/></td>
									<td><c:out value="${qna.qna_title}"/></td>
									<td><c:out value="${qna.userid}"/></td>
									<td><c:out value="${qna.qna_date}"/></td>
									<td>0</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<button class="btn btn-primary btn-sm" type="submit">등록</button>
					<button class="btn btn-primary btn-sm" type="reset">취소</button>
				</div>
			</div>
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>