<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="js/bootstrap.js"></script>
  <title>Document</title>
  <style>
    .container {
      width: 30%;
    }
  </style>
</head>

<body>
  <h3 align=center>회원가입</h3>
  <p align=center>Welcome! 무지출 챌린지에 오신걸 환영합니다.</p>
  <div align=center>
    <!--개인정보 보호법 textarea-->
    <textarea rows='8' cols=" 70">제1조(목적) 이 법은 개인정보의 처리 및 보호에 관한 사항을 정함으로써 개인의 자유와 권리를 보호하고, 나아가 개인의 존엄과 가치를 구현함을 목적으로 한다.

    제6조(다른 법률과의 관계) 개인정보 보호에 관하여는 다른 법률에 특별한 규정이 있는 경우를 제외하고는 이 법에서 정하는 바에 따른다.

    제68조(권한의 위임·위탁) ① 이 법에 따른 행정안전부장관 또는 관계 중앙행정기관의 장의 권한은 그 일부를 대통령령으로 정하는 바에 따라 특별시장, 광역시장, 도지사, 특별자치도지사 또는 대통령령으로 정하는
    전문기관에 위임하거나 위탁할 수 있다.
    ② 제1항에 따라 행정안전부장관 또는 관계 중앙행정기관의 장의 권한을 위임 또는 위탁받은 기관은 위임 또는 위탁받은 업무의 처리 결과를 행정안전부장관 또는 관계 중앙행정기관의 장에게 통보하여야 한다.
    ③ 행정안전부장관은 제1항에 따른 전문기관에 권한의 일부를 위임하거나 위탁하는 경우 해당 전문기관의 업무 수행을 위하여 필요한 경비를 출연할 수 있다.[4]

    제69조(벌칙 적용 시의 공무원 의제) 행정안전부장관 또는 관계 중앙행정기관의 장의 권한을 위탁한 업무에 종사하는 관계 기관의 임직원은 「형법」 제129조부터 제132조까지의 규정을 적용할 때에는 공무원으로
    본다.</textarea>
    <br>
    <input type="checkbox">동의하기
    <br><br><br>
  </div>
  <form action="signup.do" align=center>
    <!--ID 입력 영역-->
    <div class="form-group">
      <input name="mb_id" type="text" placeholder="원하시는ID를 입력하세요">
      <input type="button" value="중복">
    </div><br>
    <!--닉네임 입력 영역-->
    <div class="form-group">
      <input name="mb_name" type="text" placeholder="원하시는 NickName를 입력하세요">
      <input type="button" value="중복">
    </div><br>

    <!--비밀번호 입력 영역-->
    <div class="form-group">
      <input name="mb_pw" type="password" placeholder="pw8자이상 적어주세요">
      <input type="button" value="중복">
    </div>
    <br>
    <div class="form-group">
      <input type="text" placeholder="E-mail을 입력하세요">
      <input type="button" value="중복">
    </div><br>
    <button type="submit" class="btn btn-default">회원가입 완료</button>
  </form>
</body>

</html>