<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<button class="btn btn-success">로그인</button>
	<a href="join.do"><button class="btn btn-info">회원가입</button></a>
	<button id="list" class="btn btn-warning">회원목록보기</button>
	<div id="info">
	
	</div>
	
	<script type="text/javascript">
		$('#list').on('click',function(){
			$.ajax({
				url:"memberList.do",
				method:"POST",
				dataType:"JSON",   // 디폴트 : text'
				success:memberList,
				error:function(e){
					console.log(e);
					console.log("통신실패");
				}
			});
		})
		function memberList(data){
			var result = "<table class='table'>";
			result+="<tr><td>번호</td>";
			result+="<td>아이디</td><td>비밀번호</td>";
			result+="<td>닉네임</td><td>전화번호</td>";
			result+="<td>주소</td></tr>";
			for(var i =0;i<data.length; i++){
				result+="<tr>";
				result+="<td>"+ (i+1) +"</td>";
				result+="<td>"+ data[i].id +"</td>";
				result+="<td>"+ data[i].pw +"</td>";
				result+="<td>"+ data[i].nick +"</td>";
				result+="<td>"+ data[i].phone +"</td>";
				result+="<td>"+ data[i].addr +"</td>";
				result+="</tr>";
			}
			result+="</table>";
			$("#info").html(result);
		}
	</script>
	
</body>
</html>