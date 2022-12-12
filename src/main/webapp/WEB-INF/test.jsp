<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="https://www.google.com/recaptcha/api.js"></script>
  <meta http-equiv="Content-Type" content="text/html";charset="utf-8"/>
  <meta charset="UTF-8">
  <title>Title</title>

 </head>
 <body>
 
 <div align="right" class="g-recaptcha" data-sitekey="6Lckc0QjAAAAAM99CWG4ZaUjZSotZ9CtddBM38x4"></div>									
							
				<script>
				
				//초기화
				 var IMP = window.IMP;
				 IMP.init("imp1234578");//가맹점 식별코드
				
				 function requestPay() {
				     IMP.request_pay({
				         pg : 'html5_inicis.INIpayTest', //테스트용 결제회사
				         pay_method : 'card',
				         merchant_uid: "${detail.seq}" + new Date().getTime(), 
				  	  	 name: "[ ${detail.getNameCategory2() } ] ${detail.getRoom() }", // 상품명
				         amount : 100,
				  	   	 buyer_email: "${user.email}",
					     buyer_name: "${user.name}", // 구매자 이름
					     buyer_tel: "${user.mobile}", // 구매자 연락처 
				     },function(rsp) {
							console.log("rsp ghong: " + rsp.imp_uid);
							// 결제검증
							$.ajax({
					        	type : "POST",
					        	url : "/verifyIamport/" + rsp.imp_uid
					        }).done(function(data) {
					        	console.log(data);
					        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
					        	if(rsp.paid_amount == data.response.amount){
						        	//alert("결제 및 결제검증완료");
						        	$("#imp_uid").val(rsp.imp_uid); //결제 정보
						        	$("#merchant_uid").val(rsp.merchant_uid);
						        	$("#seq").val("${detail.seq}");
						        	$("#f").attr("action","successPayment").submit();
					        	} else {
					        		alert("결제 실패");
					        	}
					        });
						});
					}
				
				 function cancle(){
					 	var msg = confirm("삭제 하시겠습니까?");
					 	
					 	if (msg == true){
						$("#seq").val("${detail.seq}");
						$("#f").attr("action","cancleReserveData").submit();
						$("#f").submit();
					 	}
				 }
				 function send(){
					
				 	$("#imp_uid").val("qwer");
					$("#merchant_uid").val("qwer");
					$("#seq").val("${detail.seq}");
					$("#f").attr("action","successPayment").submit();
				}
				 </script>
							
								
</body>
</html>






