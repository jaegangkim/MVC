<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(()=>{
    	loadList();
    });
    function loadList(){
    	// 게시판 리스트를 가져오기
    	$.ajax({
    		url : "${cpath}/boardList.do", // boardList POJO로 간다
    		type : "get",
    		dataType : "json",// 서버에서 내려오는 데이터타입
    		success : resultHTML,
    		error : function(){alert('error');}
    	});
    }
    function resultHTML(data){ // 서버에서 응답받을때 받을 데이터 입력 [{},{}] 이런형식이니 반복문으로 처리
    	// 동적인 view 만들기
    	var html = "<table class='table table-bordered'>";
    	html += "<tr>";
    	html += "<td>번호</td>";
    	html += "<td>제목</td>";
    	html += "<td>작성자</td>";
    	html += "<td>작성일</td>";
    	html += "<td>조회수</td>";
    	html += "</tr>";
    	// index는 key, obj는 value
    	$.each(data, function(index, obj){
    		html += "<tr>";
        	html += "<td>"+obj.num+"</td>";
        	html += "<td id='t"+obj.num+"'><a href='javascript:goView("+obj.num+")'>"+obj.title+"</a></td>";
        	html += "<td>"+obj.writer+"</td>";
        	html += "<td>"+obj.indate+"</td>";
        	html += "<td id = 'cnt"+obj.num+"'>"+obj.count+"</td>";
        	html += "</tr>";
        	
        	html += "<tr id = 'ct"+obj.num+"'style = 'display:none'>";
        	html += "<td>내용</td>";
        	html += "<td colspan = '4'>";
        	html += "<textarea id ='ta"+obj.num+"'readonly rows = '7' class = 'form-control'>" + obj.content+ "</textarea>";
        	html += "<br>";
        	html += "<span id = 'ub"+obj.num+"'><button class = 'btn btn-sm btn-info' onclick = 'goUpdateForm("+obj.num+")'>수정</button></span>&nbsp"
        	html += "<button class = 'btn btn-sm btn-warning' onclick = 'goDel("+obj.num+")'>삭제</button>&nbsp"
        	html += "<button class = 'btn btn-sm btn-success' onclick = 'loadList()'>리스트</button>"
        	html += "</td>";
        	html += "</tr>";
    	}); // jquery반복문, 익명함수 / data를 꺼내 function에 넣어주는 것
    	html += "<tr>"
    	html += "<td colspan = '5'>"
    	html += "<button onclick = 'goWrite()' class = 'btn btn-sm btn-primary'>글쓰기</button>"
    	html += "<td>"
    	html += "</tr>"
    	html += "</table>";
    	$('#list').html(html);
    	// list
    	$('#list').css("display", "block"); // 안보이게 하기
    	$('#write').css("display", "none"); // 안보이게 하기
    }
    function goWrite(){
    	$('#list').css("display", "none");
    	$('#write').css("display", "block");
    	
    }
    function goInsert(){
    	// title, content, writer
    	// var title = $('#title').val();
    	// form에 있는 모든 파라미터(name)를 한번에 가져오기 : serialize
    	var fData = $('#frm').serialize(); // title=333&content=333&writer=333
    	$.ajax({
    		url : "${cpath}/boardWrite.do",
    		type : "post",
    		data : fData,
    		success : loadList,
    		error : function(){alert("error");}
    	})
    	$("#reset").trigger("click"); // trigger : click이라는 이벤트를 발생시켜라 글쓴 후 값 제거
    }
    function goView(num){
    	if($("#ct"+num).css("display")=="none"){ //get동작
    		$("#ct"+num).css("display", "table-row"); // 테이블 보이게
    		// 조회수 올리기
    		$.ajax({
    			url:"${cpath}/boardView.do",
    			type : "get",
    			data : {"num":num},
    			sucess : function(count){
					$("#cnt"+num).text(count);
    			},
    			error : function(){alert("error");}
    		})
    	}else{
    		$("#ct"+num).css("display", "none"); // 테이블 보이게 // set동작		
    	}
    }
    function goDel(num){
    	$.ajax({
    		url : "${cpath}/boardDelete.do",
    		type : "get",
    		data : {"num" : num},
    		success : loadList,
    		error : function(){alert("error");}
    	});
    }
    function goUpdateForm(num){
    	// 제목 수정
    	var title = $("#t" + num).text();
    	var titleInput = "<input type ='text' id = 'nt"+num+"' value = '"+title+"' class='form-control'/>"
    	$("#t" + num).html(titleInput);
    	// textarea readonly 해제
    	$("#ta"+num).attr("readonly",false);
    	// 수정버튼 -> 수정하기버튼 변경
    	var updateBtn = "<button onclick = 'goUpdate("+num+")' class = 'btn btn-sm btn-primary'>수정하기</button>";
    	$("#ub"+num).html(updateBtn);
    }
    function goUpdate(num){
    	var title = $("#nt"+num).val();
    	var content = $("#ta"+num).val();
    	$.ajax({
    		url : "${cpath}/boardUpdate.do",
    		type : "post",
    		data : {"num":num, "title":title, "content":content},
    		success : loadList,
    		error : function(){alert("error");}
    	})
    }
  </script>
</head>
<body>
	<jsp:include page="../header/header.jsp" />
	<div class="container">
		<h2>MVC06</h2>
		<div class="panel panel-default">
			<div class="panel-heading">
			  <c:if test="${empty mvo}"> <!-- mvo가 하나이기에 sessionScope.mvo에서 앞에 생략 -->
				<form class="form-inline" action="${cpath}/login.do"> <!-- 회원인증 실패 시 폼 -->
					<div class="form-group">
						<label for="memId">ID:</label> <input type="text"
							class="form-control" name="memId">
					</div>
					<div class="form-group">
						<label for="memPwd">Password:</label> <input type="password"
							class="form-control" name="memPwd">
					</div>
					<button type="submit" class="btn btn-default">로그인</button>
				</form>
			  </c:if>
			  <c:if test="${!empty mvo}">
			  	<form class="form-inline" action="${cpath}/logout.do"> <!-- 회원인증 실패 시 폼 -->
					<div class="form-group">
						<label for="memId">${mvo.memName }님 방문을 환영합니다.</label>
					</div>
					<button type="submit" class="btn btn-default">로그아웃</button>
				</form>
			  </c:if>
			</div>
			<div class="panel-body" id="list"></div>
			<div class="panel-body" id="write" style="display: none">
				<form id="frm">
					<table class="table table-bordered">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" id="title"
								class="form-control"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="10" cols="" name="content" id="content"
									class="form-control"></textarea></td>
							<!-- cols는 formconrol로 자동으로 맞춰준다 -->
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer" id="writer"
								class="form-control"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-success btn-sm"
									onclick="goInsert()">등록</button> <!-- form안에서의 button은 기본이 submit이다 -->
								<button type="reset" class="btn btn-warning btn-sm" id="reset">취소</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="panel-footer">Sprint특화과정A_김민우</div>
		</div>
	</div>
	<script>
	
</script>
</body>
</html>