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
			<h5>주문 목록</h5>
			<div class="row mb-2">
				<c:forEach var="order" items="${orderList}">
        		<li class="list-group-item d-flex justify-content-between lh-sm">
		            <div>
		            	<small class="text-muted">주문 날짜 : <fmt:formatDate value="${order.order_day}"/></small>
		              <h6 class="my-0">주문코드 : <a type="button" href="/member/myOrderSelect?order_code=<c:out value='${order.order_code}'/>"><c:out value="${order.order_code}"/></a></h6>
		              <small class="text-muted">수령인 : <c:out value="${order.order_name}"/></small><br>
		              <small class="text-muted">가격 : <c:out value="${order.order_allprice}"/>원</small><br>
		            <small class="text-muted">주소 : <c:out value="${order.order_address}"/></small>
		            </div>
		            <c:choose>
		            	<c:when test="${!order.order_complete}">
		            		<div><h5>배송 상태 : 배송중</h5></div>
		            	</c:when>
		            	<c:otherwise>
							<div><h5>배송 상태 : 배송 완료</h5></div>
		            	</c:otherwise>
		            </c:choose>  
          		</li>
        		</c:forEach>
            </div>  
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>