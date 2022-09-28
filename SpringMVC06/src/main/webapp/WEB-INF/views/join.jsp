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
	<div class="panel panel-default">
	  <div class="panel-heading">회원가입</div>
	  <div class="panel-body">
		<form class="form-horizontal" action="" method="post">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="id">Id:</label>
		    <div class="col-sm-10">
		      <input type="text" name="id" class="form-control" id="id" placeholder="Enter id">
		      <button type="button" id="idCheck" class="btn btn-sm btn-info">중복체크</button>
		      <!-- 버튼에 type버튼 안하면 submit이 디폴트로 들어감 -->
		      <span id="idResult"></span>
		    </div> 
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="pwd">Password:</label>
		    <div class="col-sm-10">
		      <input readonly="readonly" type="password" name="pw" class="form-control join" id="pwd" placeholder="Enter password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="nick">Nick:</label>
		    <div class="col-sm-10">
		      <input readonly="readonly" type="text" name="nick" class="form-control join" id="nick" placeholder="Enter nick">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="phone">Phone:</label>
		    <div class="col-sm-10">
		      <input readonly="readonly" type="tel" name="phone" class="form-control join" id="phone" placeholder="Enter phone">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="add">Address:</label>
		    <div class="col-sm-10">
		      <input readonly="readonly" type="tel" name="add" class="form-control join" id="add" placeholder="Enter address">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">Submit</button>
		    </div>
		  </div>
		</form>
	  </div>
	</div>
	
	<script type="text/javascript">
		$('.join').on('click',function(){
			var text = $(this).attr('readonly');
			if(text=="readonly"){
				alert("아이디 중복체크를 먼저 해주세요.")
			}
		});
		
		$('#idCheck').on('click',function(){
			var id =$('#id').val();
			$.ajax({
				url:"idCheck.do",
				data:{id:id},  // json표현방식
				method:"POST",
				dataType:"json",  // 가져 올 데이터 타입
				success: idCheck,
				error:function(e){  // 에러에 매개변수 넣으면 에러원인이 담김
					console.log(e);
					console.log("통신실패");
				}
			});
		})
		
		function idCheck(data){
			console.log(data);
			if(data.id == "null"){
				$('#idResult').html("사용 가능");
				$('#idResult').css("color","blue");
				$('.join').removeAttr('readonly');
			}else{
				$('#idResult').html("사용 불가능");
				$('#idResult').css("color","red");
				$('.join').attr('readonly','readonly');
			}
		}
	</script>
	
</body>
</html>