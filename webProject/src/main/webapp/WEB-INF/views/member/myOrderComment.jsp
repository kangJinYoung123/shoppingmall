<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="position-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="/member/myPage"> <span
							></span> 내정보
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/myOrder"> <span
							></span> 주문목록
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/withdraw"> <span
							></span> 회원탈퇴
					</a></li>
				</ul>
			</div>
		</nav>
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			
			<div class="row mb-2">
				<form action="/member/myOrderCommentRegi" method="post">
					
					
				
				</form>
            </div>  
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>