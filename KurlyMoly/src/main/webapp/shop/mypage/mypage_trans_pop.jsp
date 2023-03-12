<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    <link href="../../css/style.css" rel="stylesheet" type="text/css">
    <link href="../../css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body style="zoom: 1;">
    <div id="wrap" class="layout-main-wrapper">
        <div class="only_pc">
            <h2 class="pop_head">배송지 수정</h2>
        </div>
        <div class="section_destination">
            <div id="inputForm">
            <form name="transpop" method="POST" id="form" action="del_addressChange.jsp">
            
            <div class="modify only_pc">
                    <input type="hidden" id=da_memidx name="da_memidx" value="<%=request.getParameter("idx")%>">
                    <div class="field">
                        
                        <div id="addrMain" class="address">배송지</div>
                        <input type="text" id="addrSub" name="addrSub" placeholder="나머지 주소를 입력해주세요" value="<%=request.getParameter("address")%>">
                    </div>
                    <div class="field">
                        <label class="label_block" for="receiverName">받으실 분</label>
                        <input type="text" id="receiverName" name="receiverName" placeholder="이름을 입력해주세요" value="<%=request.getParameter("name")%>">
                    </div>
                    <div class="field">
                        <label class="label_block" for="receiverPhone">휴대폰</label>
                        <input type="text" id="receiverPhone" name="receiverPhone" placeholder="번호를 입력해주세요" value="<%=request.getParameter("phone")%>">
                    </div>
                    <button type="submit" class="btn active">저장</button>
                </div>
            </form>

            </div>
        </div>
    </div>
    
</body>
</html>