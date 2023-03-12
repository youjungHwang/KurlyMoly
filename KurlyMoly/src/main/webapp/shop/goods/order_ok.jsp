<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.order.BasketDTO"%>
<%@ page import="com.kurly.member.MemberDTO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:useBean id="mdao" class="com.kurly.member.MemberDAO" />
<jsp:useBean id="bdao" class="com.kurly.order.BasketDAO" />
<jsp:useBean id="pdao" class="com.kurly.product.ProductDAO" />

<jsp:useBean id="odao" class="com.kurly.order.OrderDAO" />
<jsp:useBean id="oddao" class="com.kurly.order.OrderDetailDAO" />

<%
request.setCharacterEncoding("UTF-8");
%>
<%
request.setCharacterEncoding("utf-8");
NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷(0,000) 지정을 위한 변수 설정

String userid_as = null; // header.jsp에 있는 변수명(userid)과 일치하여 오류발생함에 따라 변수명 수정 (★나희★)
if (session.getAttribute("m_id") != null) {
	userid_as = (String) session.getAttribute("m_id");
}

// 접속한 회원 장바구니 가져오기
List<BasketDTO> basketlist = new ArrayList<BasketDTO>();
basketlist = bdao.basketinfo(userid_as);
System.out.println(basketlist);

// 장바구니 상품 리스트 가져오기
List<ProductDTO> productlist = new ArrayList<ProductDTO>();

try {

	String oUserid = request.getParameter("oUserid"); // 주문자아이디
	String oOrderer = request.getParameter("oOrderer"); // 주문자명
	String oReceiver = request.getParameter("oReceiver"); // 수취인명
	String oTel = request.getParameter("oTel"); // 전화번호
	String oZipcode = request.getParameter("oZipcode"); // 우편번호
	String oAddress1 = request.getParameter("oAddress1"); // 주소1
	String oAddress2 = request.getParameter("oAddress2"); // 주소2
	String oAddress3 = request.getParameter("oAddress3"); // 주소3
	String oAddress4 = request.getParameter("oAddress4"); // 수령장소
	int oProdamount = Integer.parseInt(request.getParameter("oProdamount").trim()); // 상품금액
	int oDiscount = Integer.parseInt(request.getParameter("oDiscount").trim()); // 상품할인금액
	int oUsecoupon = Integer.parseInt(request.getParameter("oUsecoupon").trim()); // 쿠폰할인금액
	int oUsepoint = Integer.parseInt(request.getParameter("oUsepoint").trim()); // 적립금사용액
	int oDeliveryfee = Integer.parseInt(request.getParameter("oDeliveryfee").trim()); // 배송비
	int oAmountpaid = Integer.parseInt(request.getParameter("oAmountpaid").trim()); // 결제금액
	int oAddpoint = Integer.parseInt(request.getParameter("oAddpoint").trim()); // 적립예정금액
	String oPaidtype = request.getParameter("oPaidtype"); // 결제방식
	String oShipstate = request.getParameter("oShipstate"); // 처리상태 : 미확인/상품준비중/배송중/배송완료/구매확정

	if (odao.insertData(oUserid, oOrderer, oReceiver, oTel, oZipcode, oAddress1, oAddress2, oAddress3, oAddress4,
	oProdamount, oDiscount, oUsecoupon, oUsepoint, oDeliveryfee, oAmountpaid, oAddpoint, oPaidtype,
	oShipstate)) {

		int od_orderidx = oddao.selectLastOidx();

		for (int i = 0; i < basketlist.size(); i++) {
	int od_productidx = basketlist.get(i).getBkProdidx();
	int od_quantity = basketlist.get(i).getBkQuantity();

	productlist = pdao.prodinfo(od_productidx);

	String od_deliverytype = productlist.get(0).getDeliverytype();

	if (oddao.insertData(od_orderidx, od_productidx, od_quantity, od_deliverytype)) {

	}
		}
%>
<script>
	alert("결제가 완료되었습니다.");
	location.href = "../mypage/mypage_review.jsp";
</script>
<%
} else {
out.print("<script>alert('결제를 실패했습니다.'); history.back();</script>");
}
} catch (NumberFormatException e) {
e.printStackTrace();
} catch (Exception e) {
e.printStackTrace();
}
%>
