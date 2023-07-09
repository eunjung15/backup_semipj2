/**
 * 
 */
$(function() {
		//직접입력을 선택하면 email3 텍스트 상자가 보이게
		$("#email2").change(function() {
			if ($("#email2").val() == "etc") {
				$("#email3").val("");
				$("#email3").css("visibility", "visible");
				$("#email3").focus();
			} else {
				$("#email3").css("visibility", "hidden");
			}
		});

		//아이디 중복확인 팝업창 
		$('#btnChkId').click(function(){
	    	var id=$('#userid').val();
	        open('checkId.jsp?userid='+id,'dup',
	        	'width=590,height=300,location=yes,resizable=yes,left=0,top=0');
	    });
		
		//우편번호 찾기 팝업창
		$('#btnZipcode').click(function(){            
			window.open('zipcode/zipcode.jsp','zipcode',
			'width=700,height=800,location=yes,resizable=yes,left=0,top=0');
	    });
		
});

	function validate_hp(ph) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(ph); //정규식과 일치하면 true
		/* 정규식 /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복		 */
	}

	function validate_userid(uid) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(uid);
		/*
		정규식 /^[a-zA-Z0-9_]+$/g
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미	 */
	}