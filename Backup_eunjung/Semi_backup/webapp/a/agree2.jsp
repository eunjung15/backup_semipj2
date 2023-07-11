<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
//체크박스 전체 선택
$(".form-check form-switch").on("click", "#flexSwitchCheckDefault", function () {
    $(this).parents(".orm-check form-switch").find('input').prop("checked", $(this).is(":checked"));
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
});
</script>

<div class="checkbox_group">

  <input type="checkbox" id="check_all" >
  <label for="check_all">전체 동의</label>
  
  <input type="checkbox" id="check_1" class="normal" >
  <label for="check_1">개인정보 처리방침 동의</label>
  
  <input type="checkbox" id="check_2" class="normal" >
  <label for="check_2">서비스 이용약관 동의</label>
  
  <input type="checkbox" id="check_3" class="normal" >
  <label for="check_3">마케팅 수신 동의</label>
  
</div>

<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="check_all">
  <label class="form-check-label" for="flexSwitchCheckDefault">
  Default switch checkbox input</label>
</div>
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
  <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch checkbox input</label>
</div>
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDisabled" disabled>
  <label class="form-check-label" for="flexSwitchCheckDisabled">Disabled switch checkbox input</label>
</div>
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckCheckedDisabled" checked disabled>
  <label class="form-check-label" for="flexSwitchCheckCheckedDisabled">Disabled checked switch checkbox input</label>
</div>
