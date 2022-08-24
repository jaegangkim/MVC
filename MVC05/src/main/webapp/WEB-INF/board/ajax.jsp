<!-- AI기반 서비스 트랙 spring특화 A 김재강 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	
  	$(document).ready(()=>{
  		$("#btn").click(function(){
  			let su=$("#su").val();
  			$.ajax({
  				url:"${cpath}/ajax.do",
  				type:"get",
  				data:{"su":su},
  				success:resultHtml,
  				error:function(){alert("error");}
  			});
  			
  		})
  	});
		
  </script>
  
</head>
<body>
    <div class="panel-body">
    	<input type="text" id="su"/>
    	<button id="btn">계산</button>
    	<div id="result">결과</div>
    </div>

</body>
</html>
