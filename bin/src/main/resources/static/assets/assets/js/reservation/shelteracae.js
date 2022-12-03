// 예약안내팝업 닫기
function lastPopClose(){
	showLoading();
 	location.reload();
}

var selectedPrds = function(){

	var prds = [];
	$.each($('[type="checkbox"][data-td-sch]'), function(){

		var prd = {};
		var tdSch = $(this).data('td-sch');
		//var $prd = $('#check-' + tdSch);

		var price = $(this).data('added-price') || '';
		var pricePer = 0;
		var rsrvtQntt = $('[type="radio"][data-td-sch="' + tdSch + '"]:checked').val(); //인원수
		price = Number(price);
		rsrvtQntt = Number(rsrvtQntt);
		pricePer = price * rsrvtQntt;

		prd.reserTp = $(this).data("added-reser-tp");
		prd.prdId = $(this).data("prd-id") || ''; //reg
		prd.deptId = $(this).data("added-dept-id") || ''; //reg
		prd.useDt = $(this).data("added-use-dt") || '';
		prd.useBgnDtm = $(this).data("added-use-dt") || ''; //reg
		prd.crtrDow = $(this).data('added-crtr-dow') || '';
		prd.parkNm = $(this).data("added-park-nm") || '';
		prd.updNm = $(this).data("added-upd-nm") || '';
		prd.fcltNm = $(this).data("added-fclt-nm") || '';
		prd.prdNm = $(this).data("added-fclt-nm") || '';
		prd.areaCode = prd.prdId.substr(1, 4);
		prd.salAmt = pricePer;
		prd.rsrvtQntt = rsrvtQntt || ''; //reg
		prd.price = numberWithCommas(pricePer);
		prd.ymdUseDt = String(prd.useDt).replace(/\s/gi, "")
			.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');

		prds.push(prd);
	});

	return prds;
};
$(function(){
	
	function reserStart_20221031() {
		if(window.isGreenpoint == 'Y'){

			if($(this).data('green-possi') != 'Y'){

				toastrMsg("그린포인트가 부족하여 결제할 수 없습니다.", "메세지", "e");
				return false;
			}
		}

		if($("input[name='captcha']").val() == null || $("input[name='captcha']").val().trim() == "") {
			toastrMsg("자동예약방지글을 입력해주세요.","메세지","e");
			$("input[name='captcha']").focus();
			return;
		}

		// 백신접종일자 '-' 제거
		var vaccDtm1st  = $('#vaccDtm1st').val() || '';
		var vaccDtm2nd  = $('#vaccDtm2nd').val() || '';

		var action = "/reservation/shelter/registerShelterReser.do";
		var prdParam = {};
		prdParam.prds = selectedPrds();

		if(!prdParam.prds || $.isEmptyObject(prdParam.prds)){
			toastrMsg("예약건을선택해주세요", "메세지", "e");
			return false;
		}
		prdParam.captcha = $('.captcha-area input[name="captcha"]').val();
		prdParam.vaccDtm1st = vaccDtm1st.replace(/[^0-9]/g, '');
		prdParam.vaccDtm2nd = vaccDtm2nd.replace(/[^0-9]/g, '');
		prdParam.wtngCancel = '';
		prdParam.isGreenpoint = window.isGreenpoint;

		commn.callAjax({
			'url': action,
			'data': JSON.stringify(prdParam),
			'dataType' : 'json',
			'headers' : {'Content-Type' : "application/json; charset=utf-8"}
		})
		.done(function(res){
			var resMsg = commn.nvl(res).message;
			if(resMsg){
				
				alertPopup({
                    title:'안내',
                    subTitle:'안내',
                    content: resMsg,
                    type:'error'
                });
				
				var $popup = $('#automatic-character-shelter');
				var $popupContainer = $('[data-template-id="popup-container-template"]');
				$popupContainer.find('[data-popup-btn="cancel"]').on('click', function(){$popup.find('.btn-close').trigger('click');});
				$popupContainer.find('[data-popup-btn="cancel"]').click();
			}
			else {
				if(window.isGreenpoint != 'Y'){
					var ymdhm = function(value){
						if(value){
							var year = value.substring(0, 4);
							var month = value.substring(4, 6);
							var day = value.substring(6, 8);
							var hour = value.substring(8, 10);
							var minute = value.substring(10, 12);
							//var second = value.substring(12, 14);
							return year + '년 ' + month + '월 ' + day + '일 ' + hour + ':' + minute;
						}
						return '';
					};
	
					var reserTpFlag = false;
	
					$('[data-popup-information-shelter="sttlmMtDtm"]').empty();
					$('[data-area-name="reservation-popup-copy-mid-w"]').hide();
	
					$.each(res.sttlmMtDtms, function(i, item){
						if(item.reserTp == 'W'){
							$('[data-popup-information-shelter="sttlmMtDtm"]').append('<em>' + item.prdNm + '</em>의 대기신청이 완료되었습니다.<br>');
							$('[data-area-name="reservation-popup-copy-mid-w"]').css('display', '');
						}
						else{
							reserTpFlag = true;
							$('[data-popup-information-shelter="sttlmMtDtm"]').append('<em>' + item.prdNm + '</em>의 결제 만기일시는 <em>' + ymdhm(item.sttlmMtDtm2) + '</em> 까지 입니다.<br>');
						}
					});
	
					if(reserTpFlag){
						$('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').css('display', '')
							.siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').hide();
	
						$('[data-popup-information-shelter="sttlmMtDtm"]').append('미 결제시 자동 취소되니 유의 하시기 바랍니다.');
					}
					else{
						$('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').css('display', '')
							.siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').hide();
					}
	
					$('[data-popup="reservation-information1-shelter"]').trigger('click');
				}
				else{
					$('[data-popup="reservation-information1-shelter"]').trigger('click');
				}
			}
		})
		.fail(function(e){
			var resMsg = commn.nvl(e).message;
			if(resMsg){
				alertPopup({
                    title:'예약불가 안내',
                    subTitle:'예약불가 안내',
                    content: resMsg,
                    type:'error'
                });
				
				var $popup = $('#automatic-character-shelter');
				var $popupContainer = $('[data-template-id="popup-container-template"]');
				$popupContainer.find('[data-popup-btn="cancel"]').on('click', function(){$popup.find('.btn-close').trigger('click');});
				$popupContainer.find('[data-popup-btn="cancel"]').click();
			}else{
				toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
			}
		});
	};

	function reserStart() {
		if(window.isGreenpoint == 'Y'){

			if($(this).data('green-possi') != 'Y'){

				toastrMsg("그린포인트가 부족하여 결제할 수 없습니다.", "메세지", "e");
				return false;
			}
		}

		if($("input[name='captcha']").val() == null || $("input[name='captcha']").val().trim() == "") {
			toastrMsg("자동예약방지글을 입력해주세요.","메세지","e");
			$("input[name='captcha']").focus();
			return;
		}

		// 백신접종일자 '-' 제거
		var vaccDtm1st  = $('#vaccDtm1st').val() || '';
		var vaccDtm2nd  = $('#vaccDtm2nd').val() || '';

		var prdParam = {};
		prdParam.prds = selectedPrds();

		if(!prdParam.prds || $.isEmptyObject(prdParam.prds)){
			toastrMsg("예약건을선택해주세요", "메세지", "e");
			return false;
		}
		prdParam.captcha = $('.captcha-area input[name="captcha"]').val();
		prdParam.vaccDtm1st = vaccDtm1st.replace(/[^0-9]/g, '');
		prdParam.vaccDtm2nd = vaccDtm2nd.replace(/[^0-9]/g, '');
		prdParam.wtngCancel = '';
		prdParam.isGreenpoint = window.isGreenpoint;

		ajaxCall({
			url :  '/common/shelter/createReservation.do',
			data : JSON.stringify(prdParam),
			dataType : 'json',
			contentType: 'application/json',
			header : {'Content-Type' : "application/json; charset=utf-8"},
			success : function(dat){
				if(dat.result=='Y'){

					if(window.isGreenpoint != 'Y'){
						var ymdhm = function(value){
							if(value){
								var year = value.substring(0, 4);
								var month = value.substring(4, 6);
								var day = value.substring(6, 8);
								var hour = value.substring(8, 10);
								var minute = value.substring(10, 12);
								//var second = value.substring(12, 14);
								return year + '년 ' + month + '월 ' + day + '일 ' + hour + ':' + minute;
							}
							return '';
						};

						var reserTpFlag = false;

						$('[data-popup-information-shelter="sttlmMtDtm"]').empty();
						$('[data-area-name="reservation-popup-copy-mid-w"]').hide();

						$.each(dat.sttlmMtDtms, function(i, item){
							if(item.reserTp == 'W'){
								$('[data-popup-information-shelter="sttlmMtDtm"]').append('<em>' + item.prdNm + '</em>의 대기신청이 완료되었습니다.<br>');
								$('[data-area-name="reservation-popup-copy-mid-w"]').css('display', '');
							}
							else{
								reserTpFlag = true;
								$('[data-popup-information-shelter="sttlmMtDtm"]').append('<em>' + item.prdNm + '</em>의 결제 만기일시는 <em>' + ymdhm(item.sttlmMtDtm2) + '</em> 까지 입니다.<br>');
							}
						});

						if(reserTpFlag){
							$('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').css('display', '')
								.siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').hide();

							$('[data-popup-information-shelter="sttlmMtDtm"]').append('미 결제시 자동 취소되니 유의 하시기 바랍니다.');
						}
						else{
							$('#reservation-information1-shelter [data-area-name="reservation-popup-container-w"]').css('display', '')
								.siblings('#reservation-information1-shelter [data-area-name="reservation-popup-container"]').hide();
						}

						$('[data-popup="reservation-information1-shelter"]').trigger('click');
					}
					else{
						$('[data-popup="reservation-information1-shelter"]').trigger('click');
					}

				} else {

					alertPopup({
						title:'안내',
						subTitle:'안내',
						content: dat.resultMsg,
						type:'error'
					});

					var $popup = $('#automatic-character-shelter');
					var $popupContainer = $('[data-template-id="popup-container-template"]');
					$popupContainer.find('[data-popup-btn="cancel"]').on('click', function(){$popup.find('.btn-close').trigger('click');});
					$popupContainer.find('[data-popup-btn="cancel"]').click();

				}
			},
			error : function(){
				toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.","메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
			}
		});
	};

	window.automaticCharacterShelter = function(){

		var templateParam = {};

		templateParam.prds = selectedPrds();

		if(!templateParam.prds || $.isEmptyObject(templateParam.prds)){
			toastrMsg("예약건을선택해주세요", "메세지", "e");
			return false;
		}
		templateParam.isGreenpoint = window.isGreenpoint;
		if(window.isGreenpoint == 'Y'){

			templateParam.priceSum = 0;

			$.each(templateParam.prds, function(i, item){

				templateParam.priceSum += commn.toNumber(item.salAmt);
			});

			if(templateParam.priceSum <= commn.toNumber($('[type="hidden"][name="greenpoint"]').val())){
				templateParam.greenPossi = 'Y';
			}
		}

		var $popup = $('#automatic-character-shelter');
		var $popupContainer = $('[data-template-id="popup-container-template"]');

		var source = $('#' + $popupContainer.data('template-id')).html();
		var template = Handlebars.compile(source);

		$popupContainer.html(template(templateParam));

		$("#pnlRsrImg").html("");
		$("#pnlRsrImg").append("<img alt='자동예약 방지문자'/>").find("img:last").attr("src", "/reserCaptcha.do?dummy=" + (new Date()).getTime());

		$popup.find(".popup-wrap").css("top", "auto");

		$('[data-popup="' + $popup.attr('id') + '"]').trigger('click');

		$('.captcha-area input[name="captcha"]').focus();

		$popupContainer.find('[data-popup-btn="confirm"]').on('click', reserStart);
		$popupContainer.find('[data-popup-btn="cancel"]').on('click', function(){$popup.find('.btn-close').trigger('click');});
	};

	var bindEvents = function () {

		$('a[data-dept-id][data-dept-nm]').closest('li').on('click', function () {

			var $this = $(this).find('a[data-dept-id][data-dept-nm]');
			var deptId = $this.data('dept-id');
			var deptNm = $this.data('dept-nm');
			var psbCnt = $this.data('psb-cnt');

			if (deptId) {

				//location.href = '/usr/reservation/searchSimpleShelterReservation.do?deptId=' + deptId;

				var activeTab = $this.attr('href');

				var param = {};
				param.deptId = deptId;
				param.deptNm = deptNm;
				param.isGreenpoint = window.isGreenpoint;

				NetFunnel_Action({action_id: 'reservation1'}, function (ev, ret) {
					commn.callAjax({
						'url': '/reservation/shelter/tabShelter.do',
						'data': param,
						'dataType': 'html'
					})
					.done(function (res) {
						$('[data-area-name="title-area-label"]').html('<i class="icon-location"></i>' + deptNm);
						$('[data-area-name="title-area-title"]').html(deptNm + ' 대피소 예약현황');
						$('[data-area-name="table-reservation"]').html(res);
						$.each($('[type="checkbox"][data-td-sch]'), function () {

							$('#tdSch' + $(this).data('td-sch')).addClass('start selected');
						});
						$.scrollTable();

						$('[data-area-name="psb-cnt"]').html(psbCnt);
						NetFunnel_Complete();
					})
					.fail(function () {
						//$("#loadingImage").hide();
						toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.", "메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
					});
				});
			}
		});

		$('#check1-1').on('change', function () {

			if ($(this).prop('checked')) {

				$('[type="checkbox"][data-td-sch]').prop('checked', true);
			} else {

				$('[type="checkbox"][data-td-sch]').prop('checked', false);
			}
		});

		/* 선택건 체크박스 */
		$('body').on('change', '[type="checkbox"][data-td-sch]', function () {

			var checked = true;

			$.each($('[type="checkbox"][data-td-sch]'), function () {

				if (!$(this).prop('checked')) {

					checked = false;
				}
			});
			$('#check1-1').prop('checked', checked);
		});

		/* 선택건 인원수 변경 */
		$('body').on('change', '[type="radio"][data-td-sch]', function (e) {

			var priceSum = 0;
			var $payment = $('[data-template-id="prd-payment-template"]');

			$payment.empty();

			$.each($('[type="radio"][data-td-sch]:checked'), function (i) {

				var $prd = $('#check-' + $(this).data('td-sch'));

				var rsrvtQntt = $(this).val();
				var price = $prd.data('added-price') || '';
				var pricePer = 0;
				price = Number(price);
				rsrvtQntt = Number(rsrvtQntt);
				pricePer = price * rsrvtQntt;
				priceSum = priceSum + pricePer;
				//$("#price").html(numberWithCommas(price * $(this).val()));

				var param = {};

				param.flag = $('.payment').html() ? 'Y' : 'N'; //두번째 row부터 border
				param.ymdUseDt = $prd.data("added-use-dt") || '';
				param.crtrDow = $prd.data('added-crtr-dow') || '';
				param.price = numberWithCommas(pricePer);
				param.parkNm = $prd.data("added-park-nm") || '';
				param.updNm = $prd.data("added-upd-nm") || '';
				param.fcltNm = $prd.data("added-fclt-nm") || '';
				param.rsrvtQntt = rsrvtQntt || '';
				param.ymdUseDt = String(param.ymdUseDt).replace(/\s/gi, "").replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');

				if ($('[type="radio"][data-td-sch]:checked').length == (i + 1)) {

					param.priceSum = priceSum;
					param.finalPayment = 'Y';
				}

				var source = $('#' + $payment.data('template-id')).html();
				var template = Handlebars.compile(source);
				$payment.append(template(param));
			});
		});


		$('[data-prd-btn="refresh"]').on('click', function () {

			$('#check1-1').prop('checked', false);
			$('[data-template-id="prd-payment-template"]').empty();
			$('[data-template-id="selected-prds-template"]').empty();
			$('li.is-active a[data-dept-id][data-dept-nm]').trigger('click');
		});

		/* 선택건 삭제 */
		$('[data-prd-btn="delete"]').on('click', function () {

			var removeRow = function (tdSch) {

				$('#tdSch' + tdSch).removeClass('start selected');
				//var hasRow = false;
				$.each($('[type="checkbox"][data-td-sch]'), function () {

					if (tdSch == $(this).data('td-sch')) {

						$(this).closest('tr').remove();

						$('[type="radio"][data-td-sch]:checked').eq(0).trigger('change');

						if (!$('[type="radio"][data-td-sch]').length) {

							$('#check1-1').prop('checked', false);
							$('[data-template-id="prd-payment-template"]').empty();
							$('[data-prd-btn="register"]').removeClass('is-active').html('예약하기');
						}
						//hasRow = true;
						return false;
					}
				});
				//if(hasRow){
				//	return false;
				//}
			};
			$.each($('[type="checkbox"][data-td-sch]:checked'), function () {
				removeRow($(this).data('td-sch'));
			});

			if ($('[type="checkbox"][data-td-sch]').length) {

				var reserData = $.grep($('[type="checkbox"][data-td-sch]'), function (n, i) {
					return $(n).data('added-reser-tp') == 'R'
				});
				if (reserData && !$.isEmptyObject(reserData)) {

					$('[data-prd-btn="register"]').html('예약하기');
				} else {

					$('[data-prd-btn="register"]').html('대기예약하기');
				}
			}
		});

		$('[data-prd-btn="register"]').on('click', function () {

			/*if($(this).data('login-yn') != 'Y'){
				
				confirmPopup({
	                title:'예약불가 안내',
	                subTitle:'예약이 불가 합니다.',
	                content:'예약하기는 로그인시 이용할 수 있습니다. 로그인하시겠습니까?',
	                retUrl:'/mmb/mmbLogin.do?retUrl=' + window.location.pathname,
	                type:'error'
	            });
				
				return false;
			}*/
			if (window.isGreenpoint == 'Y') {

				window.automaticCharacterShelter();
			} else {

				commn.callAjax({
					'url': '/reservation/auth.do',
					/* 'data': param, */
					'dataType': 'json'
				})
					.done(window.automaticCharacterShelter)
					.fail(function (e) {

						if (e.status == '401') {

							loginPopup('window.automaticCharacterShelter();');
						} else {

							toastrMsg("일시적으로 장애가 발생하였습니다. 잠시 후 다시 시도하여 주시기 바랍니다.", "메세지"); //<br />원활한 서비스를 위해 최선을 다하겠습니다.
						}
					});
			}

		});

		$('[data-area-name="table-reservation"]').on('click', 'table tbody tr td', function (event) {

			let reserTp = $(this).find('.icon-waiting').data('reser_tp');

			//대기신청일때 선택된것중 R이 있는지 체크
			if(reserTp =='W'){
				for(let i=0; i<$(".selectShelter").length; i++){
					if("R" == $(".selectShelter").eq(i).data('addedReserTp')){
						toastrMsg('동일날짜에 대기와 예약건을 동시에 신청할 수 없습니다.');
						return false;
					};
				}
			}

			if (isReserveValidate != "Y") {
				toastrMsg("현재는 예약하실 수 없습니다. 대피소예약 기능 보완 중입니다.", "메세지", "e");
				return;
			}
			var $this = $(this).find('[data-prd-id]');

			if (!$this.length) {
				return false;
			}

			var reser_tp = $this.data("reser_tp");
			var updNm = $this.data("upd-nm");
			var fcltNm = $this.data("fclt-nm");
			var deptId = $this.data("dept-id");
			var prdId = $this.data("prd-id");
			var use_dt = $this.data("use_dt") || '';
			var rsvtCnt = $this.data("rsvt-cnt");
			price = $this.data("price");

			var crtrDow = $this.data('crtr-dow');

			var ymdUseDt = String(use_dt).replace(/\s/gi, "").replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
			var tdSch = $this.closest('td').attr('id').replace('tdSch', '');

			var $selectedPrd = $('[data-template-id="selected-prds-template"]');

			if ($selectedPrd.find('tr').length >= maxLen) {

				return false;
			}

			var hasRow = false;
			var $added = $selectedPrd.find('tr [type="checkbox"][data-td-sch]');
			var $dupDeptNotB01 = $.grep($added, function (n, i) {
				return commn.nvl($(n).data('added-dept-id')).substring(0, 3) != 'B01';
			});

			var maxLen = $dupDeptNotB01.length ? 2 : 3; //최대 선택가능 지리산만 3

			if (commn.nvl(deptId).substring(0, 3) != 'B01') { //지리산이 아니면 2 지리산만 3
				maxLen = 2;
			}

			if ($added.length >= maxLen) {
				if(maxLen==2){
					toastrMsg("한번에 최대 " + maxLen + "건까지 추가할 수 있습니다.<br>지리산 종주는 3건까지 가능합니다.", "메세지", "e");
				}else{
					toastrMsg("한번에 최대 " + maxLen + "건까지 추가할 수 있습니다.", "메세지", "e");
				}
				return false;
			}

			$.each($added, function () {

				if ($(this).closest('[data-use-dt]').data('use-dt') == use_dt && reserTp != 'W') {		//대기는 동일날짜 시설 선택 가능함
					toastrMsg("동일날짜의 시설은 선택할 수 없습니다.", "메세지", "e");
					hasRow = true;
					return false;
				}

/*
 연박체크 제거(2022-09-01 / KHYoo)
				if ($(this).data('prd-id') == prdId) {
					if (commn.date_add($(this).data('added-ymd-use-dt'), 1) == ymdUseDt || commn.date_add($(this).data('added-ymd-use-dt'), -1) == ymdUseDt) {
						toastrMsg("동일시설은 연박으로 선택할 수 없습니다.", "메세지", "e");
						hasRow = true;
						return false;
					}
				}
*/				
			});


			if (hasRow) {
				return false;
			}
			$this.closest('td').addClass('start selected');
			$("#shelterNDP").html("<span class='b'>" + fcltNm + "</span>");
			$("#doe").html(String(use_dt).substring(0, 4) + "년 " + String(use_dt).substring(4, 6) + "월 " + String(use_dt).substring(6) + "일");
			$("#price").html(numberWithCommas(price));

			var source = $('#' + $selectedPrd.data('template-id')).html();
			var template = Handlebars.compile(source);
			var templateParam = {};
			templateParam.tdSch = tdSch;
			templateParam.updNm = updNm;
			templateParam.fcltNm = fcltNm;
			templateParam.ymdUseDt = ymdUseDt;
			templateParam.crtrDow = crtrDow;
			templateParam.useDt = use_dt;
			templateParam.prdId = prdId;
			templateParam.deptId = deptId;
			templateParam.price = price;
			templateParam.reserTp = reser_tp;
			templateParam.rsvtCnt = rsvtCnt;

			$selectedPrd.append(template(templateParam));

			if ($selectedPrd.length) {

				$selectedPrd.html(
					$selectedPrd.find('tr[data-use-dt]').sort(function (a, b) {
						return $(a).data('use-dt') - $(b).data('use-dt');
					})
				);
			}

			$('[data-prd-btn="register"]').addClass('is-active');

			var registerText = '대기예약하기';

			$.each($('[type="checkbox"][data-td-sch]'), function () {

				if ($(this).data("added-reser-tp") == 'R') {
					registerText = '예약하기';
				}
			});
			$('[data-prd-btn="register"]').html(registerText);

			$("#reservDiv").focus();

			$('[type="radio"][data-td-sch]:checked').eq(0).trigger('change');
		});
	};

	bindEvents();

	if(window.isGreenpoint != 'Y'){
		$('a[data-dept-id][data-dept-nm]').eq(0).closest('li').trigger('click');
	}
});
var a ;