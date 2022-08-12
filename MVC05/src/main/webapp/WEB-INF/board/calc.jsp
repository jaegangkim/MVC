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
  			let su1=$("#su1").val();
  			let su2=$("#su2").val();
  			// 서버와 통신(/calc.do)
  			$.ajax({
  				url:"${cpath}/calc.do",
  				type:"get",
  				data:{"su1":su1,"su2":su2},
  				success:resultHtml,
  				error:function(){alert("error");}
  			});
  			
  		})
  	});
  	function resultHtml(data){
			$("#result").html("<font color='red'>"+data+"</font>");
		}
  </script>
  
</head>
<body>
 <jsp:include page="../header/header.jsp"/>
<div class="container">
  <h2>MVC05</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body">
    	<input type="text" id="su1"/>+<input type="text" id="su2"/>
    	<button id="btn">계산</button>
    	<div id="result">결과</div>
    	</div>
    <div class="panel-footer">Spring특화과정A_김재강</div>
  </div>
</div>

</body>
</html>
