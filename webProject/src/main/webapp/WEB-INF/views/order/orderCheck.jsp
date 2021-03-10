<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>결제하기</h2>
    </div>
    <div class="row g-3">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-muted">장바구니</span>
        </h4>
        <ul class="list-group mb-3">
        	<c:set var="totalPrice" value="0"/>
        	<c:forEach var="cart" items="${cartList}">
        		<li class="list-group-item d-flex justify-content-between lh-sm">
		            <div>
		              <h6 class="my-0"><c:out value="${cart.product_name}"/></h6>
		              <small class="text-muted">수량 : <c:out value="${cart.cart_stock}"/></small>
		            </div>
		            <span class="text-muted"><c:out value="${cart.product_price}"/></span>
		            <c:set var="totalPrice" value="${totalPrice + (cart.product_price * cart.cart_stock)}"/>
          		</li>
        	</c:forEach>
          <li class="list-group-item d-flex justify-content-between">
            <span>Total</span>
            <strong><c:out value="${totalPrice}"/></strong> 
          </li>
        </ul>

      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">내 정보</h4>
        <form name="frm" action="/order/order" method="post">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="name" class="form-label">수령인 이름</label>
              <input type="text" class="form-control" id="name" name="order_name" placeholder="" value="name" required>
            </div>

            <div class="col-sm-6">
              <label for="phone" class="form-label">수령인 연락처</label>
              <input type="text" class="form-control" id="phone" name= "order_phone" placeholder="" value="phone" required>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" id="address" name="order_address" placeholder="address" required>
            </div>

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="myInfo">
            <label class="form-check-label" for="same-address">내정보 가져오기</label>
          </div>
			<input type="hidden" name="order_allprice" value="<c:out value="${totalPrice}"/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <button class="w-100 btn btn-primary btn-lg" type="submit" id="orderBtn">결제하기</button>
          <script type="text/javascript">
          	var formObj = $('form');
          	$("#orderBtn").on("click", function(e) {
          		e.preventDefault();
          		var con = confirm("이대로 결제하시겠습니까?");
          		if(con){
          			formObj.submit();
          		} else {
          			alert("주문 실패");
          		}
          	})
          </script>
          </div>
        </form>
      </div>
    </div>
  </main>

  
</div>

<%@ include file="../includes/footer.jsp"%>